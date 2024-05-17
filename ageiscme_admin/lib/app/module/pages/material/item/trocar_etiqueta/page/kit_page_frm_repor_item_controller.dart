import 'package:ageiscme_data/services/repor_item_kit/repor_item_kit_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/kit/repor_item_kit/repor_item_kit_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/repor_item_kit_response/repor_item_kit_response_dto.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class KitPageFrmReporItemController {
  final KitModel kit;
  final BuildContext context;
  late final ReporItemKitDTO dto;

  FocusNode textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: (str) => onRead(str, context),
  );

  KitPageFrmReporItemController({
    required this.kit,
    required this.context,
  }) {
    dto = ReporItemKitDTO(codKit: kit.cod!);
  }

  void cancelarReposicao(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  Future onRead(String barCode, BuildContext context) async {
    if (barCode == 'Cancelar') {
      cancelarReposicao(context);
      return;
    }
    if (dto.codMotivo == 0 || dto.codMotivo == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Selecione um motivo para reposição do item de kit!',
      );
      return;
    }

    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    dto.codUsuario = authentication!.usuario!.cod!;
    dto.codBarraItem = barCode;

    (String, ReporItemKitResponseDTO)? result =
        await ReporItemKitService().reporItemKit(dto);
    if (result == null) return;

    ToastUtils.showCustomToastSucess(context, result.$1);

    Navigator.of(context).pop(true);
  }
}

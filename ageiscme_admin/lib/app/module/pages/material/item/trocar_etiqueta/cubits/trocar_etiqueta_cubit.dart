import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_base_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/cubits/etiqueta_lida_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/states/etiqueta_base_state.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/trocar_etiqueta/states/trocar_etiqueta_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/item/trocar_etiqueta/item_trocar_etiqueta_dto.dart';
import 'package:ageiscme_models/response_dto/item/trocar_etiqueta/item_trocar_etiqueta_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class TrocarEtiquetaCubit extends Cubit<TrocarEtiquetaState> {
  TrocarEtiquetaCubit() : super(TrocarEtiquetaState());

  Future trocarEtiqueta(BuildContext context) async {
    String? etiquetaLida =
        BlocProvider.of<EtiquetaLidaCubit>(context).state.str;
    if (etiquetaLida == null || etiquetaLida.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Leia uma etiqueta para realizar a troca',
      );
      return;
    }
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    if (authentication?.usuario?.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Sessão perdida, reacesse o sistema para continuar',
      );
      return;
    }

    EtiquetaBaseState stateEtiquetaBase =
        BlocProvider.of<EtiquetaBaseCubit>(context).state;

    ItemService itemService = Modular.get<ItemService>();
    ItemTrocarEtiquetaDTO obj = ItemTrocarEtiquetaDTO(
      codBarraNovo: etiquetaLida,
      codBarraOriginal: stateEtiquetaBase.idEtiquetaBase,
      codUsuario: authentication!.usuario!.cod!,
    );
    LoadingController controller = LoadingController(context: context);
    (String, ItemTrocarEtiquetaResponseDTO)? result =
        await itemService.trocarEtiqueta(obj);
    if (result == null) {
      controller.closeDefault();
      return;
    }
    controller.closeDefault();
    Navigator.of(context).pop((true, result.$1, stateEtiquetaBase.codItem));
    ToastUtils.showCustomToastSucess(context, 'Etiqueta alterada com sucesso');
  }
}

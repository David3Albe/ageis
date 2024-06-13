import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/cubits/licenca_gerada_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/states/gerar_licenca_state.dart';
import 'package:ageiscme_data/services/gerar_licenca/gerar_licenca_service.dart';
import 'package:ageiscme_models/dto/gerar_licenca/gerar_licenca_dto.dart';
import 'package:ageiscme_models/response_dto/gerar_licenca/gerar_licenca_response_dto.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class GerarLicencaCubit extends Cubit<GerarLicencaState> {
  GerarLicencaCubit() : super(GerarLicencaState(dto: GerarLicencaDTO()));

  Future gerar({required BuildContext context}) async {
    bool confirmaGeracao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a geração da nova licença?',
    );
    if (!confirmaGeracao) return;

    BlocProvider.of<LicencaGeradaCubit>(context).change(licencaGerada: null);
    GerarLicencaDTO dto = BlocProvider.of<GerarLicencaCubit>(context).state.dto;
    GerarLicencaService service = Modular.get<GerarLicencaService>();
    LoadingController loading = LoadingController(context: context);
    (String, GerarLicencaResponseDTO)? result = await service.gerar(dto);
    if (result == null) {
      loading.closeDefault();
      return;
    }

    loading.closeDefault();
    BlocProvider.of<LicencaGeradaCubit>(context)
        .change(licencaGerada: result.$2);
    Navigator.of(context).pop((true, result.$1));
  }
}

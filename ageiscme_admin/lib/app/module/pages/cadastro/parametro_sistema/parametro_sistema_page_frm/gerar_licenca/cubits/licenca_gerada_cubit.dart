import 'package:ageiscme_admin/app/module/pages/cadastro/parametro_sistema/parametro_sistema_page_frm/gerar_licenca/states/licenca_gerada_state.dart';
import 'package:ageiscme_models/response_dto/gerar_licenca/gerar_licenca_response_dto.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/functions/clipboard/clipboard_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LicencaGeradaCubit extends Cubit<LicencaGeradaState> {
  LicencaGeradaCubit() : super(LicencaGeradaState());

  void change({
    required GerarLicencaResponseDTO? licencaGerada,
  }) {
    emit(LicencaGeradaState(licencaGerada: licencaGerada));
  }

  void copiar({
    required BuildContext context,
  }) {
    GerarLicencaResponseDTO? licencaGerada =
        context.read<LicencaGeradaCubit>().state.licencaGerada;
    if (licencaGerada?.licenca == null) {
      ToastUtils.showCustomToastNotice(
        context,
        'É necessário gerar a licença antes de copiar',
      );
      return;
    }
    ClipboardHelper.copy(
      text: licencaGerada!.licenca!,
      context: context,
    );
  }
}

import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class RegistroServicoPageFrmCubit extends Cubit<RegistroServicoPageFrmState> {
  final RegistroServicoService service;
  final RegistroServicoModel registroServicoModel;
  RegistroServicoPageFrmCubit({
    required this.service,
    required this.registroServicoModel,
  }) : super(
          RegistroServicoPageFrmState(registroServico: registroServicoModel),
        );

  Future save(
    RegistroServicoModel registroServico,
    void Function(String) onSaved,
    BuildContext context,
  ) async {
    try {
      (String message, RegistroServicoModel registroServico)? result =
          await service.save(registroServico);
      if (result == null) return;
      registroServico.cod = result.$2.cod;
      registroServico.tstamp = result.$2.tstamp;
      ToastUtils.showCustomToastSucess(context, result.$1);
      onSaved(result.$1);

    } on Exception catch (ex) {
      emit(
        RegistroServicoPageFrmState(
          error: ex.toString(),
          registroServico: registroServico,
        ),
      );
    }
  }

  void clear() {
  }
}

class RegistroServicoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final RegistroServicoModel registroServico;

  RegistroServicoPageFrmState({
    required this.registroServico,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}

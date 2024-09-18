import 'package:ageiscme_data/services/atestado_saude_ocupacional/atestado_saude_ocupacional_service.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalPageFrmCubit
    extends Cubit<AtestadoSaudeOcupacionalPageFrmState> {
  final AtestadoSaudeOcupacionalService service;
  final AtestadoSaudeOcupacionalModel atestadoSaudeOcupacionalModel;
  AtestadoSaudeOcupacionalPageFrmCubit({
    required this.service,
    required this.atestadoSaudeOcupacionalModel,
  }) : super(
          AtestadoSaudeOcupacionalPageFrmState(
            atestadoSaudeOcupacional: atestadoSaudeOcupacionalModel,
          ),
        );

  void save(
    AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional,
    final void Function() onSaved,
    BuildContext context,
  ) async {
    try {
      (
        String message,
        AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional
      )? result = await service.save(atestadoSaudeOcupacional);
      if (result == null) return;
      ToastUtils.showCustomToastSucess(context, result.$1);
      onSaved();
      emit(
        AtestadoSaudeOcupacionalPageFrmState(
          message: result.$1,
          saved: true,
          atestadoSaudeOcupacional: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        AtestadoSaudeOcupacionalPageFrmState(
          error: ex.toString(),
          atestadoSaudeOcupacional: atestadoSaudeOcupacional,
        ),
      );
    }
  }

  void clear() {
    emit(
      AtestadoSaudeOcupacionalPageFrmState(
        atestadoSaudeOcupacional: AtestadoSaudeOcupacionalModel.empty(),
      ),
    );
  }
}

class AtestadoSaudeOcupacionalPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional;

  AtestadoSaudeOcupacionalPageFrmState({
    required this.atestadoSaudeOcupacional,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}

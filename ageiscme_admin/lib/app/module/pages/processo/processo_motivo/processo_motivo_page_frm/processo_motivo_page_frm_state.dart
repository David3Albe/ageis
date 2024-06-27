import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoMotivoPageFrmCubit extends Cubit<ProcessoMotivoPageFrmState> {
  final ProcessoMotivoService service;
  final ProcessoMotivoModel processoMotivoModel;
  ProcessoMotivoPageFrmCubit({
    required this.service,
    required this.processoMotivoModel,
  }) : super(
          ProcessoMotivoPageFrmState(processoMotivo: processoMotivoModel),
        );

  void save(
    ProcessoMotivoModel processoMotivo,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ProcessoMotivoModel processoMotivo)? result =
          await service.save(processoMotivo);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ProcessoMotivoPageFrmState(
          message: result.$1,
          saved: true,
          processoMotivo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoMotivoPageFrmState(
          error: ex.toString(),
          processoMotivo: processoMotivo,
        ),
      );
    }
  }

  void clear() {
    emit(
      ProcessoMotivoPageFrmState(processoMotivo: ProcessoMotivoModel.empty()),
    );
  }
}

class ProcessoMotivoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ProcessoMotivoModel processoMotivo;

  ProcessoMotivoPageFrmState({
    required this.processoMotivo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}

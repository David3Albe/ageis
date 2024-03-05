import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoMotivoPageCubit extends Cubit<ProcessoMotivoPageState> {
  final ProcessoMotivoService service;
  ProcessoMotivoPageCubit({required this.service})
      : super(
          ProcessoMotivoPageState(
            processosMotivo: [],
            loading: false,
          ),
        );

  void loadProcessoMotivo() async {
    emit(ProcessoMotivoPageState(loading: true, processosMotivo: []));
    try {
      List<ProcessoMotivoModel> processosMotivo = await service.GetAll();
      emit(
        ProcessoMotivoPageState(
          loading: false,
          processosMotivo: processosMotivo,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoMotivoPageState(
          loading: false,
          processosMotivo: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ProcessoMotivoModel processoMotivo) async {
    try {
      (String, ProcessoMotivoModel)? result =
          await service.delete(processoMotivo);
      if (result == null) return;

      emit(
        ProcessoMotivoPageState(
          loading: false,
          processosMotivo: state.processosMotivo,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoMotivoPageState(
          loading: false,
          processosMotivo: state.processosMotivo,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ProcessoMotivoPageState {
  final bool loading;
  final bool deleted;
  final List<ProcessoMotivoModel> processosMotivo;
  final String error;
  final String message;

  ProcessoMotivoPageState({
    required this.loading,
    required this.processosMotivo,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}

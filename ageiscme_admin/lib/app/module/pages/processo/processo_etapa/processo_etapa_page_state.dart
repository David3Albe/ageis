import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoEtapaPageCubit extends Cubit<ProcessoEtapaPageState> {
  final ProcessoEtapaService service;
  ProcessoEtapaPageCubit({required this.service})
      : super(
          ProcessoEtapaPageState(
            processosEtapas: [],
            loading: false,
          ),
        );

  void loadProcessoEtapa() async {
    emit(ProcessoEtapaPageState(loading: true, processosEtapas: []));
    try {
      List<ProcessoEtapaModel> processosEtapas = await service.GetAll();
      emit(
        ProcessoEtapaPageState(
          loading: false,
          processosEtapas: processosEtapas,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoEtapaPageState(
          loading: false,
          processosEtapas: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ProcessoEtapaModel processoEtapa) async {
    try {
      (String, ProcessoEtapaModel)? result = await service.delete(processoEtapa);
      if (result == null) return;

      emit(
        ProcessoEtapaPageState(
          loading: false,
          processosEtapas: state.processosEtapas,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoEtapaPageState(
          loading: false,
          processosEtapas: state.processosEtapas,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ProcessoEtapaPageState {
  final bool loading;
  final bool deleted;
  final List<ProcessoEtapaModel> processosEtapas;
  final String error;
  final String message;

  ProcessoEtapaPageState({
    required this.loading,
    required this.processosEtapas,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}

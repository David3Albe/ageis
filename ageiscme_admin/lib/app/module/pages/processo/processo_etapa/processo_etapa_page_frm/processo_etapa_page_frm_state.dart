import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoEtapaPageFrmCubit extends Cubit<ProcessoEtapaPageFrmState> {
  final ProcessoEtapaService service;
  final ProcessoEtapaModel processoEtapaModel;
  ProcessoEtapaPageFrmCubit({
    required this.service,
    required this.processoEtapaModel,
  }) : super(
          ProcessoEtapaPageFrmState(processoEtapa: processoEtapaModel),
        );

  void save(
    ProcessoEtapaModel processoEtapa,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ProcessoEtapaModel processoEtapa)? result =
          await service.save(processoEtapa);
      if (result == null) return;
      onSaved(result.$1);
      emit(
        ProcessoEtapaPageFrmState(
          message: result.$1,
          saved: true,
          processoEtapa: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoEtapaPageFrmState(
          error: ex.toString(),
          processoEtapa: processoEtapa,
        ),
      );
    }
  }

  void clear() {
    emit(ProcessoEtapaPageFrmState(processoEtapa: ProcessoEtapaModel.empty()));
  }
}

class ProcessoEtapaPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ProcessoEtapaModel processoEtapa;

  ProcessoEtapaPageFrmState({
    required this.processoEtapa,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}

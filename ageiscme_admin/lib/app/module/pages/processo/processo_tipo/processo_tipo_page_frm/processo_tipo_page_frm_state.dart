import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoTipoPageFrmCubit extends Cubit<ProcessoTipoPageFrmState> {
  final ProcessoTipoService service;
  final ProcessoTipoModel processoTipoModel;
  ProcessoTipoPageFrmCubit({
    required this.service,
    required this.processoTipoModel,
  }) : super(
          ProcessoTipoPageFrmState(processoTipo: processoTipoModel),
        );

  void save(
    ProcessoTipoModel processoTipo,
    LoadingController loading,
    void Function(String) onSaved,
  ) async {
    try {
      (String message, ProcessoTipoModel processoTipo)? result =
          await service.save(processoTipo);
      loading.closeDefault();
      if (result == null) {
        return;
      }
      onSaved(result.$1);
      emit(
        ProcessoTipoPageFrmState(
          message: result.$1,
          saved: true,
          processoTipo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      loading.closeDefault();
      emit(
        ProcessoTipoPageFrmState(
          error: ex.toString(),
          processoTipo: processoTipo,
        ),
      );
    }
  }

  void clear() {
    emit(
      ProcessoTipoPageFrmState(
        processoTipo: ProcessoTipoModel.empty(),
      ),
    );
  }
}

class ProcessoTipoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final ProcessoTipoModel processoTipo;

  ProcessoTipoPageFrmState({
    required this.processoTipo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}

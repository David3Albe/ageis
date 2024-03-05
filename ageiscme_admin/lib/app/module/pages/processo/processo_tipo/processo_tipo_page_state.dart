import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoTipoPageCubit extends Cubit<ProcessoTipoPageState> {
  final ProcessoTipoService service;
  ProcessoTipoPageCubit({required this.service})
      : super(
          ProcessoTipoPageState(
            processosTipos: [],
            loading: false,
          ),
        );

  void loadProcessoTipo() async {
    emit(
      ProcessoTipoPageState(
        loading: true,
        processosTipos: [],
      ),
    );
    try {
      List<ProcessoTipoModel> processosTipos = await service.GetAll();
      emit(
        ProcessoTipoPageState(
          loading: false,
          processosTipos: processosTipos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoTipoPageState(
          loading: false,
          processosTipos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(ProcessoTipoModel processoTipo) async {
    try {
      (String, ProcessoTipoModel)? result = await service.delete(processoTipo);
      if (result == null) return;
      emit(
        ProcessoTipoPageState(
          loading: false,
          processosTipos: state.processosTipos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoTipoPageState(
          loading: false,
          processosTipos: state.processosTipos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ProcessoTipoPageState {
  final bool loading;
  final bool deleted;
  final List<ProcessoTipoModel> processosTipos;
  final String error;
  final String message;

  ProcessoTipoPageState({
    required this.loading,
    required this.processosTipos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}

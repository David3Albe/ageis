import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoTipoConsultaPageCubit extends Cubit<ProcessoTipoConsultaPageState> {
  final ProcessoTipoService service;
  ProcessoTipoConsultaPageCubit({required this.service})
      : super(
          ProcessoTipoConsultaPageState(
            processosTipos: [],
            loading: false,
          ),
        );

  void loadProcessoTipo() async {
    emit(
      ProcessoTipoConsultaPageState(
        loading: true,
        processosTipos: [],
      ),
    );
    try {
      List<ProcessoTipoModel> processosTipos = await service.GetAll();
      emit(
        ProcessoTipoConsultaPageState(
          loading: false,
          processosTipos: processosTipos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ProcessoTipoConsultaPageState(
          loading: false,
          processosTipos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ProcessoTipoConsultaPageState {
  final bool loading;
  final List<ProcessoTipoModel> processosTipos;
  final String error;
  final String message;

  ProcessoTipoConsultaPageState({
    required this.loading,
    required this.processosTipos,
    this.error = '',
    this.message = '',
  });
}

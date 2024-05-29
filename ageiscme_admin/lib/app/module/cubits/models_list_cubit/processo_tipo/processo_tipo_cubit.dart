import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoTipoCubit extends Cubit<ProcessoTipoState> {
  ProcessoTipoCubit() : super(ProcessoTipoState(processosTipos: []));

  void loadAll() async {
    emit(ProcessoTipoState(processosTipos: [], loading: true));
    List<ProcessoTipoModel> processosTipos =
        await ProcessoTipoService().GetAll();
    emit(ProcessoTipoState(processosTipos: processosTipos, loaded: true));
  }

  void loadFilter(ProcessoTipoFilter filter) async {
    emit(
      ProcessoTipoState(
        processosTipos: [],
        loading: true,
      ),
    );
    List<ProcessoTipoModel> processosTipos =
        await ProcessoTipoService().Filter(filter);
    emit(
      ProcessoTipoState(
        processosTipos: processosTipos,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ProcessoTipoState(processosTipos: []));
}

class ProcessoTipoState {
  List<ProcessoTipoModel> processosTipos;
  bool loading;
  bool loaded;

  ProcessoTipoState({
    required this.processosTipos,
    this.loaded = false,
    this.loading = false,
  });
}

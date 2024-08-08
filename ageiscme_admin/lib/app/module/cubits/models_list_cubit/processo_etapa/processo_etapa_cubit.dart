import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoEtapaCubit extends Cubit<ProcessoEtapaState> {
  ProcessoEtapaCubit() : super(ProcessoEtapaState(processosEtapas: []));

  void loadAll() async {
    emit(ProcessoEtapaState(processosEtapas: [], loading: true));
    List<ProcessoEtapaModel> processosEtapas =
        await ProcessoEtapaService().GetAll();
    emit(ProcessoEtapaState(processosEtapas: processosEtapas, loaded: true));
  }

  void loadFilter(ProcessoEtapaFilter filter) async {
    emit(ProcessoEtapaState(processosEtapas: [], loading: true));

    List<ProcessoEtapaModel> processosEtapas =
        await ProcessoEtapaService().Filter(filter);

    emit(ProcessoEtapaState(processosEtapas: processosEtapas, loaded: true));
  }

  void clear() => emit(ProcessoEtapaState(processosEtapas: []));

  void refresh() async {
    emit(
      ProcessoEtapaState(
        processosEtapas: state.processosEtapas,
        loading: true,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 50));
    emit(ProcessoEtapaState(processosEtapas: state.processosEtapas));
  }
}

class ProcessoEtapaState {
  List<ProcessoEtapaModel> processosEtapas;
  bool loading;
  bool loaded;

  ProcessoEtapaState({
    required this.processosEtapas,
    this.loading = false,
    this.loaded = false,
  });
}

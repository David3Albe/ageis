import 'package:ageiscme_models/filters/proprietario/proprietario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_data/services/proprietario/proprietario_service.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProprietarioCubit extends Cubit<ProprietarioState> {
  ProprietarioCubit() : super(ProprietarioState(proprietarios: []));

  void loadFilter(ProprietarioFilter filter) async {
    emit(
      ProprietarioState(
        proprietarios: [],
        loading: true,
      ),
    );
    List<ProprietarioModel> proprietarios =
        await ProprietarioService().Filter(filter);
    emit(
      ProprietarioState(
        proprietarios: proprietarios,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ProprietarioState(proprietarios: []));
}

class ProprietarioState {
  List<ProprietarioModel> proprietarios;
  bool loading;
  bool loaded;

  ProprietarioState({
    required this.proprietarios,
    this.loaded = false,
    this.loading = false,
  });
}

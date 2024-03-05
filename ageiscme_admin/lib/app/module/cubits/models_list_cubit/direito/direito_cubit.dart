import 'package:ageiscme_data/services/direito/direito_service.dart';
import 'package:ageiscme_models/filters/direito/direito_filter.dart';
import 'package:ageiscme_models/models/direito/direito_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DireitoCubit extends Cubit<DireitoState> {
  DireitoCubit() : super(DireitoState(direitos: []));

  void loadAll() async {
    emit(DireitoState(direitos: [], loading: true));
    List<DireitoModel> direitos = await DireitoService().GetAll();
    emit(DireitoState(direitos: direitos, loaded: true));
  }

  void loadFilter(DireitoFilter filter) async {
    emit(
      DireitoState(
        direitos: [],
        loading: true,
      ),
    );
    List<DireitoModel> direitos = await DireitoService().Filter(filter);
    emit(
      DireitoState(
        direitos: direitos,
        loaded: true,
      ),
    );
  }

  void clear() => emit(DireitoState(direitos: []));
}

class DireitoState {
  List<DireitoModel> direitos;
  bool loading;
  bool loaded;

  DireitoState({
    required this.direitos,
    this.loaded = false,
    this.loading = false,
  });
}

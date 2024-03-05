import 'package:ageiscme_data/services/kit_cor/kit_cor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:ageiscme_models/filters/kit_cor/kit_cor_filter.dart';

class KitCorCubit extends Cubit<KitCorState> {
  KitCorCubit() : super(KitCorState(kitCores: []));

  void loadAll() async {
    emit(KitCorState(kitCores: [], loading: true));
    List<KitCorModel> kitCores = await KitCorService().GetAll();
    emit(KitCorState(kitCores: kitCores, loaded: true));
  }

  void loadFilter(KitCorFilter filter) async {
    emit(
      KitCorState(
        kitCores: [],
        loading: true,
      ),
    );
    List<KitCorModel> kitCores = await KitCorService().Filter(filter);
    emit(
      KitCorState(
        kitCores: kitCores,
        loaded: true,
      ),
    );
  }

  void clear() => emit(KitCorState(kitCores: []));
}

class KitCorState {
  List<KitCorModel> kitCores;
  bool loading;
  bool loaded;

  KitCorState({
    required this.kitCores,
    this.loading = false,
    this.loaded = false,
  });
}

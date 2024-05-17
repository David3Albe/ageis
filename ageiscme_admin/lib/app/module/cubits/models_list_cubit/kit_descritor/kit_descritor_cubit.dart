import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitDescritorCubit extends Cubit<KitDescritorState> {
  KitDescritorCubit() : super(KitDescritorState(kitDescritores: []));

  void loadFilter(KitDescritorFilter filter) async {
    emit(
      KitDescritorState(
        kitDescritores: [],
        loading: true,
      ),
    );
    List<KitDescritorModel> kitDescritores =
        await KitDescritorService().Filter(filter);
    emit(
      KitDescritorState(
        kitDescritores: kitDescritores,
        loaded: true,
      ),
    );
  }

  void clear() => emit(KitDescritorState(kitDescritores: []));
}

class KitDescritorState {
  List<KitDescritorModel> kitDescritores;
  bool loading;
  bool loaded;

  KitDescritorState({
    required this.kitDescritores,
    this.loading = false,
    this.loaded = false,
  });
}

import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';

class ItemDescritorCubit extends Cubit<ItemDescritorState> {
  ItemDescritorCubit() : super(ItemDescritorState(itensDescritores: []));

  void loadAll() async {
    emit(ItemDescritorState(itensDescritores: [], loaded: true));
    List<ItemDescritorModel> itensDescritores =
        await ItemDescritorService().GetAll();
    emit(ItemDescritorState(itensDescritores: itensDescritores, loaded: true));
  }

  void loadFilter(ItemDescritorFilter filter) async {
    emit(
      ItemDescritorState(
        itensDescritores: [],
        loading: true,
      ),
    );
    List<ItemDescritorModel> itensDescritores =
        await ItemDescritorService().Filter(filter);
    emit(
      ItemDescritorState(
        itensDescritores: itensDescritores,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ItemDescritorState(itensDescritores: []));
}

class ItemDescritorState {
  List<ItemDescritorModel> itensDescritores;
  bool loading;
  bool loaded;

  ItemDescritorState({
    required this.itensDescritores,
    this.loaded = false,
    this.loading = false,
  });
}

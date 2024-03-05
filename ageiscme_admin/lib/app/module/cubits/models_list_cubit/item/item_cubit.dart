import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState(itens: []));

  void loadAll() async {
    emit(ItemState(itens: [], loading: true));
    List<ItemModel> itens = await ItemService().GetAll();
    emit(ItemState(itens: itens, loaded: true));
  }

  void loadFilter(ItemFilter filter) async {
    emit(
      ItemState(
        itens: [],
        loading: true,
      ),
    );
    List<ItemModel> itens = await ItemService().Filter(filter);
    emit(
      ItemState(
        itens: itens,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ItemState(itens: []));
}

class ItemState {
  List<ItemModel> itens;
  bool loading;
  bool loaded;

  ItemState({
    required this.itens,
    this.loaded = false,
    this.loading = false,
  });
}

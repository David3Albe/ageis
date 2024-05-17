import 'package:ageiscme_data/services/item_menu/item_menu_service.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ItemsMenuCubit extends Cubit<List<ItemMenuModel>> {
  ItemsMenuCubit() : super([]);

  Future loadItems() async {
    emit(await ItemMenuService().getItemsLiberados());
  }
}

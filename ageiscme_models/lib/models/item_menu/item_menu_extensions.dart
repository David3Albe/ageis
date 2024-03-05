import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';

extension ItemMenuIterable on List<ItemMenuModel> {
  List<ItemMenuModel> getLastLevels() {
    List<ItemMenuModel> itensRetorno = [];
    for (ItemMenuModel item in this) {
      _getLastLevelsItems(item, itensRetorno);
    }
    return itensRetorno;
  }

  void _getLastLevelsItems(
    ItemMenuModel item,
    List<ItemMenuModel> itensRetorno,
  ) {
    if (item.getChildrens().isEmpty) {
      itensRetorno.add(item);
    } else {
      for (ItemMenuModel filho in item.getChildrens()) {
        _getLastLevelsItems(filho, itensRetorno);
      }
    }
  }
}

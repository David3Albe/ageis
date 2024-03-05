import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';

class NavigationBarState {
  bool expanded;
  ItemMenuModel? itemExpanded;
  ItemMenuModel? itemHovered;
  @override
  NavigationBarState(this.expanded, this.itemExpanded, this.itemHovered);
}

class NavigationBarInitState extends NavigationBarState {
  NavigationBarInitState() : super(true, null, null);
}

class NavigationBarChangedState extends NavigationBarState {
  NavigationBarChangedState(
    bool expanded,
    ItemMenuModel? itemExpanded,
    ItemMenuModel? itemHovered,
  ) : super(expanded, itemExpanded, itemHovered);
}

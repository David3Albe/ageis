import 'package:ageiscme_admin/app/module/cubits/navigation_bar/navigation_bar_state.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  bool expanded = true;
  ItemMenuModel? itemExpanded;
  ItemMenuModel? itemHovered;
  NavigationBarCubit() : super(NavigationBarInitState());

  void toogleNavigationBarExpanded() {
    expanded = !expanded;
    emit(NavigationBarChangedState(expanded, itemExpanded, itemHovered));
  }

  void changeItemExpanded(ItemMenuModel? item) {
    itemExpanded = itemExpanded == item ? null : item;
    emit(NavigationBarChangedState(expanded, itemExpanded, itemHovered));
  }

  void changeItemHovered(ItemMenuModel? item) {
    itemHovered = item;
    emit(NavigationBarChangedState(expanded, itemExpanded, itemHovered));
  }
}

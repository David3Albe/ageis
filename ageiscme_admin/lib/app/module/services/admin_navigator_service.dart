import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/navigator/navigator_service.dart';

abstract class AdminNavigatorService {
  static void navigateTo(ItemMenuModel itemMenu) {
    NavigatorService.navigateTo('/admin' + itemMenu.route);
  }

  static void navigateToHome() {
    NavigatorService.navigateTo('/admin/home');
  }

  static void navigateToModuleSelection() => 
      NavigatorService.navigateToModuleSelection();
}

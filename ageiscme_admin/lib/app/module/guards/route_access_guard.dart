import 'dart:async';

import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item_menu/item_menu_service.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_extensions.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/modular_export.dart';

class RouteAccessGuard extends RouteGuard {
  RouteAccessGuard() : super(redirectTo: '/admin/home');

  @override
  FutureOr<bool> canActivate(
    final String path,
    final ParallelRoute route,
  ) async {
    if (path == '/admin/') return true;
    if (path == '/admin/home') return true;
    final ItemMenuModel? itemMenu = ItemMenuService()
        .getItems()
        .getLastLevels()
        .firstWhere((element) => element.getFullRoute() == path, orElse: null);
    if (itemMenu == null) return false;
    bool possuiAcesso = await AccessUserService.validateUserAccess(itemMenu);
    if (possuiAcesso == false) {
      ToastUtils.showCustomToastWarning(
        null,
        'Você não tem permissão para acessar essa página entre em contato com o administrador',
      );
    }
    return Future.value(possuiAcesso);
  }
}

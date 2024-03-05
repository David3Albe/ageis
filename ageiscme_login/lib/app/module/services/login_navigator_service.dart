import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:dependencias_comuns/main.dart';

abstract class LoginNavigatorService {
  static void ToModuleAdmin() {
    NavigatorService.navigateTo('/admin/login');
  }

  static void ToModuleProcess() {
    NavigatorService.navigateTo('/processo/user');
  }

  static void ToStats() {
    Uri uri = Uri.parse('/stats/');
    launchUrl(uri);
  }
}

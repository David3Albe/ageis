import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';

abstract class LoginNavigatorService {
  static void clearAuthentication() {
    Modular.get<AuthenticationStore>().ClearAuthentication();
  }

  static void ToModuleAdmin() {
    clearAuthentication();
    NavigatorService.navigateTo('/admin/login');
  }

  static void ToModuleProcess() {
    clearAuthentication();
    NavigatorService.navigateTo('/processo/user');
  }

  static void ToStats() {
    Uri uri = Uri.parse('/stats/');
    launchUrl(uri);
  }
}

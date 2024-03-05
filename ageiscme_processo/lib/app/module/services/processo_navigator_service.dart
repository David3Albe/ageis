import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:dependencias_comuns/modular_export.dart';

abstract class ProcessoNavigatorService {
  static void ToProcessoScreen() {
    NavigatorService.navigateTo('/processo/');
  }

  static void ToProcessoScreenWithUser(String userCode) {
    Modular.to.navigate('/processo/', arguments: userCode);
  }

  static void ToUserScreen() {
    NavigatorService.navigateTo('/processo/user');
  }
}

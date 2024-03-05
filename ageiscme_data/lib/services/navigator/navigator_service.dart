import 'package:dependencias_comuns/modular_export.dart';

abstract class NavigatorService {
  static void navigateTo(String route) {
    Modular.to.navigate(route);
  }
}

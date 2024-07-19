import 'package:dependencias_comuns/modular_export.dart';

abstract class NavigatorService {
  static void navigateTo(String route) => Modular.to.navigate(route);
  
  static void navigateToPushReplacement(String route) =>
      Modular.to.popAndPushNamed(route);

  static void navigateToArguments(String route, dynamic arguments) =>
      Modular.to.navigate(
        route,
        arguments: arguments,
      );

  static void navigateToModuleSelection() =>
      Modular.to.navigate('/module-selection/');
}

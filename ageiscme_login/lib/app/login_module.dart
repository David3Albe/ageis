import 'package:ageiscme_login/app/module/pages/module_selection_page.dart';
import 'package:dependencias_comuns/modular_export.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const ModuleSelectionPage(),
      transition: TransitionType.noTransition,
    );
  }
}

import 'package:ageiscme_admin/app/admin_module.dart';
import 'package:ageiscme_login/app/login_module.dart';
import 'package:ageiscme_processo/app/processo_module.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:ageiscme_data/data_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        DataModule(),
      ];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/admin', module: AdminModule());
    r.module('/module-selection', module: LoginModule());
    r.module('/processo', module: ProcessoModule());
  }
}


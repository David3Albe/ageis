import 'package:ageiscme_processo/app/module/pages/router_outlet/router_outlet.dart';
import 'package:ageiscme_processo/app/module/pages/user/user_page.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ProcessoModule extends Module {
  ParallelRoute<dynamic> createParallelRoute(
    String route, {
    required Widget Function(BuildContext context) child,
  }) {
    return ParallelRoute.child(
      route,
      transition: TransitionType.noTransition,
      child: child,
    );
  }

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      '/user',
      child: (context) => const UserPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/',
      child: (context) => RouterOutletPage(
        userCode: r.args.data,
      ),
      transition: TransitionType.noTransition,
    );
  }
}

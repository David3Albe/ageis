import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/cubit/custom_navigation_bar_cubit.dart';
import 'package:ageiscme_data/shared/app_config.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/cubits/route/current_route/current_route_cubit.dart';
import 'package:compartilhados/functions/window_manager/window_manager_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  final String initialRoute;
  final String enviroment;

  const AppWidget(this.initialRoute, {required this.enviroment, super.key});

  @override
  Widget build(BuildContext context) {
    setEnviroment();
    AppConfig.forEnvironment(true);
    Modular.setInitialRoute(initialRoute);
    CurrentRouteCubit currentRouteCubit = CurrentRouteCubit('');
    Modular.to.addListener(() {
      currentRouteCubit.changeRoute(Modular.to.path);
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentRouteCubit>(
          create: (_) => currentRouteCubit,
        ),
        BlocProvider<CustomNavigationBarCubit>(
          create: (_) => CustomNavigationBarCubit(),
        ),
      ],
      child: MaterialApp.router(
        locale: const Locale('pt', 'BR'),
        debugShowCheckedModeBanner: false,
        title: WindowManagerHelper.BASE_TITLE,
        theme: ThemeData(
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          primarySwatch: Cores.materialCorPrincipal,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt', 'BR'),
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }

  void setEnviroment() {
    switch (enviroment) {
      case 'dev':
        AppConfig.enviroment = AppConfigEnviroment.Development;
        return;
      case 'movtech':
        AppConfig.enviroment = AppConfigEnviroment.Movtech;
        return;
      case 'servidora':
        AppConfig.enviroment = AppConfigEnviroment.ServidorA;
        return;
      case 'servidorb':
        AppConfig.enviroment = AppConfigEnviroment.ServidorB;
        return;
      case 'hml':
        AppConfig.enviroment = AppConfigEnviroment.Homologation;
        return;
      default:
        throw Exception('Not knowed enviroment');
    }
  }
}

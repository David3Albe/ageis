import 'package:ageiscme_core/app/app_module.dart';
import 'package:ageiscme_core/app/app_widget.dart';
import 'package:compartilhados/functions/window_manager/window_manager_helper.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

void main() async {
  await WindowManagerHelper.Initialize();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(
        '/module-selection/',
        enviroment: 'hml',
      ),
    ),
  );
}

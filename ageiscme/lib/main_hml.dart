import 'package:ageiscme_core/app/app_module.dart';
import 'package:ageiscme_core/app/app_widget.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

void main() {
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

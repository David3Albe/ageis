import 'package:ageiscme_core/app/app_module.dart';
import 'package:ageiscme_core/app/app_widget.dart';
import 'package:auto_updater/auto_updater.dart';
import 'package:compartilhados/functions/window_manager/window_manager_helper.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String feedURL = 'http://localhost:8011/appcast.xml';
  await autoUpdater.setFeedURL(feedURL);
  await autoUpdater.checkForUpdates();
  await autoUpdater.setScheduledCheckInterval(3600);
  await WindowManagerHelper.Initialize();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(
        '/module-selection/',
        enviroment: 'dev',
      ),
    ),
  );
}

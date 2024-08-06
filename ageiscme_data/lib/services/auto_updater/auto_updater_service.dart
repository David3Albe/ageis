import 'dart:io';

import 'package:ageiscme_data/shared/app_config.dart';
import 'package:dependencias_comuns/auto_updater_export.dart';
import 'package:flutter/foundation.dart';

class AutoUpdaterService {
  Future update() async {
    if (kIsWeb) return;
    if (!Platform.isWindows) return;
    AppConfig appConfig = await AppConfig.forEnvironment(false);
    if (appConfig.isDev) return;
    String feedURL = appConfig.appUrl + '/appcast.xml';
    await autoUpdater.setFeedURL(feedURL);
    await autoUpdater.checkForUpdates();
    // await autoUpdater.setScheduledCheckInterval(3600);
  }
}

import 'dart:io';

import 'package:ageiscme_data/shared/app_config.dart';
import 'package:dependencias_comuns/auto_updater_export.dart';
import 'package:flutter/foundation.dart';

class AutoUpdaterService {
  Future update() async {
    if (kIsWeb) return;
    if (!Platform.isWindows) return;
    String feedURL =
        (await AppConfig.forEnvironment(false)).appUrl + '/appcast.xml';
    await autoUpdater.setFeedURL(feedURL);
    await autoUpdater.checkForUpdates(inBackground: false);
    await autoUpdater.setScheduledCheckInterval(3600);
  }
}

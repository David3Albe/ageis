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
    autoUpdater.addListener(AutoUpdaterServiceListener());
    await autoUpdater.setFeedURL(feedURL);
    await autoUpdater.checkForUpdates(inBackground: true);
    await autoUpdater.setScheduledCheckInterval(3600);
  }
}

class AutoUpdaterServiceListener extends UpdaterListener {
  @override
  void onUpdaterBeforeQuitForUpdate(AppcastItem? appcastItem) {
    if (kDebugMode) {
      print('quit $appcastItem');
    }
  }

  @override
  void onUpdaterCheckingForUpdate(Appcast? appcast) {
    if (kDebugMode) {
      print('check $appcast');
    }
  }

  @override
  void onUpdaterError(UpdaterError? error) {
    if (kDebugMode) {
      print('error $error');
    }
  }

  @override
  void onUpdaterUpdateAvailable(AppcastItem? appcastItem) {
    if (kDebugMode) {
      print('available $appcastItem');
    }
  }

  @override
  void onUpdaterUpdateDownloaded(AppcastItem? appcastItem) {
    if (kDebugMode) {
      print('downloaded $appcastItem');
    }
  }

  @override
  void onUpdaterUpdateNotAvailable(UpdaterError? error) {
    if (kDebugMode) {
      print('notavailable $error');
    }
  }
}

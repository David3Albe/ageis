import 'dart:io';

import 'package:dependencias_comuns/package_info_export.dart';
import 'package:dependencias_comuns/window_manager_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WindowManagerHelper {
  static const String BASE_TITLE = 'Ageis CME';

  static Future setTitle(String? title) async {
    if (kIsWeb) return;
    if (!Platform.isWindows) return;
    String secondTitle = '';
    if (title != null) {
      secondTitle = ' - $title';
    }
    PackageInfo info = await PackageInfo.fromPlatform();
    String version = ' - Versão: ${info.version}';
    await windowManager.setTitle(BASE_TITLE + secondTitle + version);
  }

  static Future Initialize() async {
    if (kIsWeb) return;
    if (!Platform.isWindows) return;
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();
  }
}

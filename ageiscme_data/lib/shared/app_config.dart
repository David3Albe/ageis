import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;
  final String appUrl;
  final String apiUrlFailover;
  final String appUrlFailover;
  final bool isDev;
  bool useFailoverFirst;
  static AppConfigEnviroment? enviroment;

  static AppConfig _Config = AppConfig(
    apiUrl: '',
    appUrl: '',
    appUrlFailover: '',
    apiUrlFailover: '',
    isDev: false,
    useFailoverFirst: false,
  );

  AppConfig({
    required this.apiUrl,
    required this.appUrl,
    required this.appUrlFailover,
    required this.apiUrlFailover,
    required this.isDev,
    required this.useFailoverFirst,
  });

  static Future<AppConfig> _forEnviromentDesktop() async {
    final futures = [
      Process.start('powershell', [
        '-Command',
        r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'appUrl' | Select-Object -ExpandProperty appUrl",
      ]).then((process) => process.stdout.transform(utf8.decoder).join()),
      Process.start('powershell', [
        '-Command',
        r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'apiUrl' | Select-Object -ExpandProperty apiUrl",
      ]).then((process) => process.stdout.transform(utf8.decoder).join()),
      Process.start('powershell', [
        '-Command',
        r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'apiUrlFailover' | Select-Object -ExpandProperty apiUrlFailover",
      ]).then((process) => process.stdout.transform(utf8.decoder).join()),
      Process.start('powershell', [
        '-Command',
        r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'appUrlFailover' | Select-Object -ExpandProperty appUrlFailover",
      ]).then((process) => process.stdout.transform(utf8.decoder).join()),
    ];

    final results = await Future.wait(futures);
    final appUrl = results[0].trim();
    final apiUrl = results[1].trim();
    final apiUrlFailover = results[2].trim();
    final appUrlFailover = results[3].trim();

    return AppConfig(
      apiUrl: apiUrl,
      appUrl: appUrl,
      appUrlFailover: appUrlFailover,
      apiUrlFailover: apiUrlFailover,
      isDev: enviroment == AppConfigEnviroment.Development,
      useFailoverFirst: false,
    );
  }

  static Future setUseFailover(bool value) async {
    _Config.useFailoverFirst = value;
  }

  static Future<AppConfig> forEnvironment(bool clearCache) async {
    if (enviroment == null) throw Exception('Set the enviroment');
    if (!clearCache && _Config.apiUrl.isNotEmpty) return _Config;

    if (!kIsWeb && Platform.isWindows) {
      _Config = await _forEnviromentDesktop();
      return _Config;
    }

    String env = getEnviromentString(enviroment!);
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );

    final json = jsonDecode(contents);

    _Config = AppConfig(
      apiUrl: json['apiUrl'],
      appUrl: json['appUrl'],
      apiUrlFailover: json['apiUrlFailover'],
      appUrlFailover: json['appUrlFailover'],
      isDev: enviroment == AppConfigEnviroment.Development,
      useFailoverFirst: false,
    );
    return _Config;
  }

  static String getEnviromentString(AppConfigEnviroment enviroment) {
    switch (enviroment) {
      case AppConfigEnviroment.Development:
        return 'dev';
      case AppConfigEnviroment.Homologation:
        return 'hml';
      case AppConfigEnviroment.ServidorA:
        return 'servidora';
      case AppConfigEnviroment.ServidorB:
        return 'servidorB';
      case AppConfigEnviroment.Movtech:
        return 'movtech';
      default:
        throw Exception('Enviroment not set');
    }
  }
}

enum AppConfigEnviroment {
  Development,
  Movtech,
  ServidorA,
  Homologation,
  ServidorB
}

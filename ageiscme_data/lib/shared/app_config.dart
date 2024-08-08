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
    Process process = await Process.start('powershell', [
      '-Command',
      r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'appUrl' | Select-Object -ExpandProperty appUrl",
    ]);
    final appUrl = await process.stdout.transform(utf8.decoder).join();
    process = await Process.start('powershell', [
      '-Command',
      r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'apiUrl' | Select-Object -ExpandProperty apiUrl",
    ]);
    final apiUrl = await process.stdout.transform(utf8.decoder).join();
    process = await Process.start('powershell', [
      '-Command',
      r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'apiUrlFailover' | Select-Object -ExpandProperty apiUrlFailover",
    ]);
    final apiUrlFailover = await process.stdout.transform(utf8.decoder).join();
    process = await Process.start('powershell', [
      '-Command',
      r"Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Movtech\Ageis CME V2' -Name 'appUrlFailover' | Select-Object -ExpandProperty appUrlFailover",
    ]);
    final appUrlFailover = await process.stdout.transform(utf8.decoder).join();
    return AppConfig(
      apiUrl: apiUrl.trim(),
      appUrl: appUrl.trim(),
      appUrlFailover: appUrlFailover.trim(),
      apiUrlFailover: apiUrlFailover.trim(),
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
      apiUrlFailover: json['apiUrl'],
      appUrlFailover: json['appUrl'],
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

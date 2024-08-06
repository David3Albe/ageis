import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;
  final String appUrl;
  static AppConfigEnviroment? enviroment;

  static AppConfig Config = AppConfig(
    apiUrl: '',
    appUrl: '',
  );

  AppConfig({
    required this.apiUrl,
    required this.appUrl,
  });

  static Future<AppConfig> forEnvironment(bool clearCache) async {
    if (enviroment == null) throw Exception('Set the enviroment');
    if (!clearCache && Config.apiUrl.isNotEmpty) return Config;
    String env = getEnviromentString(enviroment!);
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );

    final json = jsonDecode(contents);

    Config = AppConfig(
      apiUrl: json['apiUrl'],
      appUrl: json['appUrl'],
    );
    return Config;
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

enum AppConfigEnviroment { Development, Movtech, ServidorA, Homologation,ServidorB }

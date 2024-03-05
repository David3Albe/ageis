import 'package:dependencias_comuns/main.dart';
import 'package:flutter/foundation.dart';

class DeviceInformationHelper {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getPlataformInfo() async {
    String? deviceData;
    if (kIsWeb) {
      return _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    }
    deviceData = switch (defaultTargetPlatform) {
      TargetPlatform.android =>
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
      TargetPlatform.iOS => _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
      TargetPlatform.linux =>
        _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
      TargetPlatform.windows =>
        _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
      TargetPlatform.macOS =>
        _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
      TargetPlatform.fuchsia => throw Exception('Plataforma não suportado'),
    };
    return deviceData;
  }

  static String _readAndroidBuildData(AndroidDeviceInfo data) =>
      'Dispositivo: ' + data.model;

  static String _readIosDeviceInfo(IosDeviceInfo data) =>
      'Dispositivo: ' + data.name;

  static String _readLinuxDeviceInfo(LinuxDeviceInfo data) =>
      'Dispositivo: ' + data.name;

  static String _readWebBrowserInfo(WebBrowserInfo data) {
    return 'Navegador: ' +
        _getBrowserName(data) +
        '\n' +
        'Mémoria: ' +
        (data.deviceMemory?.toString() ?? '');
  }

  static String _readMacOsDeviceInfo(MacOsDeviceInfo data) =>
      'Dispositivo: ' + data.computerName;

  static String _readWindowsDeviceInfo(WindowsDeviceInfo data) =>
      'Dispositivo: ' + data.computerName;

  static String _getBrowserName(WebBrowserInfo data) {
    switch (data.browserName) {
      case BrowserName.chrome:
        return 'Chrome';
      case BrowserName.edge:
        return 'Edge';
      case BrowserName.firefox:
        return 'Firefox';
      case BrowserName.msie:
        return 'Internet Explorer';
      case BrowserName.opera:
        return 'Opera';
      case BrowserName.safari:
        return 'Safari';
      case BrowserName.samsungInternet:
        return 'Samsung Internet';
      case BrowserName.unknown:
        return 'Desconhecido';
    }
  }
}

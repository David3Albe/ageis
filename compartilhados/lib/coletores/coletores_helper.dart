import 'package:flutter/services.dart';

class ColetoresHelper {
  String barCode = '';
  DateTime? lastTimeRead;
  Function(String barSendCode)? onEnter;

  ColetoresHelper({this.onEnter});

  void handleKey(RawKeyEvent key) {
    if (onEnter == null) return;
    if (key is RawKeyUpEvent) return;
    if (key.logicalKey == LogicalKeyboardKey.enter) {
      String _barSendCode = barCode;
      barCode = '';
      lastTimeRead = DateTime.now();
      print(_barSendCode);
      onEnter!(_barSendCode);
    } else if (key.character != null) {
      if (lastTimeRead == null) lastTimeRead = DateTime.now();
      if (lastTimeRead!.difference(DateTime.now()) <=
          const Duration(seconds: -2)) {
        barCode = '';
      }
      lastTimeRead = DateTime.now();
      String _keyCode = key.character!;
      barCode += _keyCode;
    }
  }
}

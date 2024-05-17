import 'package:flutter/services.dart';

class ColetoresHelper {
  String barCode = '';
  Function(String barSendCode)? onEnter;

  ColetoresHelper({this.onEnter});

  void handleKey(RawKeyEvent key) {
    if (onEnter == null) return;
    if (key is RawKeyUpEvent) return;
    if (key.logicalKey == LogicalKeyboardKey.enter) {
      String _barSendCode = barCode;
      barCode = '';
      onEnter!(_barSendCode);
    } else if (key.character != null) {
      String _keyCode = key.character!;
      barCode += _keyCode;
    }
  }
}

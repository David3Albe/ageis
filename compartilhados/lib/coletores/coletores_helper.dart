import 'package:flutter/services.dart';

class ColetoresHelper {
  String barCode = '';
  Function(String barSendCode)? onEnter;
  Function()? onShortcut;
  final List<int>? keysIdToPress;
  List<int> keysPressed = [];

  ColetoresHelper({
    this.onEnter,
    this.keysIdToPress,
    this.onShortcut,
  });

  void handleKey(KeyEvent key) {
    if (onEnter == null && onShortcut == null) return;
    if (key is KeyRepeatEvent) return;
    if (keysPressed.contains(key.logicalKey.keyId) && key is KeyUpEvent) {
      keysPressed.remove(key.logicalKey.keyId);
      return;
    }
    if (key is KeyUpEvent) return;
    keysPressed.add(key.logicalKey.keyId);
    if (onShortcut != null &&
        keysIdToPress != null &&
        keysIdToPress!.isNotEmpty &&
        keysIdToPress!.length == keysPressed.length) {
      validateShortcut();
    }
    if (onEnter == null) return;
    if (key.logicalKey == LogicalKeyboardKey.enter) {
      String _barSendCode = barCode;
      barCode = '';
      onEnter!(_barSendCode);
    } else if (key.character != null) {
      String _keyCode = key.character!;
      barCode += _keyCode;
    }
  }

  void validateShortcut() {
    for (int key in keysIdToPress!) {
      if (!keysPressed.contains(key)) return;
    }
    onShortcut!();
    keysPressed = [];
  }
}

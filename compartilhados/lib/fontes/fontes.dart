import 'package:flutter/material.dart';

abstract class Fontes {
  static TextStyle getRoboto({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle getRobotoBold({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getSegoe({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: 'Segoe Ui',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
    );
  }
}

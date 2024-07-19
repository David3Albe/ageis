import 'package:flutter/material.dart';

abstract class Fontes {
  static TextStyle getRoboto({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
      overflow: overflow,
    );
  }

  static TextStyle getRobotoBold({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
      height: lineHeight,
    );
  }

  static TextStyle getSegoe({
    double? fontSize,
    Color? cor,
    double? letterSpacing,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: 'Segoe Ui',
      fontSize: fontSize,
      color: cor,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );
  }
}

import 'package:flutter/material.dart';

class HelperFunctions {
  static String GetTwoFirstLetersOfNameAndSecondName(String fullName) {
    if (fullName.isEmpty) return '';
    String name = fullName[0];
    if (fullName.contains(' ')) {
      name += fullName.split(' ').elementAt(1)[0];
    }
    return name.toUpperCase();
  }

  static double calculaFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double transformSize = calculaTransformSize(context);
    if (screenWidth < 800) {
      return baseFontSize * transformSize;
    } else if (screenWidth < 1000) {
      return baseFontSize * transformSize;
    } else if (screenWidth < 1300) {
      return baseFontSize * transformSize;
    } else if (screenWidth < 1600) {
      return baseFontSize * transformSize;
    } else if (screenWidth < 2000) {
      return baseFontSize;
    } else {
      return baseFontSize * transformSize;
    }
  }

  static double calculaTransformSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 800) {
      return 0.6;
    } else if (screenWidth < 1000) {
      return 0.7;
    } else if (screenWidth < 1300) {
      return 0.8;
    } else if (screenWidth < 1600) {
      return 0.9;
    } else if (screenWidth < 2000) {
      return 1;
    } else {
      return 1.2;
    }
  }

  static double getPadding(BuildContext context, double padding) {
    return padding * calculaTransformSize(context);
  }
}

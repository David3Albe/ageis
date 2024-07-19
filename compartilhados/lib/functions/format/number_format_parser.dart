import 'package:intl/intl.dart';

class NumberFormatParser {
  static String toFixed(double? number, int fractionDigits) {
    if (number == null) return '';
    NumberFormat numberFormat = NumberFormat.decimalPattern('pt-BR');
    numberFormat.minimumFractionDigits = fractionDigits;
    numberFormat.maximumFractionDigits = fractionDigits;
    return numberFormat.format(number);
  }
}

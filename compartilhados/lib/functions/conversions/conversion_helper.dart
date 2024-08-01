class ConversionHelper {
  static bool isInt(int? value) {
    if (value == null) return true;
    return value >= -2147483648 && value <= 2147483647;
  }
}

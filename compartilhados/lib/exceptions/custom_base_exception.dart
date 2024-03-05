class CustomBaseException implements Exception {
  CustomBaseException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

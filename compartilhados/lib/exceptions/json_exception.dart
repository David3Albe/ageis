class JsonException implements Exception {
  JsonException(this.message);

  final Map<String, dynamic> message;

  @override
  String toString() {
    return message.toString();
  }
}

class CommandResult {
  bool success;

  dynamic data;
  String message;
  CommandResult({required this.success, required this.message, required this.data});
}

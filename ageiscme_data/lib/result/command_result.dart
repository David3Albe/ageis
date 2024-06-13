import 'package:ageiscme_models/enums/command_result_alert_type.dart';

class CommandResult {
  bool success;

  dynamic data;
  String message;
  CommandResultAlertType? alertType;
  CommandResult({
    required this.success,
    required this.message,
    required this.data,
    required this.alertType,
  });
}

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum CommandResultAlertType {
  @JsonValue(1)
  Error,
  @JsonValue(2)
  Warning,
  @JsonValue(3)
  Notice,
  @JsonValue(4)
  Success,
}

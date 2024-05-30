import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum PlutoGridFilterType {
  @JsonValue(1)
  Contains,
  @JsonValue(2)
  StartsWith,
  @JsonValue(3)
  EndsWith,
  @JsonValue(4)
  Equals,
  @JsonValue(5)
  GreaterThan,
  @JsonValue(6)
  GreaterThanOrEquals,
  @JsonValue(7)
  LessThan,
  @JsonValue(8)
  LessThanOrEquals,
}

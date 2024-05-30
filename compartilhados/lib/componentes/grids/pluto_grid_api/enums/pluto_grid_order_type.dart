import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum PlutoGridOrderType {
  @JsonValue(1)
  Ascending,
  @JsonValue(2)
  Descending,
}

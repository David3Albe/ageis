import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum TipoAlerta {
  @JsonValue(1)
  Vermelho,
  @JsonValue(2)
  Laranja,
  @JsonValue(3)
  Amarelo,
}

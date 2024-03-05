import 'package:freezed_annotation/freezed_annotation.dart';

enum TipoMotivoOcorrencias {
  @JsonValue(1)
  AcaoOcorrencias,
  @JsonValue(2)
  MotivoNaoCorrecao,
}

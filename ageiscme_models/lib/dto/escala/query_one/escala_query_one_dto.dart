import 'package:freezed_annotation/freezed_annotation.dart';

part 'escala_query_one_dto.g.dart';
part 'escala_query_one_dto.freezed.dart';

@unfreezed
sealed class EscalaQueryOneDTO with _$EscalaQueryOneDTO {
  factory EscalaQueryOneDTO({
    required DateTime anoMes,
  }) = _EscalaQueryOneDTO;

  factory EscalaQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$EscalaQueryOneDTOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_query_one_dto.g.dart';
part 'turno_query_one_dto.freezed.dart';

@unfreezed
sealed class TurnoQueryOneDTO with _$TurnoQueryOneDTO {
  factory TurnoQueryOneDTO({
    required int cod,
  }) = _TurnoQueryOneDTO;

  factory TurnoQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoQueryOneDTOFromJson(json);
}

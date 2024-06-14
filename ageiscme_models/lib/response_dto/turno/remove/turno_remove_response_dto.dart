import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_remove_response_dto.g.dart';
part 'turno_remove_response_dto.freezed.dart';

@unfreezed
sealed class TurnoRemoveResponseDTO with _$TurnoRemoveResponseDTO {
  factory TurnoRemoveResponseDTO() = _TurnoRemoveResponseDTO;

  factory TurnoRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoRemoveResponseDTOFromJson(json);
}

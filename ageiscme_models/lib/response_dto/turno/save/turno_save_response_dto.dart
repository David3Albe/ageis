import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_save_response_dto.g.dart';
part 'turno_save_response_dto.freezed.dart';

@unfreezed
sealed class TurnoSaveResponseDTO
    with _$TurnoSaveResponseDTO {
  factory TurnoSaveResponseDTO() = _TurnoSaveResponseDTO;

  factory TurnoSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoSaveResponseDTOFromJson(json);
}

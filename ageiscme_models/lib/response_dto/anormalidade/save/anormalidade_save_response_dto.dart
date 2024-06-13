import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_save_response_dto.g.dart';
part 'anormalidade_save_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeSaveResponseDTO
    with _$AnormalidadeSaveResponseDTO {
  factory AnormalidadeSaveResponseDTO() = _AnormalidadeSaveResponseDTO;

  factory AnormalidadeSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeSaveResponseDTOFromJson(json);
}

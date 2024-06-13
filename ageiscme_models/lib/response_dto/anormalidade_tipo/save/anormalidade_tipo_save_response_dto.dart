import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_save_response_dto.g.dart';
part 'anormalidade_tipo_save_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoSaveResponseDTO
    with _$AnormalidadeTipoSaveResponseDTO {
  factory AnormalidadeTipoSaveResponseDTO() = _AnormalidadeTipoSaveResponseDTO;

  factory AnormalidadeTipoSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoSaveResponseDTOFromJson(json);
}

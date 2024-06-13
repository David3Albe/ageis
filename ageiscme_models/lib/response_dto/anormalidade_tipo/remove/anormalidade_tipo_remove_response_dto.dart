import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_remove_response_dto.g.dart';
part 'anormalidade_tipo_remove_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoRemoveResponseDTO
    with _$AnormalidadeTipoRemoveResponseDTO {
  factory AnormalidadeTipoRemoveResponseDTO() = _AnormalidadeTipoRemoveResponseDTO;

  factory AnormalidadeTipoRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoRemoveResponseDTOFromJson(json);
}

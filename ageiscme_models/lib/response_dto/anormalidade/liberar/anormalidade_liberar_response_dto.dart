import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_liberar_response_dto.g.dart';
part 'anormalidade_liberar_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeLiberarResponseDTO
    with _$AnormalidadeLiberarResponseDTO {
  factory AnormalidadeLiberarResponseDTO() = _AnormalidadeLiberarResponseDTO;

  factory AnormalidadeLiberarResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeLiberarResponseDTOFromJson(json);
}

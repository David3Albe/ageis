import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_remove_response_dto.g.dart';
part 'anormalidade_remove_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeRemoveResponseDTO
    with _$AnormalidadeRemoveResponseDTO {
  factory AnormalidadeRemoveResponseDTO() = _AnormalidadeRemoveResponseDTO;

  factory AnormalidadeRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeRemoveResponseDTOFromJson(json);
}

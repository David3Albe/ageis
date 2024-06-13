import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_remove_response_dto.g.dart';
part 'sigla_remove_response_dto.freezed.dart';

@unfreezed
sealed class SiglaRemoveResponseDTO with _$SiglaRemoveResponseDTO {
  factory SiglaRemoveResponseDTO() = _SiglaRemoveResponseDTO;

  factory SiglaRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaRemoveResponseDTOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_save_response_dto.g.dart';
part 'sigla_save_response_dto.freezed.dart';

@unfreezed
sealed class SiglaSaveResponseDTO
    with _$SiglaSaveResponseDTO {
  factory SiglaSaveResponseDTO() = _SiglaSaveResponseDTO;

  factory SiglaSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaSaveResponseDTOFromJson(json);
}

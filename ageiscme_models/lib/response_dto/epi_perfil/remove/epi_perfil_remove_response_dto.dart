import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_remove_response_dto.g.dart';
part 'epi_perfil_remove_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilRemoveResponseDTO with _$EpiPerfilRemoveResponseDTO {
  factory EpiPerfilRemoveResponseDTO() = _EpiPerfilRemoveResponseDTO;

  factory EpiPerfilRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilRemoveResponseDTOFromJson(json);
}

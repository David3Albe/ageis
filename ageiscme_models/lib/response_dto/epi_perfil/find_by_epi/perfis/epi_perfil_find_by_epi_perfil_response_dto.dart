import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_epi_perfil_response_dto.g.dart';
part 'epi_perfil_find_by_epi_perfil_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByEpiPerfilResponseDTO
    with _$EpiPerfilFindByEpiPerfilResponseDTO {
  factory EpiPerfilFindByEpiPerfilResponseDTO({
    required int cod,
    required int codPerfil,
  }) = _EpiPerfilFindByEpiPerfilResponseDTO;

  factory EpiPerfilFindByEpiPerfilResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByEpiPerfilResponseDTOFromJson(json);
}

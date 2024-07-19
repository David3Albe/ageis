import 'package:ageiscme_models/response_dto/epi_perfil/find_by_epi/perfis/epi_perfil_find_by_epi_perfil_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_epi_response_dto.g.dart';
part 'epi_perfil_find_by_epi_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByEpiResponseDTO
    with _$EpiPerfilFindByEpiResponseDTO {
  factory EpiPerfilFindByEpiResponseDTO({
    required List<EpiPerfilFindByEpiPerfilResponseDTO> perfis,
  }) = _EpiPerfilFindByEpiResponseDTO;

  factory EpiPerfilFindByEpiResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByEpiResponseDTOFromJson(json);
}

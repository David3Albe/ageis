import 'package:ageiscme_models/response_dto/epi_perfil/find_by_user/epis/epi_perfil_find_by_user_epi_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_user_response_dto.g.dart';
part 'epi_perfil_find_by_user_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByUserResponseDTO
    with _$EpiPerfilFindByUserResponseDTO {
  factory EpiPerfilFindByUserResponseDTO({
    required List<EpiPerfilFindByUserEpiResponseDTO> epis,
  }) = _EpiPerfilFindByUserResponseDTO;

  factory EpiPerfilFindByUserResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByUserResponseDTOFromJson(json);
}

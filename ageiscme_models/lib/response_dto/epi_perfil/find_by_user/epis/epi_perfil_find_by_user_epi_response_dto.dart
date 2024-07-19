import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_user_epi_response_dto.g.dart';
part 'epi_perfil_find_by_user_epi_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByUserEpiResponseDTO
    with _$EpiPerfilFindByUserEpiResponseDTO {
  factory EpiPerfilFindByUserEpiResponseDTO({
    required int cod,
    required int codPerfil,
    required int codEpiDescritor,
  }) = _EpiPerfilFindByUserEpiResponseDTO;

  factory EpiPerfilFindByUserEpiResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByUserEpiResponseDTOFromJson(json);
}

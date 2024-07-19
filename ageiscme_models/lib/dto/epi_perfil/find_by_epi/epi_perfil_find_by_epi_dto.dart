import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_epi_dto.g.dart';
part 'epi_perfil_find_by_epi_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByEpiDTO with _$EpiPerfilFindByEpiDTO {
  factory EpiPerfilFindByEpiDTO({
    required int codEpiDescritor,
  }) = _EpiPerfilFindByEpiDTO;

  factory EpiPerfilFindByEpiDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByEpiDTOFromJson(json);
}
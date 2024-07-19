import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_insert_dto.g.dart';
part 'epi_perfil_insert_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilInsertDTO with _$EpiPerfilInsertDTO {
  factory EpiPerfilInsertDTO({
    required int codDescritor,
    required int codPerfil,
  }) = _EpiPerfilInsertDTO;

  factory EpiPerfilInsertDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilInsertDTOFromJson(json);
}

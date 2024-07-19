import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_find_by_user_dto.g.dart';
part 'epi_perfil_find_by_user_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilFindByUserDTO with _$EpiPerfilFindByUserDTO {
  factory EpiPerfilFindByUserDTO({
    required int codUsuario,
  }) = _EpiPerfilFindByUserDTO;

  factory EpiPerfilFindByUserDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilFindByUserDTOFromJson(json);
}

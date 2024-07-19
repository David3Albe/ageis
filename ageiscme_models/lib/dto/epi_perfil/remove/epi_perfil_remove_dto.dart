import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_remove_dto.g.dart';
part 'epi_perfil_remove_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilRemoveDTO with _$EpiPerfilRemoveDTO {
  factory EpiPerfilRemoveDTO({
    required int cod,
  }) = _EpiPerfilRemoveDTO;

  factory EpiPerfilRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilRemoveDTOFromJson(json);
}

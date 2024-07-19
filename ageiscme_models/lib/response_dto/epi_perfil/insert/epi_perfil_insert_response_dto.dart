import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_perfil_insert_response_dto.g.dart';
part 'epi_perfil_insert_response_dto.freezed.dart';

@unfreezed
sealed class EpiPerfilInsertResponseDTO with _$EpiPerfilInsertResponseDTO {
  factory EpiPerfilInsertResponseDTO({
    required int cod,
  }) = _EpiPerfilInsertResponseDTO;

  factory EpiPerfilInsertResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EpiPerfilInsertResponseDTOFromJson(json);
}

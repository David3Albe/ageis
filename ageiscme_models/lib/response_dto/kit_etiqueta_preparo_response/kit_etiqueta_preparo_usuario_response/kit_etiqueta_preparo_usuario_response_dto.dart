import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_etiqueta_preparo_usuario_response_dto.freezed.dart';
part 'kit_etiqueta_preparo_usuario_response_dto.g.dart';

@unfreezed
sealed class KitEtiquetaPreparoUsuarioResponseDTO
    with _$KitEtiquetaPreparoUsuarioResponseDTO {
  factory KitEtiquetaPreparoUsuarioResponseDTO({
    required int cod,
    required String nome,
    String? docClasse,
  }) = _KitEtiquetaPreparoUsuarioResponseDTO;

  factory KitEtiquetaPreparoUsuarioResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$KitEtiquetaPreparoUsuarioResponseDTOFromJson(json);

  static KitEtiquetaPreparoUsuarioResponseDTO copy(
          KitEtiquetaPreparoUsuarioResponseDTO obj) =>
      KitEtiquetaPreparoUsuarioResponseDTO.fromJson(obj.toJson());
}

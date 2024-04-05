import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_preparo_usuario_response_dto.freezed.dart';
part 'item_etiqueta_preparo_usuario_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaPreparoUsuarioResponseDTO
    with _$ItemEtiquetaPreparoUsuarioResponseDTO {
  factory ItemEtiquetaPreparoUsuarioResponseDTO({
    required int cod,
    required String nome,
    String? docClasse,
  }) = _ItemEtiquetaPreparoUsuarioResponseDTO;

  factory ItemEtiquetaPreparoUsuarioResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemEtiquetaPreparoUsuarioResponseDTOFromJson(json);

  static ItemEtiquetaPreparoUsuarioResponseDTO copy(
          ItemEtiquetaPreparoUsuarioResponseDTO obj) =>
      ItemEtiquetaPreparoUsuarioResponseDTO.fromJson(obj.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_usuario_response_dto.freezed.dart';
part 'item_etiqueta_usuario_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaUsuarioResponseDTO with _$ItemEtiquetaUsuarioResponseDTO {

  factory ItemEtiquetaUsuarioResponseDTO({
    required int cod,
    required String nome,
  }) = _ItemEtiquetaUsuarioResponseDTO;

  factory ItemEtiquetaUsuarioResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaUsuarioResponseDTOFromJson(json);

  static ItemEtiquetaUsuarioResponseDTO copy(ItemEtiquetaUsuarioResponseDTO equipamento) =>
      ItemEtiquetaUsuarioResponseDTO.fromJson(equipamento.toJson());
}

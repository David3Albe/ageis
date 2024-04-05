import 'package:ageiscme_models/response_dto/item_etiqueta_response/item_etiqueta_usuario_response/item_etiqueta_usuario_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_response/item_rotulado_item_response/item_etiqueta_item_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_response_dto.freezed.dart';
part 'item_etiqueta_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaResponseDTO with _$ItemEtiquetaResponseDTO {
  factory ItemEtiquetaResponseDTO({
    required List<ItemEtiquetaItemResponseDTO> itens,
    required Map<int, ItemEtiquetaUsuarioResponseDTO> usuarios,
  }) = _ItemEtiquetaResponseDTO;

  factory ItemEtiquetaResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaResponseDTOFromJson(json);

  static ItemEtiquetaResponseDTO copy(ItemEtiquetaResponseDTO obj) =>
      ItemEtiquetaResponseDTO.fromJson(obj.toJson());
}

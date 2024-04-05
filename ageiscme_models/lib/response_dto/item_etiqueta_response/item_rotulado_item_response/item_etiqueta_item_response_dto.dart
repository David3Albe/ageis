import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_item_response_dto.freezed.dart';
part 'item_etiqueta_item_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaItemResponseDTO with _$ItemEtiquetaItemResponseDTO {
  factory ItemEtiquetaItemResponseDTO({
    required int cod,
    required int codItem,
    required String idEtiqueta,
    int? qtdeProcessos,
    DateTime? dataDescarte,
    String? nome,
    int? codUsuarioAlteracao,
  }) = _ItemEtiquetaItemResponseDTO;

  factory ItemEtiquetaItemResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaItemResponseDTOFromJson(json);

  static ItemEtiquetaItemResponseDTO copy(
          ItemEtiquetaItemResponseDTO obj) =>
      ItemEtiquetaItemResponseDTO.fromJson(obj.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_preparo_item_response_dto.freezed.dart';
part 'item_etiqueta_preparo_item_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaPreparoItemResponseDTO
    with _$ItemEtiquetaPreparoItemResponseDTO {
  factory ItemEtiquetaPreparoItemResponseDTO({
    required int cod,
    required String nome,
    required String idEtiqueta,
    required String nomeTipoProcesso,
    required String nomeProprietario,
    required bool urgencia,
  }) = _ItemEtiquetaPreparoItemResponseDTO;

  factory ItemEtiquetaPreparoItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemEtiquetaPreparoItemResponseDTOFromJson(json);

  static ItemEtiquetaPreparoItemResponseDTO copy(
          ItemEtiquetaPreparoItemResponseDTO obj) =>
      ItemEtiquetaPreparoItemResponseDTO.fromJson(obj.toJson());
}

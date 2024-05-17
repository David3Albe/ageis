import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_trocar_etiqueta_response_dto.freezed.dart';
part 'item_trocar_etiqueta_response_dto.g.dart';

@unfreezed
sealed class ItemTrocarEtiquetaResponseDTO
    with _$ItemTrocarEtiquetaResponseDTO {
  factory ItemTrocarEtiquetaResponseDTO() = _ItemTrocarEtiquetaResponseDTO;

  factory ItemTrocarEtiquetaResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemTrocarEtiquetaResponseDTOFromJson(json);

  static ItemTrocarEtiquetaResponseDTO copy(
          ItemTrocarEtiquetaResponseDTO obj) =>
      ItemTrocarEtiquetaResponseDTO.fromJson(obj.toJson());
}

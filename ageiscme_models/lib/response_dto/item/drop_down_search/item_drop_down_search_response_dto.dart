import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_drop_down_search_response_dto.freezed.dart';
part 'item_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class ItemDropDownSearchResponseDTO
    with _$ItemDropDownSearchResponseDTO {
  const ItemDropDownSearchResponseDTO._();
  factory ItemDropDownSearchResponseDTO({
    required int cod,
    required String idEtiqueta,
    String? descricao,
  }) = _ItemDropDownSearchResponseDTO;

  factory ItemDropDownSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemDropDownSearchResponseDTOFromJson(json);

  static ItemDropDownSearchResponseDTO copy(
          ItemDropDownSearchResponseDTO obj) =>
      ItemDropDownSearchResponseDTO.fromJson(obj.toJson());

  String IdEtiquetaDescricao() {
    return '$idEtiqueta ${descricao ?? ''}';
  }
}

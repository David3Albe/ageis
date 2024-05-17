import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/etiqueta/item_inserir_rapido_search_etiqueta_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_inserir_rapido_search_response_dto.freezed.dart';
part 'item_inserir_rapido_search_response_dto.g.dart';

@unfreezed
sealed class ItemInserirRapidoSearchResponseDTO
    with _$ItemInserirRapidoSearchResponseDTO {
  factory ItemInserirRapidoSearchResponseDTO({
    required List<ItemInserirRapidoSearchEtiquetaResponseDTO> etiquetas,
    String? idEtiqueta,
    int? qtdeMax,
    int? qtdeExistente,
  }) = _ItemInserirRapidoSearchResponseDTO;

  factory ItemInserirRapidoSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemInserirRapidoSearchResponseDTOFromJson(json);

  static ItemInserirRapidoSearchResponseDTO copy(
          ItemInserirRapidoSearchResponseDTO obj) =>
      ItemInserirRapidoSearchResponseDTO.fromJson(obj.toJson());
}

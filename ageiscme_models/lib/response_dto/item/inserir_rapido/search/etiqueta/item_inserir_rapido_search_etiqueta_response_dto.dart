import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_inserir_rapido_search_etiqueta_response_dto.freezed.dart';
part 'item_inserir_rapido_search_etiqueta_response_dto.g.dart';

@unfreezed
sealed class ItemInserirRapidoSearchEtiquetaResponseDTO
    with _$ItemInserirRapidoSearchEtiquetaResponseDTO {
  factory ItemInserirRapidoSearchEtiquetaResponseDTO({
    required String idEtiqueta,
  }) = _ItemInserirRapidoSearchEtiquetaResponseDTO;

  factory ItemInserirRapidoSearchEtiquetaResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemInserirRapidoSearchEtiquetaResponseDTOFromJson(json);

  static ItemInserirRapidoSearchEtiquetaResponseDTO copy(
          ItemInserirRapidoSearchEtiquetaResponseDTO obj) =>
      ItemInserirRapidoSearchEtiquetaResponseDTO.fromJson(obj.toJson());
}

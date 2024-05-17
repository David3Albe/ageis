import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_inserir_rapido_gerar_inserir_response_dto.freezed.dart';
part 'item_inserir_rapido_gerar_inserir_response_dto.g.dart';

@unfreezed
sealed class ItemInserirRapidoGerarInserirResponseDTO
    with _$ItemInserirRapidoGerarInserirResponseDTO {
  factory ItemInserirRapidoGerarInserirResponseDTO({
    required List<String> etiquetas,
  }) = _ItemInserirRapidoGerarInserirResponseDTO;

  factory ItemInserirRapidoGerarInserirResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemInserirRapidoGerarInserirResponseDTOFromJson(json);

  static ItemInserirRapidoGerarInserirResponseDTO copy(
          ItemInserirRapidoGerarInserirResponseDTO obj) =>
      ItemInserirRapidoGerarInserirResponseDTO.fromJson(obj.toJson());
}

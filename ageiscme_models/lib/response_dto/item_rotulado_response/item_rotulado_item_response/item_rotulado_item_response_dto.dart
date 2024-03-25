import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_rotulado_item_response_dto.freezed.dart';
part 'item_rotulado_item_response_dto.g.dart';

@unfreezed
sealed class ItemRotuladoItemResponseDTO with _$ItemRotuladoItemResponseDTO {
  factory ItemRotuladoItemResponseDTO({
    required int cod,
    required String idEtiqueta,
    required String nome,
    int? codProprietario,
    int? codTipoProcessoNormal,
  }) = _ItemRotuladoItemResponseDTO;
  
  factory ItemRotuladoItemResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemRotuladoItemResponseDTOFromJson(json);

  static ItemRotuladoItemResponseDTO copy(ItemRotuladoItemResponseDTO equipamento) =>
      ItemRotuladoItemResponseDTO.fromJson(equipamento.toJson());
}

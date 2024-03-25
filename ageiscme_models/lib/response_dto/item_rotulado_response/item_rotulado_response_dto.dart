import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_item_response/item_rotulado_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_proprietario_response/item_rotulado_proprietario_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_tipos_processo_normal_response/item_rotulado_tipos_processo_normal_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_rotulado_response_dto.freezed.dart';
part 'item_rotulado_response_dto.g.dart';

@unfreezed
sealed class ItemRotuladoResponseDTO with _$ItemRotuladoResponseDTO {
  factory ItemRotuladoResponseDTO({
    required List<ItemRotuladoItemResponseDTO> itens,
    required Map<int, ItemRotuladoProprietarioResponseDTO> proprietarios,
    required Map<int, ItemRotuladoTiposProcessoNormalResponseDTO> tiposProcessoNormal,
  }) = _ItemRotuladoResponseDTO;

  factory ItemRotuladoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemRotuladoResponseDTOFromJson(json);

  static ItemRotuladoResponseDTO copy(ItemRotuladoResponseDTO equipamento) =>
      ItemRotuladoResponseDTO.fromJson(equipamento.toJson());
}

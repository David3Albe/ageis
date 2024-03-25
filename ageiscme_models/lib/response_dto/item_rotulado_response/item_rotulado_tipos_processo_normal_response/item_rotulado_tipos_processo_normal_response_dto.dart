import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_rotulado_tipos_processo_normal_response_dto.freezed.dart';
part 'item_rotulado_tipos_processo_normal_response_dto.g.dart';

@unfreezed
sealed class ItemRotuladoTiposProcessoNormalResponseDTO with _$ItemRotuladoTiposProcessoNormalResponseDTO {

  factory ItemRotuladoTiposProcessoNormalResponseDTO({
    required int cod,
    required String nome,
  }) = _ItemRotuladoTiposProcessoNormalResponseDTO;

  factory ItemRotuladoTiposProcessoNormalResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemRotuladoTiposProcessoNormalResponseDTOFromJson(json);

  static ItemRotuladoTiposProcessoNormalResponseDTO copy(ItemRotuladoTiposProcessoNormalResponseDTO equipamento) =>
      ItemRotuladoTiposProcessoNormalResponseDTO.fromJson(equipamento.toJson());
}

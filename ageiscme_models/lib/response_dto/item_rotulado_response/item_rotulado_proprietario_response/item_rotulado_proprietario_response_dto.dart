import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_rotulado_proprietario_response_dto.freezed.dart';
part 'item_rotulado_proprietario_response_dto.g.dart';

@unfreezed
sealed class ItemRotuladoProprietarioResponseDTO with _$ItemRotuladoProprietarioResponseDTO {
  factory ItemRotuladoProprietarioResponseDTO({
    required int cod,
    required String nome,
  }) = _ItemRotuladoProprietarioResponseDTO;
  
  factory ItemRotuladoProprietarioResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemRotuladoProprietarioResponseDTOFromJson(json);

  static ItemRotuladoProprietarioResponseDTO copy(ItemRotuladoProprietarioResponseDTO equipamento) =>
      ItemRotuladoProprietarioResponseDTO.fromJson(equipamento.toJson());
}

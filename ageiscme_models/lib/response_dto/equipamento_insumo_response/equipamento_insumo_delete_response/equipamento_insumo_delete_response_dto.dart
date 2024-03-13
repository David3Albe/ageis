import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_delete_response_dto.freezed.dart';
part 'equipamento_insumo_delete_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoDeleteResponseDTO
    with _$EquipamentoInsumoDeleteResponseDTO {
  EquipamentoInsumoDeleteResponseDTO._();

  factory EquipamentoInsumoDeleteResponseDTO() =
      _EquipamentoInsumoDeleteResponseDTO;

  factory EquipamentoInsumoDeleteResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$EquipamentoInsumoDeleteResponseDTOFromJson(json);

  static EquipamentoInsumoDeleteResponseDTO copy(
          EquipamentoInsumoDeleteResponseDTO equipamento) =>
      EquipamentoInsumoDeleteResponseDTO.fromJson(equipamento.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_save_response_dto.freezed.dart';
part 'equipamento_insumo_save_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoSaveResponseDTO
    with _$EquipamentoInsumoSaveResponseDTO {
  EquipamentoInsumoSaveResponseDTO._();

  factory EquipamentoInsumoSaveResponseDTO() =
      _EquipamentoInsumoSaveResponseDTO;

  factory EquipamentoInsumoSaveResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$EquipamentoInsumoSaveResponseDTOFromJson(json);

  static EquipamentoInsumoSaveResponseDTO copy(
          EquipamentoInsumoSaveResponseDTO equipamento) =>
      EquipamentoInsumoSaveResponseDTO.fromJson(equipamento.toJson());
}

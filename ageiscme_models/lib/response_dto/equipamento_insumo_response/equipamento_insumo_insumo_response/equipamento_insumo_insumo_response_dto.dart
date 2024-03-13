import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_insumo_response_dto.freezed.dart';
part 'equipamento_insumo_insumo_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoInsumoResponseDTO with _$EquipamentoInsumoInsumoResponseDTO {
  EquipamentoInsumoInsumoResponseDTO._();

  factory EquipamentoInsumoInsumoResponseDTO({
    required int cod,
    String? nome,
  }) = _EquipamentoInsumoInsumoResponseDTO;

  factory EquipamentoInsumoInsumoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoInsumoResponseDTOFromJson(json);

  static EquipamentoInsumoInsumoResponseDTO copy(EquipamentoInsumoInsumoResponseDTO equipamento) =>
      EquipamentoInsumoInsumoResponseDTO.fromJson(equipamento.toJson());
}

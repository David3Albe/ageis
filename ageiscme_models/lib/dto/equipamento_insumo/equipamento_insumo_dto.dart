import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_dto.freezed.dart';
part 'equipamento_insumo_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoDTO with _$EquipamentoInsumoDTO {
  EquipamentoInsumoDTO._();

  factory EquipamentoInsumoDTO() = _EquipamentoInsumoDTO;

  factory EquipamentoInsumoDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoDTOFromJson(json);

  static EquipamentoInsumoDTO copy(EquipamentoInsumoDTO equipamento) =>
      EquipamentoInsumoDTO.fromJson(equipamento.toJson());
}

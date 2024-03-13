import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_delete_dto.freezed.dart';
part 'equipamento_insumo_delete_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoDeleteDTO with _$EquipamentoInsumoDeleteDTO {
  EquipamentoInsumoDeleteDTO._();

  factory EquipamentoInsumoDeleteDTO({
    required int cod,
  }) = _EquipamentoInsumoDeleteDTO;

  factory EquipamentoInsumoDeleteDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoDeleteDTOFromJson(json);

  static EquipamentoInsumoDeleteDTO copy(
          EquipamentoInsumoDeleteDTO equipamento) =>
      EquipamentoInsumoDeleteDTO.fromJson(equipamento.toJson());
}

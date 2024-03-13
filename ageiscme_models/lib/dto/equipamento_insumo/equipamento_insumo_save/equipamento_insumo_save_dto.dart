import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_save_dto.freezed.dart';
part 'equipamento_insumo_save_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoSaveDTO with _$EquipamentoInsumoSaveDTO {
  EquipamentoInsumoSaveDTO._();

  factory EquipamentoInsumoSaveDTO({
    required int cod,
    int? codEquipamento,
    int? codInsumo,
    double? consumoPorProcesso,
    String? tstamp,
  }) = _EquipamentoInsumoSaveDTO;

  factory EquipamentoInsumoSaveDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoSaveDTOFromJson(json);

  static EquipamentoInsumoSaveDTO copy(EquipamentoInsumoSaveDTO equipamento) =>
      EquipamentoInsumoSaveDTO.fromJson(equipamento.toJson());
}

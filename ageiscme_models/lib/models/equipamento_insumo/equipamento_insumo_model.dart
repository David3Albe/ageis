import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_model.freezed.dart';
part 'equipamento_insumo_model.g.dart';

@unfreezed
abstract class EquipamentoInsumoModel with _$EquipamentoInsumoModel {
  EquipamentoInsumoModel._();

  factory EquipamentoInsumoModel({
    int? cod,
    int? codEquipamento,
    int? codInsumo,
    double? consumoPorProcesso,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    String? tstamp,
  }) = _EquipamentoInsumoModel;

  factory EquipamentoInsumoModel.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoModelFromJson(json);

  static EquipamentoInsumoModel copy(EquipamentoInsumoModel equipamento) =>
      EquipamentoInsumoModel.fromJson(equipamento.toJson());
}

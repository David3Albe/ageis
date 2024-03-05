import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'lote_equipamento_model.freezed.dart';
part 'lote_equipamento_model.g.dart';

@unfreezed
abstract class LoteEquipamentoModel with _$LoteEquipamentoModel {
  const LoteEquipamentoModel._();
  factory LoteEquipamentoModel({
    String? codLote,
  }) = _LoteEquipamentoModel;

  factory LoteEquipamentoModel.fromJson(Map<String, Object?> json) =>
      _$LoteEquipamentoModelFromJson(json);
}

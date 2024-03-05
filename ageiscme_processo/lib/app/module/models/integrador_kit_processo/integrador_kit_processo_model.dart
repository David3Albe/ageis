import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'integrador_kit_processo_model.freezed.dart';
part 'integrador_kit_processo_model.g.dart';

@unfreezed
abstract class IntegradorKitProcessoModel with _$IntegradorKitProcessoModel {
  const IntegradorKitProcessoModel._();
  factory IntegradorKitProcessoModel({
    bool? solicitouIntegradorKit,
    bool? utilizouIntegradorKit,
    int? codKit,
  }) = _IntegradorKitProcessoModel;

  factory IntegradorKitProcessoModel.fromJson(Map<String, Object?> json) =>
      _$IntegradorKitProcessoModelFromJson(json);
}

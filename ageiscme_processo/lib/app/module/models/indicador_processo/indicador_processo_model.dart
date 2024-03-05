import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'indicador_processo_model.freezed.dart';
part 'indicador_processo_model.g.dart';

@unfreezed
abstract class IndicadorProcessoModel with _$IndicadorProcessoModel {
  const IndicadorProcessoModel._();
  factory IndicadorProcessoModel({
    String? codBarra,
  }) = _IndicadorProcessoModel;

  factory IndicadorProcessoModel.fromJson(Map<String, Object?> json) =>
      _$IndicadorProcessoModelFromJson(json);
}

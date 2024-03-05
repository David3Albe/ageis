import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'conferencia_visual_processo_model.freezed.dart';
part 'conferencia_visual_processo_model.g.dart';

@unfreezed
abstract class ConferenciaVisualProcessoModel with _$ConferenciaVisualProcessoModel {
  const ConferenciaVisualProcessoModel._();
  factory ConferenciaVisualProcessoModel({
    int? codKit,
  }) = _ConferenciaVisualProcessoModel;

  factory ConferenciaVisualProcessoModel.fromJson(Map<String, Object?> json) =>
      _$ConferenciaVisualProcessoModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'indicador_biologico_processo_model.freezed.dart';
part 'indicador_biologico_processo_model.g.dart';

@unfreezed
abstract class IndicadorBiologicoProcessoModel with _$IndicadorBiologicoProcessoModel {
  const IndicadorBiologicoProcessoModel._();
  factory IndicadorBiologicoProcessoModel({
    String? codBarra,
    int? codServicoTipo,
  }) = _IndicadorBiologicoProcessoModel;

  factory IndicadorBiologicoProcessoModel.fromJson(Map<String, Object?> json) =>
      _$IndicadorBiologicoProcessoModelFromJson(json);
}

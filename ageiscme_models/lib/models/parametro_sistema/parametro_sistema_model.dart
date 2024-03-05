import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'parametro_sistema_model.freezed.dart';
part 'parametro_sistema_model.g.dart';

@unfreezed
abstract class ParametroSistemaModel with _$ParametroSistemaModel {
  factory ParametroSistemaModel({
    required int? cod,
    required String? versaoSW,
    required DateTime? dataVersaoSW,
    required int? qtdeMaxProcessosEtiqueta,
    required int? codInstituicao,
    required int? indicador,
    required String? letraConsignado,
    required String? licenca,
    required bool? zeraEtiquetaRotulado,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ParametroSistemaModel;

  factory ParametroSistemaModel.fromJson(Map<String, Object?> json) =>
      _$ParametroSistemaModelFromJson(json);

  static ParametroSistemaModel copy(ParametroSistemaModel parametroSistema) =>
      ParametroSistemaModel.fromJson(parametroSistema.toJson());

  factory ParametroSistemaModel.empty() => ParametroSistemaModel(
        cod: 0,
        versaoSW: '',
        dataVersaoSW: DateTime.now(),
        qtdeMaxProcessosEtiqueta: 0,
        codInstituicao: 0,
        indicador: 0,
        letraConsignado: '',
        licenca: '',
        zeraEtiquetaRotulado: false,
        ultimaAlteracao: null,
        tstamp: '',
      );
}

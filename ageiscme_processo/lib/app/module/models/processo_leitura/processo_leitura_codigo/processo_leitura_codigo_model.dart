import 'package:ageiscme_processo/app/module/enums/tipo_alerta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_codigo_model.g.dart';
part 'processo_leitura_codigo_model.freezed.dart';

@unfreezed
sealed class ProcessoLeituraCodigoModel with _$ProcessoLeituraCodigoModel {
  const ProcessoLeituraCodigoModel._();

  factory ProcessoLeituraCodigoModel({
    required String? codigoLido,
    required List<int> avisosSonoro,
    required bool? cancelarLeituras,
    required bool? leituraFinalizada,
    required bool? alertaVermelho,
    required bool? fecharTelaExtra,
    required TipoAlerta? tipoAlerta,
  }) = _ProcessoLeituraCodigoModel;

  factory ProcessoLeituraCodigoModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraCodigoModelFromJson(json);

  static ProcessoLeituraCodigoModel copy(
    ProcessoLeituraCodigoModel processoLeituraCodigo,
  ) =>
      ProcessoLeituraCodigoModel.fromJson(processoLeituraCodigo.toJson());

  factory ProcessoLeituraCodigoModel.empty() => ProcessoLeituraCodigoModel(
        alertaVermelho: null,
        codigoLido: null,
        avisosSonoro: [],
        cancelarLeituras: null,
        leituraFinalizada: null,
        tipoAlerta: null,
        fecharTelaExtra: null,
      );
}

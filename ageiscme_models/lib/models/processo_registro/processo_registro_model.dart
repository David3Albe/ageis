import 'package:ageiscme_models/models/processo_leitura/processo_leitura_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_registro_model.g.dart';
part 'processo_registro_model.freezed.dart';

@unfreezed
sealed class ProcessoRegistroModel with _$ProcessoRegistroModel {
  const ProcessoRegistroModel._();

  factory ProcessoRegistroModel({
    required int? cod,
    required int? codEtapaProcesso,
    required DateTime? dataHoraInicio,
    required DateTime? dataHoraTermino,
    required int? codUsuario,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    required String? indicador,
    required String? biologico,
    required ProcessoLeituraModel? leitura,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoRegistroModel;

  factory ProcessoRegistroModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoRegistroModelFromJson(json);

  static ProcessoRegistroModel copy(ProcessoRegistroModel processoRegistro) {
    return ProcessoRegistroModel.fromJson(processoRegistro.toJson());
  }

  factory ProcessoRegistroModel.empty() => ProcessoRegistroModel(
        cod: 0,
        biologico: null,
        codEtapaProcesso: null,
        codUsuario: null,
        dataHoraInicio: null,
        dataHoraTermino: null,
        indicador: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        leitura: null,
      );
}

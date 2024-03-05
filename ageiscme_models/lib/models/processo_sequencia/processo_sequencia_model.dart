import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_sequencia_model.freezed.dart';
part 'processo_sequencia_model.g.dart';

@unfreezed
abstract class ProcessoSequenciaModel with _$ProcessoSequenciaModel {
  const ProcessoSequenciaModel._();

  factory ProcessoSequenciaModel({
    required int? cod,
    required int? codEtapaProcesso,
    required ProcessoEtapaModel? etapa,
    required int? codEtapaSeguinte,
    required ProcessoEtapaModel? etapaSequinte,
    required int? codInstituicao,
    required InstituicaoModel? instituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoSequenciaModel;

  factory ProcessoSequenciaModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoSequenciaModelFromJson(json);

  static ProcessoSequenciaModel copy(ProcessoSequenciaModel obj) {
    return ProcessoSequenciaModel.fromJson(obj.toJson());
  }

  factory ProcessoSequenciaModel.empty() => ProcessoSequenciaModel(
        cod: null,
        codEtapaProcesso: null,
        codEtapaSeguinte: null,
        codInstituicao: null,
        etapa: null,
        etapaSequinte: null,
        instituicao: null,
        tstamp: null,
        ultimaAlteracao: null,
      );
}

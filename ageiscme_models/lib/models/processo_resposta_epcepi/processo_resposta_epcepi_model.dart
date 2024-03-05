import 'package:ageiscme_models/models/equipamento/equipamento_model.dart';
import 'package:ageiscme_models/models/instituicao/instituicao_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_resposta_epcepi_model.g.dart';
part 'processo_resposta_epcepi_model.freezed.dart';

@unfreezed
sealed class ProcessoRespostaEPCEPIModel with _$ProcessoRespostaEPCEPIModel {
  const ProcessoRespostaEPCEPIModel._();

  factory ProcessoRespostaEPCEPIModel({
    required int? cod,
    required int? codInstituicao,
    required InstituicaoModel? instituicao,
    required int? codUsuario,
    required int? codUsuarioLiberacao,
    required DateTime? dataHora,
    required int? resposta,
    required int? codEquipamento,
    required int? codEstoque,
    required EquipamentoModel? equipamento,
    required String? entradaSaida,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoRespostaEPCEPIModel;

  factory ProcessoRespostaEPCEPIModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoRespostaEPCEPIModelFromJson(json);

  static ProcessoRespostaEPCEPIModel copy(ProcessoRespostaEPCEPIModel processoRespostaEPCEPI) {
    return ProcessoRespostaEPCEPIModel.fromJson(processoRespostaEPCEPI.toJson());
  }
} 
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_detalhe_registro_model.g.dart';
part 'processo_detalhe_registro_model.freezed.dart';

@unfreezed
sealed class ProcessoDetalheRegistroModel with _$ProcessoDetalheRegistroModel {
  const ProcessoDetalheRegistroModel._();

  factory ProcessoDetalheRegistroModel({
    required int? cod,
    required int? codRegistroProcesso,
    required int? codUsuarioEntrega,
    required int? codLocalEntrega,
    required String? entregaRetirada,
    required int? codUsuarioRetirada,
    required int? codLocalRetirada,
    required String? prontuarioRetirada,
    required bool? conferidoVisualmente,
    required String? nivelPrioridade,
    required String? observacao,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    required int? codCirurgiao,
    required String? nomePaciente,
    required String? medico,
    required String? loteIndicadorAutoclave,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ProcessoDetalheRegistroModel;

  factory ProcessoDetalheRegistroModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoDetalheRegistroModelFromJson(json);

  static ProcessoDetalheRegistroModel copy(
      ProcessoDetalheRegistroModel processoRegistro) {
    return ProcessoDetalheRegistroModel.fromJson(processoRegistro.toJson());
  }

  factory ProcessoDetalheRegistroModel.empty() => ProcessoDetalheRegistroModel(
        cod: 0,
        codCirurgiao: null,
        codLocalEntrega: null,
        codLocalRetirada: null,
        codRegistroProcesso: null,
        codUsuarioEntrega: null,
        codUsuarioRetirada: null,
        conferidoVisualmente: null,
        entregaRetirada: null,
        loteIndicadorAutoclave: null,
        nivelPrioridade: null,
        nomePaciente: null,
        observacao: null,
        prontuarioRetirada: null,
        medico: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}

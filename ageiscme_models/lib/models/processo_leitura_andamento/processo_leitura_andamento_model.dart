import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_andamento_model.freezed.dart';
part 'processo_leitura_andamento_model.g.dart';

@unfreezed
abstract class ProcessoLeituraAndamentoModel
    with _$ProcessoLeituraAndamentoModel {
  const ProcessoLeituraAndamentoModel._();

  factory ProcessoLeituraAndamentoModel({
    required int? cod,
    required int? codUsuario,
    required DateTime? dataHora,
    required String? dados,
    required String? maquina,
    required UsuarioModel? usuario,
  }) = _ProcessoLeituraAndamentoModel;

  factory ProcessoLeituraAndamentoModel.atualizarRefreshTimeDTO({
    required int cod,
    required int codUsuario,
  }) =>
      ProcessoLeituraAndamentoModel(
        cod: cod,
        codUsuario: codUsuario,
        dados: null,
        dataHora: null,
        maquina: null,
        usuario: null,
      );

  factory ProcessoLeituraAndamentoModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraAndamentoModelFromJson(json);
}

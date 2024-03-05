import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_monitoramento_model.freezed.dart';
part 'equipamento_monitoramento_model.g.dart';

@unfreezed
abstract class EquipamentoMonitoramentoModel
    with _$EquipamentoMonitoramentoModel {
  factory EquipamentoMonitoramentoModel({
    required int cod,
    required String indicador,
    required String resultado,
    required String descricao,
    required String restricao,
    required String usuarioRegistro,
    required String lote,
    required String tecnico,
    required String imagemDocAnexo,
    required String motivoLiberacao,
    required DateTime dataEnvio,
    required DateTime dataRetorno,
    required DateTime dataInicio,
    required DateTime dataTermino,
    required DateTime dataValidade,
    required DateTime dataLiberacao,
    required DateTime dataRegistro,
    required int codUsuario,
    required int codEquipamento,
    required int codItem,
    required int codEstoque,
    required int codUsuarioLiberado,
    required int codServicosTipo,
    required int codInstituicao,    
    required double temperatura,
    required double umidade,
    required double temperaturaMax,
    required double temperaturaMin,
    required double umidadeMax,
    required double umidadeMin,
    required String docAnexa,
    required String docAnexaNome,
    required bool controlarValidade,
    required DateTime ultimaAlteracao,
    required String tstamp,
  }) = _EquipamentoMonitoramentoModel;

  factory EquipamentoMonitoramentoModel.fromJson(Map<String, Object?> json) 
    => _$EquipamentoMonitoramentoModelFromJson(json);
}

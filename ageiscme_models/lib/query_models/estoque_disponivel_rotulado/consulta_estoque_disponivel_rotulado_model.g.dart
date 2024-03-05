// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_disponivel_rotulado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueDisponivelRotuladoModelImpl
    _$$ConsultaEstoqueDisponivelRotuladoModelImplFromJson(Map json) =>
        _$ConsultaEstoqueDisponivelRotuladoModelImpl(
          codItem: json['codItem'] as int?,
          quantidade: json['quantidade'] as int?,
          proprietario: json['proprietario'] as String?,
          arsenalEstoque: json['arsenalEstoque'] == null
              ? null
              : ArsenalEstoqueModel.fromJson(
                  Map<String, Object?>.from(json['arsenalEstoque'] as Map)),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          entradaSaida: json['entradaSaida'] as String?,
          etiqueta: json['etiqueta'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          equipamentoNome: json['equipamentoNome'] as String?,
          etapaProcesso: json['etapaProcesso'] as String?,
          tipoProcesso: json['tipoProcesso'] as String?,
          nivelPrioridade: json['nivelPrioridade'] as String?,
          usuario: json['usuario'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          codItemRotulo: json['codItemRotulo'] as int?,
          motivo: json['motivo'] as String?,
          motivoQuebraFluxo: json['motivoQuebraFluxo'] as String?,
          observacao: json['observacao'] as String?,
          codKit: json['codKit'] as int?,
        );

Map<String, dynamic> _$$ConsultaEstoqueDisponivelRotuladoModelImplToJson(
        _$ConsultaEstoqueDisponivelRotuladoModelImpl instance) =>
    <String, dynamic>{
      'codItem': instance.codItem,
      'quantidade': instance.quantidade,
      'proprietario': instance.proprietario,
      'arsenalEstoque': instance.arsenalEstoque?.toJson(),
      'item': instance.item?.toJson(),
      'dataHora': instance.dataHora?.toIso8601String(),
      'entradaSaida': instance.entradaSaida,
      'etiqueta': instance.etiqueta,
      'descricaoItem': instance.descricaoItem,
      'nomeProprietario': instance.nomeProprietario,
      'equipamentoNome': instance.equipamentoNome,
      'etapaProcesso': instance.etapaProcesso,
      'tipoProcesso': instance.tipoProcesso,
      'nivelPrioridade': instance.nivelPrioridade,
      'usuario': instance.usuario,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'origem': instance.origem,
      'destino': instance.destino,
      'circulante': instance.circulante,
      'codItemRotulo': instance.codItemRotulo,
      'motivo': instance.motivo,
      'motivoQuebraFluxo': instance.motivoQuebraFluxo,
      'observacao': instance.observacao,
      'codKit': instance.codKit,
    };

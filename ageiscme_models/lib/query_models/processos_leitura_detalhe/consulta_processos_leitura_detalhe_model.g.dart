// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_detalhe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDetalheModelImpl
    _$$ConsultaProcessosLeituraDetalheModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDetalheModelImpl(
          entregaRetirada: json['entregaRetirada'] as String?,
          codUsuarioEntrega: json['codUsuarioEntrega'] as int?,
          nomeUsuarioEntrega: json['nomeUsuarioEntrega'] as String?,
          codUsuarioRetirada: json['codUsuarioRetirada'] as int?,
          nomeUsuarioRetirada: json['nomeUsuarioRetirada'] as String?,
          codLocalEntrega: json['codLocalEntrega'] as int?,
          nomeLocalEntrega: json['nomeLocalEntrega'] as String?,
          codLocalRetirada: json['codLocalRetirada'] as int?,
          nomeLocalRetirada: json['nomeLocalRetirada'] as String?,
          codCirurgiao: json['codCirurgiao'] as int?,
          nomeCirurgiao: json['nomeCirurgiao'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          conferidoVisualmente: json['conferidoVisualmente'] as bool?,
          nivelPrioridade: json['nivelPrioridade'] as String?,
          observacao: json['observacao'] as String?,
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDetalheModelImplToJson(
        _$ConsultaProcessosLeituraDetalheModelImpl instance) =>
    <String, dynamic>{
      'entregaRetirada': instance.entregaRetirada,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
      'nomeUsuarioEntrega': instance.nomeUsuarioEntrega,
      'codUsuarioRetirada': instance.codUsuarioRetirada,
      'nomeUsuarioRetirada': instance.nomeUsuarioRetirada,
      'codLocalEntrega': instance.codLocalEntrega,
      'nomeLocalEntrega': instance.nomeLocalEntrega,
      'codLocalRetirada': instance.codLocalRetirada,
      'nomeLocalRetirada': instance.nomeLocalRetirada,
      'codCirurgiao': instance.codCirurgiao,
      'nomeCirurgiao': instance.nomeCirurgiao,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'nivelPrioridade': instance.nivelPrioridade,
      'observacao': instance.observacao,
      'codRegistroProcesso': instance.codRegistroProcesso,
    };

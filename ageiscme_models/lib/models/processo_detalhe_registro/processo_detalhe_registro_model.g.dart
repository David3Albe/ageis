// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_detalhe_registro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoDetalheRegistroModelImpl _$$ProcessoDetalheRegistroModelImplFromJson(
        Map json) =>
    _$ProcessoDetalheRegistroModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
      codUsuarioEntrega: (json['codUsuarioEntrega'] as num?)?.toInt(),
      codLocalEntrega: (json['codLocalEntrega'] as num?)?.toInt(),
      entregaRetirada: json['entregaRetirada'] as String?,
      codUsuarioRetirada: (json['codUsuarioRetirada'] as num?)?.toInt(),
      codLocalRetirada: (json['codLocalRetirada'] as num?)?.toInt(),
      prontuarioRetirada: json['prontuarioRetirada'] as String?,
      conferidoVisualmente: json['conferidoVisualmente'] as bool?,
      nivelPrioridade: json['nivelPrioridade'] as String?,
      observacao: json['observacao'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      codCirurgiao: (json['codCirurgiao'] as num?)?.toInt(),
      nomePaciente: json['nomePaciente'] as String?,
      medico: json['medico'] as String?,
      loteIndicadorAutoclave: json['loteIndicadorAutoclave'] as String?,
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoDetalheRegistroModelImplToJson(
        _$ProcessoDetalheRegistroModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
      'codLocalEntrega': instance.codLocalEntrega,
      'entregaRetirada': instance.entregaRetirada,
      'codUsuarioRetirada': instance.codUsuarioRetirada,
      'codLocalRetirada': instance.codLocalRetirada,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'conferidoVisualmente': instance.conferidoVisualmente,
      'nivelPrioridade': instance.nivelPrioridade,
      'observacao': instance.observacao,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'codCirurgiao': instance.codCirurgiao,
      'nomePaciente': instance.nomePaciente,
      'medico': instance.medico,
      'loteIndicadorAutoclave': instance.loteIndicadorAutoclave,
      'tStamp': instance.tstamp,
    };

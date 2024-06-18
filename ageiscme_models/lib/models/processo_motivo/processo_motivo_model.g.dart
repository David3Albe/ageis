// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_motivo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoMotivoModelImpl _$$ProcessoMotivoModelImplFromJson(Map json) =>
    _$ProcessoMotivoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      arsenal: json['arsenal'] as bool?,
      preparo: json['preparo'] as bool?,
      recepcaoExpurgo: json['recepcaoExpurgo'] as bool?,
      bloquearPreparo: json['bloquearPreparo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoMotivoModelImplToJson(
        _$ProcessoMotivoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'arsenal': instance.arsenal,
      'preparo': instance.preparo,
      'recepcaoExpurgo': instance.recepcaoExpurgo,
      'bloquearPreparo': instance.bloquearPreparo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

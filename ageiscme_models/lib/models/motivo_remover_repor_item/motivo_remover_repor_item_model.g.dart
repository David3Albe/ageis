// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivo_remover_repor_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotivoRemoverReporItemModelImpl _$$MotivoRemoverReporItemModelImplFromJson(
        Map json) =>
    _$MotivoRemoverReporItemModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      remover: json['remover'] as bool?,
      repor: json['repor'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$MotivoRemoverReporItemModelImplToJson(
        _$MotivoRemoverReporItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'remover': instance.remover,
      'repor': instance.repor,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

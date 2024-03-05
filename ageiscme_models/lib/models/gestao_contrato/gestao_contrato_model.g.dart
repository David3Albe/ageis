// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestao_contrato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GestaoContratoModelImpl _$$GestaoContratoModelImplFromJson(Map json) =>
    _$GestaoContratoModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      link: json['link'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$GestaoContratoModelImplToJson(
        _$GestaoContratoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'link': instance.link,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

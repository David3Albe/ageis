// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_arsenal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizacaoArsenalModelImpl _$$LocalizacaoArsenalModelImplFromJson(
        Map json) =>
    _$LocalizacaoArsenalModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      local: json['local'] as String?,
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      codBarra: (json['codBarra'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      arsenal: json['arsenal'] == null
          ? null
          : ArsenalEstoqueModel.fromJson(
              Map<String, Object?>.from(json['arsenal'] as Map)),
    );

Map<String, dynamic> _$$LocalizacaoArsenalModelImplToJson(
        _$LocalizacaoArsenalModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'local': instance.local,
      'codEstoque': instance.codEstoque,
      'codBarra': instance.codBarra,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'arsenal': instance.arsenal?.toJson(),
    };

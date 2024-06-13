// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaSaveDTOImpl _$$SiglaSaveDTOImplFromJson(Map json) => _$SiglaSaveDTOImpl(
      cod: json['cod'] as int,
      descricao: json['descricao'] as String,
      sigla: json['sigla'] as String,
      ativo: json['ativo'] as bool,
      corRGB: json['corRGB'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
    );

Map<String, dynamic> _$$SiglaSaveDTOImplToJson(_$SiglaSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'sigla': instance.sigla,
      'ativo': instance.ativo,
      'corRGB': instance.corRGB,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'codInstituicao': instance.codInstituicao,
    };

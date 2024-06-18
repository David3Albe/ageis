// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaSaveDTOImpl _$$SiglaSaveDTOImplFromJson(Map json) => _$SiglaSaveDTOImpl(
      cod: (json['cod'] as num).toInt(),
      descricao: json['descricao'] as String,
      sigla: json['sigla'] as String,
      ativo: json['ativo'] as bool,
      r: (json['r'] as num?)?.toInt(),
      g: (json['g'] as num?)?.toInt(),
      b: (json['b'] as num?)?.toInt(),
      o: (json['o'] as num?)?.toDouble(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SiglaSaveDTOImplToJson(_$SiglaSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'sigla': instance.sigla,
      'ativo': instance.ativo,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'o': instance.o,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'codInstituicao': instance.codInstituicao,
    };

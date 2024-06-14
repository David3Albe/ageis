// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnoSaveDTOImpl _$$TurnoSaveDTOImplFromJson(Map json) => _$TurnoSaveDTOImpl(
      cod: json['cod'] as int,
      descricao: json['descricao'] as String,
      ativo: json['ativo'] as bool,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
    );

Map<String, dynamic> _$$TurnoSaveDTOImplToJson(_$TurnoSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'codInstituicao': instance.codInstituicao,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fabricante_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FabricanteModelImpl _$$FabricanteModelImplFromJson(Map json) =>
    _$FabricanteModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$FabricanteModelImplToJson(
        _$FabricanteModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

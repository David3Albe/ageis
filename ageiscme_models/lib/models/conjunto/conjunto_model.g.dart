// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conjunto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConjuntoModelImpl _$$ConjuntoModelImplFromJson(Map json) =>
    _$ConjuntoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ConjuntoModelImplToJson(_$ConjuntoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

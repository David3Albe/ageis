// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embalagem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmbalagemModelImpl _$$EmbalagemModelImplFromJson(Map json) =>
    _$EmbalagemModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      validadeProcessosDias: json['validadeProcessosDias'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EmbalagemModelImplToJson(
        _$EmbalagemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'validadeProcessosDias': instance.validadeProcessosDias,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

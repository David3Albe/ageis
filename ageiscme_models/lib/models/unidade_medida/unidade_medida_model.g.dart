// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidade_medida_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnidadeMedidaModelImpl _$$UnidadeMedidaModelImplFromJson(Map json) =>
    _$UnidadeMedidaModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$UnidadeMedidaModelImplToJson(
        _$UnidadeMedidaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

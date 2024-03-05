// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etiqueta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtiquetaModelImpl _$$EtiquetaModelImplFromJson(Map json) =>
    _$EtiquetaModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      limiteProcessos: json['limiteProcessos'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EtiquetaModelImplToJson(_$EtiquetaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'limiteProcessos': instance.limiteProcessos,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_consignado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorConsignadoModelImpl _$$ItemDescritorConsignadoModelImplFromJson(
        Map json) =>
    _$ItemDescritorConsignadoModelImpl(
      cod: json['cod'] as int?,
      codItemDescritor: json['codItemDescritor'] as int?,
      descricao: json['descricao'] as String?,
      quantidade: json['quantidade'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ItemDescritorConsignadoModelImplToJson(
        _$ItemDescritorConsignadoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codItemDescritor': instance.codItemDescritor,
      'descricao': instance.descricao,
      'quantidade': instance.quantidade,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

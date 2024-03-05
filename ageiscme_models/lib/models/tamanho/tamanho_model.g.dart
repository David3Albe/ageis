// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamanho_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TamanhoModelImpl _$$TamanhoModelImplFromJson(Map json) => _$TamanhoModelImpl(
      cod: json['cod'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      descricao: json['descricao'] as String?,
      referencial: json['referencial'] as int?,
      sigla: json['sigla'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$TamanhoModelImplToJson(_$TamanhoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInstituicao': instance.codInstituicao,
      'descricao': instance.descricao,
      'referencial': instance.referencial,
      'sigla': instance.sigla,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

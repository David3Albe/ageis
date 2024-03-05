// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peca_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PecaModelImpl _$$PecaModelImplFromJson(Map json) => _$PecaModelImpl(
      cod: json['cod'] as int?,
      peca: json['peca'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$PecaModelImplToJson(_$PecaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'peca': instance.peca,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

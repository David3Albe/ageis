// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivo_quebra_fluxo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotivoQuebraFluxoModelImpl _$$MotivoQuebraFluxoModelImplFromJson(Map json) =>
    _$MotivoQuebraFluxoModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$MotivoQuebraFluxoModelImplToJson(
        _$MotivoQuebraFluxoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

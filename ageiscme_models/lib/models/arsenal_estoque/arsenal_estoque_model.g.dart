// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal_estoque_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArsenalEstoqueModelImpl _$$ArsenalEstoqueModelImplFromJson(Map json) =>
    _$ArsenalEstoqueModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      codBarra: json['codBarra'] as String?,
      codLocal: (json['codLocal'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      processosEtapas: (json['processosEtapas'] as List<dynamic>?)
          ?.map((e) =>
              ProcessoEtapaModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      tstamp: json['tStamp'] as String?,
      local: json['local'] == null
          ? null
          : LocalInstituicaoModel.fromJson(
              Map<String, Object?>.from(json['local'] as Map)),
      locaisArs: (json['locaisArs'] as List<dynamic>?)
          ?.map((e) => LocalizacaoArsenalModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ArsenalEstoqueModelImplToJson(
        _$ArsenalEstoqueModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codBarra': instance.codBarra,
      'codLocal': instance.codLocal,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'processosEtapas':
          instance.processosEtapas?.map((e) => e.toJson()).toList(),
      'tStamp': instance.tstamp,
      'local': instance.local?.toJson(),
      'locaisArs': instance.locaisArs?.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_sequencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoSequenciaModelImpl _$$ProcessoSequenciaModelImplFromJson(Map json) =>
    _$ProcessoSequenciaModelImpl(
      cod: json['cod'] as int?,
      codEtapaProcesso: json['codEtapaProcesso'] as int?,
      etapa: json['etapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapa'] as Map)),
      codEtapaSeguinte: json['codEtapaSeguinte'] as int?,
      etapaSequinte: json['etapaSequinte'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapaSequinte'] as Map)),
      codInstituicao: json['codInstituicao'] as int?,
      instituicao: json['instituicao'] == null
          ? null
          : InstituicaoModel.fromJson(
              Map<String, Object?>.from(json['instituicao'] as Map)),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoSequenciaModelImplToJson(
        _$ProcessoSequenciaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'etapa': instance.etapa?.toJson(),
      'codEtapaSeguinte': instance.codEtapaSeguinte,
      'etapaSequinte': instance.etapaSequinte?.toJson(),
      'codInstituicao': instance.codInstituicao,
      'instituicao': instance.instituicao?.toJson(),
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

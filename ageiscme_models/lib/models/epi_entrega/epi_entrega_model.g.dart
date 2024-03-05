// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_entrega_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiEntregaModelImpl _$$EpiEntregaModelImplFromJson(Map json) =>
    _$EpiEntregaModelImpl(
      cod: json['cod'] as int?,
      codDescritorEpi: json['codDescritorEpi'] as int?,
      codUsuario: json['codUsuario'] as int?,
      codUsuarioEntrega: json['codUsuarioEntrega'] as int?,
      dataEntrega: json['dataEntrega'] == null
          ? null
          : DateTime.parse(json['dataEntrega'] as String),
      dataLimiteValidade: json['dataLimiteValidade'] == null
          ? null
          : DateTime.parse(json['dataLimiteValidade'] as String),
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      conferenciaVisual: json['conferenciaVisual'] as bool?,
      codInstituicao: json['codInstituicao'] as int?,
      controlarValidade: json['controlarValidade'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      epiDescritor: json['epiDescritor'] == null
          ? null
          : EpiDescritorModel.fromJson(
              Map<String, Object?>.from(json['epiDescritor'] as Map)),
    );

Map<String, dynamic> _$$EpiEntregaModelImplToJson(
        _$EpiEntregaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codDescritorEpi': instance.codDescritorEpi,
      'codUsuario': instance.codUsuario,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
      'dataEntrega': instance.dataEntrega?.toIso8601String(),
      'dataLimiteValidade': instance.dataLimiteValidade?.toIso8601String(),
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'conferenciaVisual': instance.conferenciaVisual,
      'codInstituicao': instance.codInstituicao,
      'controlarValidade': instance.controlarValidade,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'epiDescritor': instance.epiDescritor?.toJson(),
    };

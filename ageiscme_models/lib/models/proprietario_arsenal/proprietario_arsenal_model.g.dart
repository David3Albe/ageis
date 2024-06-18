// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_arsenal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProprietarioArsenalModelImpl _$$ProprietarioArsenalModelImplFromJson(
        Map json) =>
    _$ProprietarioArsenalModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codProprietario: (json['codProprietario'] as num?)?.toInt(),
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      proprietario: json['proprietario'] == null
          ? null
          : ProprietarioModel.fromJson(
              Map<String, Object?>.from(json['proprietario'] as Map)),
    );

Map<String, dynamic> _$$ProprietarioArsenalModelImplToJson(
        _$ProprietarioArsenalModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codProprietario': instance.codProprietario,
      'codEstoque': instance.codEstoque,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'proprietario': instance.proprietario?.toJson(),
    };

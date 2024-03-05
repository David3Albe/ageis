// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_arsenal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProprietarioArsenalModelImpl _$$ProprietarioArsenalModelImplFromJson(
        Map json) =>
    _$ProprietarioArsenalModelImpl(
      cod: json['cod'] as int?,
      codProprietario: json['codProprietario'] as int?,
      codEstoque: json['codEstoque'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
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

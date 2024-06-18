// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProprietarioLocalModelImpl _$$ProprietarioLocalModelImplFromJson(Map json) =>
    _$ProprietarioLocalModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codProprietario: (json['codProprietario'] as num?)?.toInt(),
      codLocal: (json['codLocal'] as num?)?.toInt(),
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

Map<String, dynamic> _$$ProprietarioLocalModelImplToJson(
        _$ProprietarioLocalModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codProprietario': instance.codProprietario,
      'codLocal': instance.codLocal,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'proprietario': instance.proprietario?.toJson(),
    };

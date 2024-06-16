// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escala_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EscalaSaveDTOImpl _$$EscalaSaveDTOImplFromJson(Map json) =>
    _$EscalaSaveDTOImpl(
      AnoMes: DateTime.parse(json['AnoMes'] as String),
      Tstamp: json['Tstamp'] as String?,
      Turnos: (json['Turnos'] as List<dynamic>?)
          ?.map((e) =>
              EscalaTurnoSaveDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EscalaSaveDTOImplToJson(_$EscalaSaveDTOImpl instance) =>
    <String, dynamic>{
      'AnoMes': instance.AnoMes.toIso8601String(),
      'Tstamp': instance.Tstamp,
      'Turnos': instance.Turnos?.map((e) => e.toJson()).toList(),
    };

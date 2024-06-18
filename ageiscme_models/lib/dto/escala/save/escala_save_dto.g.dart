// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escala_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EscalaSaveDTOImpl _$$EscalaSaveDTOImplFromJson(Map json) =>
    _$EscalaSaveDTOImpl(
      anoMes: DateTime.parse(json['anoMes'] as String),
      tstamp: json['tstamp'] as String?,
      turnos: (json['turnos'] as List<dynamic>?)
          ?.map((e) =>
              EscalaTurnoSaveDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EscalaSaveDTOImplToJson(_$EscalaSaveDTOImpl instance) =>
    <String, dynamic>{
      'anoMes': instance.anoMes.toIso8601String(),
      'tstamp': instance.tstamp,
      'turnos': instance.turnos?.map((e) => e.toJson()).toList(),
    };

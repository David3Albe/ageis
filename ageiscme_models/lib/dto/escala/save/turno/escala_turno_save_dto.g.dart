// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escala_turno_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EscalaTurnoSaveDTOImpl _$$EscalaTurnoSaveDTOImplFromJson(Map json) =>
    _$EscalaTurnoSaveDTOImpl(
      anoMes: DateTime.parse(json['anoMes'] as String),
      codTurno: (json['codTurno'] as num).toInt(),
      turno: json['turno'] == null
          ? null
          : TurnoShortResponseDTO.fromJson(
              Map<String, Object?>.from(json['turno'] as Map)),
      usuarios: (json['usuarios'] as List<dynamic>?)
          ?.map((e) => EscalaTurnoUsuarioSaveDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EscalaTurnoSaveDTOImplToJson(
        _$EscalaTurnoSaveDTOImpl instance) =>
    <String, dynamic>{
      'anoMes': instance.anoMes.toIso8601String(),
      'codTurno': instance.codTurno,
      'turno': instance.turno?.toJson(),
      'usuarios': instance.usuarios?.map((e) => e.toJson()).toList(),
    };

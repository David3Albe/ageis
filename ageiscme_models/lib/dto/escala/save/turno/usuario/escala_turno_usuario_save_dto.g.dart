// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escala_turno_usuario_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EscalaTurnoUsuarioSaveDTOImpl _$$EscalaTurnoUsuarioSaveDTOImplFromJson(
        Map json) =>
    _$EscalaTurnoUsuarioSaveDTOImpl(
      anoMes: DateTime.parse(json['anoMes'] as String),
      codTurno: (json['codTurno'] as num).toInt(),
      turno: json['turno'] == null
          ? null
          : TurnoShortResponseDTO.fromJson(
              Map<String, Object?>.from(json['turno'] as Map)),
      codUsuario: (json['codUsuario'] as num).toInt(),
      usuario: json['usuario'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      siglas: (json['siglas'] as List<dynamic>?)
          ?.map((e) => EscalaTurnoUsuarioSiglaSaveDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EscalaTurnoUsuarioSaveDTOImplToJson(
        _$EscalaTurnoUsuarioSaveDTOImpl instance) =>
    <String, dynamic>{
      'anoMes': instance.anoMes.toIso8601String(),
      'codTurno': instance.codTurno,
      'turno': instance.turno?.toJson(),
      'codUsuario': instance.codUsuario,
      'usuario': instance.usuario?.toJson(),
      'siglas': instance.siglas?.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escala_turno_usuario_sigla_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EscalaTurnoUsuarioSiglaSaveDTOImpl
    _$$EscalaTurnoUsuarioSiglaSaveDTOImplFromJson(Map json) =>
        _$EscalaTurnoUsuarioSiglaSaveDTOImpl(
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
          data: DateTime.parse(json['data'] as String),
          codSigla: (json['codSigla'] as num).toInt(),
          sigla: json['sigla'] == null
              ? null
              : SiglaShortResponseDTO.fromJson(
                  Map<String, Object?>.from(json['sigla'] as Map)),
        );

Map<String, dynamic> _$$EscalaTurnoUsuarioSiglaSaveDTOImplToJson(
        _$EscalaTurnoUsuarioSiglaSaveDTOImpl instance) =>
    <String, dynamic>{
      'anoMes': instance.anoMes.toIso8601String(),
      'codTurno': instance.codTurno,
      'turno': instance.turno?.toJson(),
      'codUsuario': instance.codUsuario,
      'usuario': instance.usuario?.toJson(),
      'data': instance.data.toIso8601String(),
      'codSigla': instance.codSigla,
      'sigla': instance.sigla?.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_perfil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioPerfilModelImpl _$$UsuarioPerfilModelImplFromJson(Map json) =>
    _$UsuarioPerfilModelImpl(
      cod: json['cod'] as int?,
      codUsuario: json['codUsuario'] as int?,
      codPerfil: json['codPerfil'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      direitos: (json['direitos'] as List<dynamic>?)
          ?.map((e) =>
              PerfilDireitoModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$UsuarioPerfilModelImplToJson(
        _$UsuarioPerfilModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codUsuario': instance.codUsuario,
      'codPerfil': instance.codPerfil,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'usuario': instance.usuario?.toJson(),
      'direitos': instance.direitos?.map((e) => e.toJson()).toList(),
    };

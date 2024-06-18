// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_direito_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerfilDireitoModelImpl _$$PerfilDireitoModelImplFromJson(Map json) =>
    _$PerfilDireitoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codDireito: (json['codDireito'] as num?)?.toInt(),
      codPerfil: (json['codPerfil'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      perfilAcesso: json['perfilAcesso'] == null
          ? null
          : PerfilAcessoModel.fromJson(
              Map<String, Object?>.from(json['perfilAcesso'] as Map)),
      usuarioPerfil: json['usuarioPerfil'] == null
          ? null
          : UsuarioPerfilModel.fromJson(
              Map<String, Object?>.from(json['usuarioPerfil'] as Map)),
    );

Map<String, dynamic> _$$PerfilDireitoModelImplToJson(
        _$PerfilDireitoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codDireito': instance.codDireito,
      'codPerfil': instance.codPerfil,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'perfilAcesso': instance.perfilAcesso?.toJson(),
      'usuarioPerfil': instance.usuarioPerfil?.toJson(),
    };

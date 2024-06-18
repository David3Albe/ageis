// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioModelImpl _$$UsuarioModelImplFromJson(Map json) => _$UsuarioModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      login: json['login'] as String?,
      nome: json['nome'] as String?,
      rg: (json['rg'] as num?)?.toInt(),
      docClasse: json['docClasse'] as String?,
      codBarra: (json['codBarra'] as num?)?.toInt(),
      codBarraTemporario: (json['codBarraTemporario'] as num?)?.toInt(),
      senha: json['senha'] as String?,
      colaborador: json['colaborador'] as bool?,
      nomeEmpresa: json['nomeEmpresa'] as String?,
      controleGestao: json['controleGestao'] as bool?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      foto: json['foto'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      usuariosPerfis: (json['usuariosPerfis'] as List<dynamic>?)
          ?.map((e) =>
              UsuarioPerfilModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$UsuarioModelImplToJson(_$UsuarioModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'login': instance.login,
      'nome': instance.nome,
      'rg': instance.rg,
      'docClasse': instance.docClasse,
      'codBarra': instance.codBarra,
      'codBarraTemporario': instance.codBarraTemporario,
      'senha': instance.senha,
      'colaborador': instance.colaborador,
      'nomeEmpresa': instance.nomeEmpresa,
      'controleGestao': instance.controleGestao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'foto': instance.foto,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'usuariosPerfis':
          instance.usuariosPerfis?.map((e) => e.toJson()).toList(),
    };

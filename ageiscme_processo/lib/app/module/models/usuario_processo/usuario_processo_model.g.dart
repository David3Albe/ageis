// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioProcessoModelImpl _$$UsuarioProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UsuarioProcessoModelImpl(
      cod: json['cod'] as int?,
      login: json['login'] as String?,
      nome: json['nome'] as String?,
      rg: json['rg'] as int?,
      docClasse: json['docClasse'] as String?,
      codBarra: json['codBarra'] as int?,
      codBarraTemporario: json['codBarraTemporario'] as int?,
      senha: json['senha'] as String?,
      colaborador: json['colaborador'] as bool?,
      nomeEmpresa: json['nomeEmpresa'] as String?,
      controleGestao: json['controleGestao'] as bool?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      foto: json['foto'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      usuariosPerfis: (json['usuariosPerfis'] as List<dynamic>?)
          ?.map((e) => UsuarioPerfilModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      codigoDireitos: (json['codigoDireitos'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$UsuarioProcessoModelImplToJson(
        _$UsuarioProcessoModelImpl instance) =>
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
      'usuariosPerfis': instance.usuariosPerfis,
      'codigoDireitos': instance.codigoDireitos,
    };

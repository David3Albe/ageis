// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioProcessoModelImpl _$$UsuarioProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UsuarioProcessoModelImpl(
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
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
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
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

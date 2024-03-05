// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_acesso_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerfilAcessoModelImpl _$$PerfilAcessoModelImplFromJson(Map json) =>
    _$PerfilAcessoModelImpl(
      cod: json['cod'] as int?,
      descricao: json['descricao'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      perfilRestrito: json['perfilRestrito'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      perfilDireitos: (json['perfilDireitos'] as List<dynamic>?)
          ?.map((e) =>
              PerfilDireitoModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$PerfilAcessoModelImplToJson(
        _$PerfilAcessoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'perfilRestrito': instance.perfilRestrito,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'perfilDireitos':
          instance.perfilDireitos?.map((e) => e.toJson()).toList(),
    };

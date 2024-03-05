// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrupoMaterialModelImpl _$$GrupoMaterialModelImplFromJson(Map json) =>
    _$GrupoMaterialModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$GrupoMaterialModelImplToJson(
        _$GrupoMaterialModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

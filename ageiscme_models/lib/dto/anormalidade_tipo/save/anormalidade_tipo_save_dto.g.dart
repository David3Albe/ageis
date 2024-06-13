// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_tipo_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeTipoSaveDTOImpl _$$AnormalidadeTipoSaveDTOImplFromJson(
        Map json) =>
    _$AnormalidadeTipoSaveDTOImpl(
      cod: json['cod'] as int,
      nome: json['nome'] as String,
      ativo: json['ativo'] as bool,
      bloqueioEtapa: json['bloqueioEtapa'] as bool,
      bloqueioItens: json['bloqueioItens'] as bool,
      bloqueioTotal: json['bloqueioTotal'] as bool,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
    );

Map<String, dynamic> _$$AnormalidadeTipoSaveDTOImplToJson(
        _$AnormalidadeTipoSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'ativo': instance.ativo,
      'bloqueioEtapa': instance.bloqueioEtapa,
      'bloqueioItens': instance.bloqueioItens,
      'bloqueioTotal': instance.bloqueioTotal,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'codInstituicao': instance.codInstituicao,
    };

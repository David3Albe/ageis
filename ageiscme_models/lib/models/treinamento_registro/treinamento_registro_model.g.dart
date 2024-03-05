// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treinamento_registro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinamentoRegistroModelImpl _$$TreinamentoRegistroModelImplFromJson(
        Map json) =>
    _$TreinamentoRegistroModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      observacao: json['observacao'] as String?,
      data:
          json['data'] == null ? null : DateTime.parse(json['data'] as String),
      entidade: json['entidade'] as String?,
      cargaHoraria: (json['cargaHoraria'] as num?)?.toDouble(),
      codInstituicao: json['codInstituicao'] as int?,
      doc: json['doc'] as String?,
      docNome: json['docNome'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      usuariosTreinamentos: (json['usuariosTreinamentos'] as List<dynamic>?)
          ?.map((e) => TreinamentoUsuarioModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$TreinamentoRegistroModelImplToJson(
        _$TreinamentoRegistroModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'data': instance.data?.toIso8601String(),
      'entidade': instance.entidade,
      'cargaHoraria': instance.cargaHoraria,
      'codInstituicao': instance.codInstituicao,
      'doc': instance.doc,
      'docNome': instance.docNome,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'usuariosTreinamentos':
          instance.usuariosTreinamentos?.map((e) => e.toJson()).toList(),
    };

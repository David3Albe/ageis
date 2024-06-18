// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_descritor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiDescritorModelImpl _$$EpiDescritorModelImplFromJson(Map json) =>
    _$EpiDescritorModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      numeroCA: json['numeroCA'] as String?,
      tipoEpi: (json['tipoEpi'] as num?)?.toInt(),
      prazoValidade: json['prazoValidade'] == null
          ? null
          : DateTime.parse(json['prazoValidade'] as String),
      conferenciaVisual: json['conferenciaVisual'] as bool?,
      ativo: json['ativo'] as bool?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      imagem: json['imagem'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      codFornecedor: (json['codFornecedor'] as num?)?.toInt(),
      fornecedor: json['fornecedor'] == null
          ? null
          : FornecedorModel.fromJson(
              Map<String, Object?>.from(json['fornecedor'] as Map)),
    );

Map<String, dynamic> _$$EpiDescritorModelImplToJson(
        _$EpiDescritorModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'numeroCA': instance.numeroCA,
      'tipoEpi': instance.tipoEpi,
      'prazoValidade': instance.prazoValidade?.toIso8601String(),
      'conferenciaVisual': instance.conferenciaVisual,
      'ativo': instance.ativo,
      'codInstituicao': instance.codInstituicao,
      'imagem': instance.imagem,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'codFornecedor': instance.codFornecedor,
      'fornecedor': instance.fornecedor?.toJson(),
    };

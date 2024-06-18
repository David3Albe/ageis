// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_tipo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoTipoModelImpl _$$ProcessoTipoModelImplFromJson(Map json) =>
    _$ProcessoTipoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codEtapaProcessoInicial:
          (json['codEtapaProcessoInicial'] as num?)?.toInt(),
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      prazoValidade: (json['prazoValidade'] as num?)?.toInt(),
      tipoValidade: json['tipoValidade'] as String,
      nivelPrioridade: json['nivelPrioridade'] as String,
      limiteVigencia: json['limiteVigencia'] == null
          ? null
          : DateTime.parse(json['limiteVigencia'] as String),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      etapaInicial: json['etapaInicial'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['etapaInicial'] as Map)),
      etapas: (json['etapas'] as List<dynamic>?)
          ?.map((e) =>
              ProcessoEtapaModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoTipoModelImplToJson(
        _$ProcessoTipoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEtapaProcessoInicial': instance.codEtapaProcessoInicial,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'prazoValidade': instance.prazoValidade,
      'tipoValidade': instance.tipoValidade,
      'nivelPrioridade': instance.nivelPrioridade,
      'limiteVigencia': instance.limiteVigencia?.toIso8601String(),
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'etapaInicial': instance.etapaInicial?.toJson(),
      'etapas': instance.etapas?.map((e) => e.toJson()).toList(),
      'tStamp': instance.tstamp,
    };

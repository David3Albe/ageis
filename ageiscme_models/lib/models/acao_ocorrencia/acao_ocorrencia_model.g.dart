// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acao_ocorrencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcaoOcorrenciaModelImpl _$$AcaoOcorrenciaModelImplFromJson(Map json) =>
    _$AcaoOcorrenciaModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      descricao: json['descricao'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      acaoCorretiva: json['acaoCorretiva'] as bool?,
      motivoNaoCorrecao: json['motivoNaoCorrecao'] as bool?,
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$AcaoOcorrenciaModelImplToJson(
        _$AcaoOcorrenciaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'codInstituicao': instance.codInstituicao,
      'acaoCorretiva': instance.acaoCorretiva,
      'motivoNaoCorrecao': instance.motivoNaoCorrecao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

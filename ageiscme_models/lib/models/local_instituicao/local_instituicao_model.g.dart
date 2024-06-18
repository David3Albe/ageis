// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_instituicao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalInstituicaoModelImpl _$$LocalInstituicaoModelImplFromJson(Map json) =>
    _$LocalInstituicaoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String,
      localizacao: json['localizacao'] as String?,
      responsavel: json['responsavel'] as String?,
      contato: json['contato'] as String?,
      codBarra: json['codBarra'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      codCentroCusto: (json['codCentroCusto'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      exigeProntuario: json['exigeProntuario'] as bool?,
      localConferencia: json['localConferencia'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      centroCusto: json['centroCusto'] == null
          ? null
          : CentroCustoModel.fromJson(
              Map<String, Object?>.from(json['centroCusto'] as Map)),
    );

Map<String, dynamic> _$$LocalInstituicaoModelImplToJson(
        _$LocalInstituicaoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'localizacao': instance.localizacao,
      'responsavel': instance.responsavel,
      'contato': instance.contato,
      'codBarra': instance.codBarra,
      'codInstituicao': instance.codInstituicao,
      'codCentroCusto': instance.codCentroCusto,
      'ativo': instance.ativo,
      'exigeProntuario': instance.exigeProntuario,
      'localConferencia': instance.localConferencia,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'centroCusto': instance.centroCusto?.toJson(),
    };

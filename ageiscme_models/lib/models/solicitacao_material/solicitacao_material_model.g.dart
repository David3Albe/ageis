// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialModelImpl _$$SolicitacaoMaterialModelImplFromJson(
        Map json) =>
    _$SolicitacaoMaterialModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codUsuarioSolicitante: (json['codUsuarioSolicitante'] as num?)?.toInt(),
      codUsuarioAutorizacao: (json['codUsuarioAutorizacao'] as num?)?.toInt(),
      codUsuarioEntrega: (json['codUsuarioEntrega'] as num?)?.toInt(),
      codUsuarioRecebimento: (json['codUsuarioRecebimento'] as num?)?.toInt(),
      dataHoraSolicitacao: json['dataHoraSolicitacao'] == null
          ? null
          : DateTime.parse(json['dataHoraSolicitacao'] as String),
      dataHoraAutorizacao: json['dataHoraAutorizacao'] == null
          ? null
          : DateTime.parse(json['dataHoraAutorizacao'] as String),
      dataHoraEntrega: json['dataHoraEntrega'] == null
          ? null
          : DateTime.parse(json['dataHoraEntrega'] as String),
      situacao: (json['situacao'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      solicitacoesMateriais: (json['solicitacoesMateriais'] as List<dynamic>?)
          ?.map((e) => SolicitacaoMaterialItemModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$SolicitacaoMaterialModelImplToJson(
        _$SolicitacaoMaterialModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codUsuarioSolicitante': instance.codUsuarioSolicitante,
      'codUsuarioAutorizacao': instance.codUsuarioAutorizacao,
      'codUsuarioEntrega': instance.codUsuarioEntrega,
      'codUsuarioRecebimento': instance.codUsuarioRecebimento,
      'dataHoraSolicitacao': instance.dataHoraSolicitacao?.toIso8601String(),
      'dataHoraAutorizacao': instance.dataHoraAutorizacao?.toIso8601String(),
      'dataHoraEntrega': instance.dataHoraEntrega?.toIso8601String(),
      'situacao': instance.situacao,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'solicitacoesMateriais':
          instance.solicitacoesMateriais?.map((e) => e.toJson()).toList(),
    };

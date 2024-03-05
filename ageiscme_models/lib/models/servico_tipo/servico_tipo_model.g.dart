// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_tipo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServicoTipoModelImpl _$$ServicoTipoModelImplFromJson(Map json) =>
    _$ServicoTipoModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      codInstituicao: json['codInstituicao'] as int?,
      ativo: json['ativo'] as bool?,
      monitoramento: json['monitoramento'] as bool?,
      servicosEquipamentos: json['servicosEquipamentos'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ServicoTipoModelImplToJson(
        _$ServicoTipoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'monitoramento': instance.monitoramento,
      'servicosEquipamentos': instance.servicosEquipamentos,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

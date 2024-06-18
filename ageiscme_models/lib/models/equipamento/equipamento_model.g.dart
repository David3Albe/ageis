// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoModelImpl _$$EquipamentoModelImplFromJson(Map json) =>
    _$EquipamentoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      fabricante: json['fabricante'] as String?,
      serie: json['serie'] as String?,
      registroAnvisa: json['registroAnvisa'] as String?,
      codBarra: json['codBarra'] as String?,
      status: json['status'] as String?,
      validadeInspecao: json['validadeInspecao'] == null
          ? null
          : DateTime.parse(json['validadeInspecao'] as String),
      anoFabricacao: (json['anoFabricacao'] as num?)?.toInt(),
      capacidadeLitro: (json['capacidadeLitro'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ativo: json['ativo'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      equipamentosServicos: (json['equipamentosServicos'] as List<dynamic>?)
          ?.map((e) => EquipamentoServicoModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      etapas: (json['etapas'] as List<dynamic>?)
          ?.map((e) =>
              ProcessoEtapaModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EquipamentoModelImplToJson(
        _$EquipamentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'fabricante': instance.fabricante,
      'serie': instance.serie,
      'registroAnvisa': instance.registroAnvisa,
      'codBarra': instance.codBarra,
      'status': instance.status,
      'validadeInspecao': instance.validadeInspecao?.toIso8601String(),
      'anoFabricacao': instance.anoFabricacao,
      'capacidadeLitro': instance.capacidadeLitro,
      'codInstituicao': instance.codInstituicao,
      'ativo': instance.ativo,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'equipamentosServicos':
          instance.equipamentosServicos?.map((e) => e.toJson()).toList(),
      'etapas': instance.etapas?.map((e) => e.toJson()).toList(),
    };

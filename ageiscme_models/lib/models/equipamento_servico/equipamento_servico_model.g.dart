// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoServicoModelImpl _$$EquipamentoServicoModelImplFromJson(
        Map json) =>
    _$EquipamentoServicoModelImpl(
      cod: json['cod'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      codEquipamento: json['codEquipamento'] as int?,
      codServico: json['codServico'] as int?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EquipamentoServicoModelImplToJson(
        _$EquipamentoServicoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInstituicao': instance.codInstituicao,
      'codEquipamento': instance.codEquipamento,
      'codServico': instance.codServico,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

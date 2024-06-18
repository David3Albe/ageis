// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_insumo_consumo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoInsumoConsumoResponseDTOImpl
    _$$EquipamentoInsumoConsumoResponseDTOImplFromJson(Map json) =>
        _$EquipamentoInsumoConsumoResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
          codInsumo: (json['codInsumo'] as num?)?.toInt(),
          consumoPorProcesso: (json['consumoPorProcesso'] as num?)?.toDouble(),
          codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
          ultimaAlteracao: json['ultimaAlteracao'] == null
              ? null
              : DateTime.parse(json['ultimaAlteracao'] as String),
          tstamp: json['tstamp'] as String?,
        );

Map<String, dynamic> _$$EquipamentoInsumoConsumoResponseDTOImplToJson(
        _$EquipamentoInsumoConsumoResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEquipamento': instance.codEquipamento,
      'codInsumo': instance.codInsumo,
      'consumoPorProcesso': instance.consumoPorProcesso,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
    };

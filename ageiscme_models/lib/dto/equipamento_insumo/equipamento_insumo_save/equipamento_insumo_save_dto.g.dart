// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_insumo_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoInsumoSaveDTOImpl _$$EquipamentoInsumoSaveDTOImplFromJson(
        Map json) =>
    _$EquipamentoInsumoSaveDTOImpl(
      cod: json['cod'] as int,
      codEquipamento: json['codEquipamento'] as int?,
      codInsumo: json['codInsumo'] as int?,
      consumoPorProcesso: (json['consumoPorProcesso'] as num?)?.toDouble(),
      tstamp: json['tstamp'] as String?,
    );

Map<String, dynamic> _$$EquipamentoInsumoSaveDTOImplToJson(
        _$EquipamentoInsumoSaveDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEquipamento': instance.codEquipamento,
      'codInsumo': instance.codInsumo,
      'consumoPorProcesso': instance.consumoPorProcesso,
      'tstamp': instance.tstamp,
    };
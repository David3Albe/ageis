// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_manutencao_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoManutencaoFilterImpl _$$EquipamentoManutencaoFilterImplFromJson(
        Map json) =>
    _$EquipamentoManutencaoFilterImpl(
      cod: json['cod'] as int?,
      numeroRegistros: json['numeroRegistros'] as int?,
      codEquipamento: json['codEquipamento'] as int?,
      codTipoServico: json['codTipoServico'] as int?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EquipamentoManutencaoFilterImplToJson(
        _$EquipamentoManutencaoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'numeroRegistros': instance.numeroRegistros,
      'codEquipamento': instance.codEquipamento,
      'codTipoServico': instance.codTipoServico,
      'tStamp': instance.tStamp,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoFilterImpl _$$EquipamentoFilterImplFromJson(Map json) =>
    _$EquipamentoFilterImpl(
      cod: json['cod'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      incluirTipoServicos: json['incluirTipoServicos'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EquipamentoFilterImplToJson(
        _$EquipamentoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'incluirTipoServicos': instance.incluirTipoServicos,
      'tStamp': instance.tStamp,
    };

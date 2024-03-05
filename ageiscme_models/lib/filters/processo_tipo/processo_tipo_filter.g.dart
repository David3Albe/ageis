// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_tipo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoTipoFilterImpl _$$ProcessoTipoFilterImplFromJson(Map json) =>
    _$ProcessoTipoFilterImpl(
      cod: json['cod'] as int?,
      carregarEtapaProcesso: json['carregarEtapaProcesso'] as bool?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      carregarEtapas: json['carregarEtapas'] as bool?,
      carregarEquipamentosEtapas: json['carregarEquipamentosEtapas'] as bool?,
      carregarSequenciasEtapas: json['carregarSequenciasEtapas'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoTipoFilterImplToJson(
        _$ProcessoTipoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'carregarEtapaProcesso': instance.carregarEtapaProcesso,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'carregarEtapas': instance.carregarEtapas,
      'carregarEquipamentosEtapas': instance.carregarEquipamentosEtapas,
      'carregarSequenciasEtapas': instance.carregarSequenciasEtapas,
      'tStamp': instance.tStamp,
    };

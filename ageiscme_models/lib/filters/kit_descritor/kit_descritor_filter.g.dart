// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_descritor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitDescritorFilterImpl _$$KitDescritorFilterImplFromJson(Map json) =>
    _$KitDescritorFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordernarPorNomeCrescente: json['ordernarPorNomeCrescente'] as bool?,
      carregarProcessoTipo: json['carregarProcessoTipo'] as bool?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      ordenarAtivosPrimeiro: json['ordenarAtivosPrimeiro'] as bool?,
      nomeContem: json['nomeContem'] as String?,
      termoPesquisa: json['termoPesquisa'] as String?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$KitDescritorFilterImplToJson(
        _$KitDescritorFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordernarPorNomeCrescente': instance.ordernarPorNomeCrescente,
      'carregarProcessoTipo': instance.carregarProcessoTipo,
      'numeroRegistros': instance.numeroRegistros,
      'ordenarAtivosPrimeiro': instance.ordenarAtivosPrimeiro,
      'nomeContem': instance.nomeContem,
      'termoPesquisa': instance.termoPesquisa,
      'tStamp': instance.tStamp,
    };

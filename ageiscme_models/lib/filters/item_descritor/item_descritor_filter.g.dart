// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorFilterImpl _$$ItemDescritorFilterImplFromJson(Map json) =>
    _$ItemDescritorFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      carregarItensConsignados: json['carregarItensConsignados'] as bool?,
      apenasConsignados: json['apenasConsignados'] as bool?,
      apenasNaoConsignados: json['apenasNaoConsignados'] as bool?,
      carregarImagem: json['carregarImagem'] as bool?,
      numeroMaximoRegistros: (json['numeroMaximoRegistros'] as num?)?.toInt(),
      termoPesquisa: json['termoPesquisa'] as String?,
      nomeContem: json['nomeContem'] as String?,
      ordenarAtivosPrimeiro: json['ordenarAtivosPrimeiro'] as bool?,
      ordenarCodigoDesc: json['ordenarCodigoDesc'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ItemDescritorFilterImplToJson(
        _$ItemDescritorFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'carregarItensConsignados': instance.carregarItensConsignados,
      'apenasConsignados': instance.apenasConsignados,
      'apenasNaoConsignados': instance.apenasNaoConsignados,
      'carregarImagem': instance.carregarImagem,
      'numeroMaximoRegistros': instance.numeroMaximoRegistros,
      'termoPesquisa': instance.termoPesquisa,
      'nomeContem': instance.nomeContem,
      'ordenarAtivosPrimeiro': instance.ordenarAtivosPrimeiro,
      'ordenarCodigoDesc': instance.ordenarCodigoDesc,
      'tStamp': instance.tStamp,
    };

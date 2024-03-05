// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorFilterImpl _$$ItemDescritorFilterImplFromJson(Map json) =>
    _$ItemDescritorFilterImpl(
      cod: json['cod'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      carregarItensConsignados: json['carregarItensConsignados'] as bool?,
      apenasConsignados: json['apenasConsignados'] as bool?,
      apenasNaoConsignados: json['apenasNaoConsignados'] as bool?,
      carregarImagem: json['carregarImagem'] as bool?,
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
      'tStamp': instance.tStamp,
    };

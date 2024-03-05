// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_descritor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitDescritorFilterImpl _$$KitDescritorFilterImplFromJson(Map json) =>
    _$KitDescritorFilterImpl(
      cod: json['cod'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordernarPorNomeCrescente: json['ordernarPorNomeCrescente'] as bool?,
      carregarProcessoTipo: json['carregarProcessoTipo'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$KitDescritorFilterImplToJson(
        _$KitDescritorFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordernarPorNomeCrescente': instance.ordernarPorNomeCrescente,
      'carregarProcessoTipo': instance.carregarProcessoTipo,
      'tStamp': instance.tStamp,
    };

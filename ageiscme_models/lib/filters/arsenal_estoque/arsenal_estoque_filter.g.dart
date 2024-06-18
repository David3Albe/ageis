// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal_estoque_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArsenalEstoqueFilterImpl _$$ArsenalEstoqueFilterImplFromJson(Map json) =>
    _$ArsenalEstoqueFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ArsenalEstoqueFilterImplToJson(
        _$ArsenalEstoqueFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'tStamp': instance.tStamp,
    };

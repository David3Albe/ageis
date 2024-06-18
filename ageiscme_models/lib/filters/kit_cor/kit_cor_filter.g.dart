// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_cor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitCorFilterImpl _$$KitCorFilterImplFromJson(Map json) => _$KitCorFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordernarPorNomeCrescente: json['ordernarPorNomeCrescente'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$KitCorFilterImplToJson(_$KitCorFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'apenasAtivos': instance.apenasAtivos,
      'ordernarPorNomeCrescente': instance.ordernarPorNomeCrescente,
      'tStamp': instance.tStamp,
    };

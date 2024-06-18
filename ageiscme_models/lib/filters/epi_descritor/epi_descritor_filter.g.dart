// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_descritor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiDescritorFilterImpl _$$EpiDescritorFilterImplFromJson(Map json) =>
    _$EpiDescritorFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      carregarTipo: json['carregarTipo'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EpiDescritorFilterImplToJson(
        _$EpiDescritorFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'carregarTipo': instance.carregarTipo,
      'tStamp': instance.tStamp,
    };

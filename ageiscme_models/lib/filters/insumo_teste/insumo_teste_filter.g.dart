// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_teste_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoTesteFilterImpl _$$InsumoTesteFilterImplFromJson(Map json) =>
    _$InsumoTesteFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      codMovimentoInsumo: (json['codMovimentoInsumo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InsumoTesteFilterImplToJson(
        _$InsumoTesteFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInsumo': instance.codInsumo,
      'codMovimentoInsumo': instance.codMovimentoInsumo,
    };

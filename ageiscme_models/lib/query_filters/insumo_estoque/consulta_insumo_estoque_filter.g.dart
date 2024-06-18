// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_insumo_estoque_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaInsumoEstoqueFilterImpl _$$ConsultaInsumoEstoqueFilterImplFromJson(
        Map json) =>
    _$ConsultaInsumoEstoqueFilterImpl(
      codDeposito: (json['codDeposito'] as num?)?.toInt(),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      estoqueAbaixoMinimo: json['estoqueAbaixoMinimo'] as bool?,
    );

Map<String, dynamic> _$$ConsultaInsumoEstoqueFilterImplToJson(
        _$ConsultaInsumoEstoqueFilterImpl instance) =>
    <String, dynamic>{
      'codDeposito': instance.codDeposito,
      'codInsumo': instance.codInsumo,
      'estoqueAbaixoMinimo': instance.estoqueAbaixoMinimo,
    };

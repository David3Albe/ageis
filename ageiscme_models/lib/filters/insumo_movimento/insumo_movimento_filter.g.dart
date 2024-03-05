// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_movimento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoMovimentoFilterImpl _$$InsumoMovimentoFilterImplFromJson(Map json) =>
    _$InsumoMovimentoFilterImpl(
      cod: json['cod'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codInsumo: json['codInsumo'] as int?,
      codTipoMovimento: json['codTipoMovimento'] as String?,
    );

Map<String, dynamic> _$$InsumoMovimentoFilterImplToJson(
        _$InsumoMovimentoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codInsumo': instance.codInsumo,
      'codTipoMovimento': instance.codTipoMovimento,
    };

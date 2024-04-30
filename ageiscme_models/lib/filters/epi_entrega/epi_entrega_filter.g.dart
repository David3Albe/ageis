// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_entrega_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiEntregaFilterImpl _$$EpiEntregaFilterImplFromJson(Map json) =>
    _$EpiEntregaFilterImpl(
      cod: json['cod'] as int?,
      carregarUsuario: json['carregarUsuario'] as bool?,
      numeroRegistros: json['numeroRegistros'] as int?,
      nomeContem: json['nomeContem'] as String?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$EpiEntregaFilterImplToJson(
        _$EpiEntregaFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'carregarUsuario': instance.carregarUsuario,
      'numeroRegistros': instance.numeroRegistros,
      'nomeContem': instance.nomeContem,
      'tStamp': instance.tStamp,
    };

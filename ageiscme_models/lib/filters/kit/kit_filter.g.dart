// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitFilterImpl _$$KitFilterImplFromJson(Map json) => _$KitFilterImpl(
      cod: json['cod'] as int?,
      codBarra: json['codBarra'] as String?,
      carregarDescritor: json['carregarDescritor'] as bool?,
      carregarKit: json['carregarKit'] as bool?,
      carregarCores: json['carregarCores'] as bool?,
      carregarItens: json['carregarItens'] as bool?,
      numeroRegistros: json['numeroRegistros'] as int?,
      codBarraContem: json['codBarraContem'] as int?,
      ordenarCod: json['ordenarCod'] as bool?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$KitFilterImplToJson(_$KitFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'carregarDescritor': instance.carregarDescritor,
      'carregarKit': instance.carregarKit,
      'carregarCores': instance.carregarCores,
      'carregarItens': instance.carregarItens,
      'numeroRegistros': instance.numeroRegistros,
      'codBarraContem': instance.codBarraContem,
      'ordenarCod': instance.ordenarCod,
      'tStamp': instance.tStamp,
    };

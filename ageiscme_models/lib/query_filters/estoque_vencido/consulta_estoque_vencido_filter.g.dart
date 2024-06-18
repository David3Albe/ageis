// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_vencido_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueVencidoFilterImpl _$$ConsultaEstoqueVencidoFilterImplFromJson(
        Map json) =>
    _$ConsultaEstoqueVencidoFilterImpl(
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      codLocalEstoque: (json['codLocalEstoque'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      codBarraKitContem: json['codBarraKitContem'] as String?,
      codItem: (json['codItem'] as num?)?.toInt(),
      idEtiquetaContem: json['idEtiquetaContem'] as String?,
      rotulado: json['rotulado'] as bool?,
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
    );

Map<String, dynamic> _$$ConsultaEstoqueVencidoFilterImplToJson(
        _$ConsultaEstoqueVencidoFilterImpl instance) =>
    <String, dynamic>{
      'codEstoque': instance.codEstoque,
      'codLocalEstoque': instance.codLocalEstoque,
      'codKit': instance.codKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'rotulado': instance.rotulado,
      'item': instance.item?.toJson(),
    };

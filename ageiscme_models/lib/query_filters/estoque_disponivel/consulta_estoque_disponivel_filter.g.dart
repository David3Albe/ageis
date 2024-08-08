// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_disponivel_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueDisponivelFilterImpl
    _$$ConsultaEstoqueDisponivelFilterImplFromJson(Map json) =>
        _$ConsultaEstoqueDisponivelFilterImpl(
          codEstoque: (json['codEstoque'] as num?)?.toInt(),
          codEstoqueLocal: (json['codEstoqueLocal'] as num?)?.toInt(),
          codKit: (json['codKit'] as num?)?.toInt(),
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codProprietario: (json['codProprietario'] as num?)?.toInt(),
          tipoEstoque: json['tipoEstoque'] as String?,
          ignorarRemovidos: json['ignorarRemovidos'] as bool?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaEstoqueDisponivelFilterImplToJson(
        _$ConsultaEstoqueDisponivelFilterImpl instance) =>
    <String, dynamic>{
      'codEstoque': instance.codEstoque,
      'codEstoqueLocal': instance.codEstoqueLocal,
      'codKit': instance.codKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codProprietario': instance.codProprietario,
      'tipoEstoque': instance.tipoEstoque,
      'ignorarRemovidos': instance.ignorarRemovidos,
      'item': instance.item?.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_disponivel_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueDisponivelFilterImpl
    _$$ConsultaEstoqueDisponivelFilterImplFromJson(Map json) =>
        _$ConsultaEstoqueDisponivelFilterImpl(
          codEstoque: json['codEstoque'] as int?,
          codEstoqueLocal: json['codEstoqueLocal'] as int?,
          codKit: json['codKit'] as int?,
          codItem: json['codItem'] as int?,
          codProprietario: json['codProprietario'] as int?,
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
      'codItem': instance.codItem,
      'codProprietario': instance.codProprietario,
      'ignorarRemovidos': instance.ignorarRemovidos,
      'item': instance.item?.toJson(),
    };

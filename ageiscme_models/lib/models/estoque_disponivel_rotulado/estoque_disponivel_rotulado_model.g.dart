// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estoque_disponivel_rotulado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstoqueDisponivelRotuladoModelImpl
    _$$EstoqueDisponivelRotuladoModelImplFromJson(Map json) =>
        _$EstoqueDisponivelRotuladoModelImpl(
          cod: (json['cod'] as num?)?.toInt(),
          codEstoque: (json['codEstoque'] as num?)?.toInt(),
          codItem: (json['codItem'] as num?)?.toInt(),
          quantidade: (json['quantidade'] as num).toInt(),
          codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
          ultimaAlteracao: json['ultimaAlteracao'] == null
              ? null
              : DateTime.parse(json['ultimaAlteracao'] as String),
          tstamp: json['tStamp'] as String?,
          arsenalEstoque: json['arsenalEstoque'] == null
              ? null
              : ArsenalEstoqueModel.fromJson(
                  Map<String, Object?>.from(json['arsenalEstoque'] as Map)),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$EstoqueDisponivelRotuladoModelImplToJson(
        _$EstoqueDisponivelRotuladoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEstoque': instance.codEstoque,
      'codItem': instance.codItem,
      'quantidade': instance.quantidade,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'arsenalEstoque': instance.arsenalEstoque?.toJson(),
      'item': instance.item?.toJson(),
    };

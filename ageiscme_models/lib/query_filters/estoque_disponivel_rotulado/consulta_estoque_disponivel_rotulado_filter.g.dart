// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_disponivel_rotulado_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueDisponivelRotuladoFilterImpl
    _$$ConsultaEstoqueDisponivelRotuladoFilterImplFromJson(Map json) =>
        _$ConsultaEstoqueDisponivelRotuladoFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codEstoque: json['codEstoque'] as int?,
          codItem: json['codItem'] as int?,
          idEtiqueta: json['idEtiqueta'] as String?,
          codProprietario: json['codProprietario'] as int?,
          entrada: json['entrada'] as bool?,
          saida: json['saida'] as bool?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaEstoqueDisponivelRotuladoFilterImplToJson(
        _$ConsultaEstoqueDisponivelRotuladoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codEstoque': instance.codEstoque,
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'codProprietario': instance.codProprietario,
      'entrada': instance.entrada,
      'saida': instance.saida,
      'item': instance.item?.toJson(),
    };

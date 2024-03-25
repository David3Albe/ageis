// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'estoque_item_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstoqueItemPrintDTOImpl _$$EstoqueItemPrintDTOImplFromJson(Map json) =>
    _$EstoqueItemPrintDTOImpl(
      codBarra: json['codBarra'] as String,
      nome: json['nome'] as String,
      consignados: (json['consignados'] as List<dynamic>)
          .map((e) => EstoqueItemConsignadoPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EstoqueItemPrintDTOImplToJson(
        _$EstoqueItemPrintDTOImpl instance) =>
    <String, dynamic>{
      'codBarra': instance.codBarra,
      'nome': instance.nome,
      'consignados': instance.consignados.map((e) => e.toJson()).toList(),
    };

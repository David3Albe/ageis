// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'estoque_kit_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstoqueKitPrintDTOImpl _$$EstoqueKitPrintDTOImplFromJson(Map json) =>
    _$EstoqueKitPrintDTOImpl(
      codBarra: json['codBarra'] as String,
      nome: json['nome'] as String,
      itens: (json['itens'] as List<dynamic>)
          .map((e) => EstoqueKitItemPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EstoqueKitPrintDTOImplToJson(
        _$EstoqueKitPrintDTOImpl instance) =>
    <String, dynamic>{
      'codBarra': instance.codBarra,
      'nome': instance.nome,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };

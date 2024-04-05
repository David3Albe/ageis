// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'item_tag_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemTagPrintDTOImpl _$$ItemTagPrintDTOImplFromJson(Map json) =>
    _$ItemTagPrintDTOImpl(
      descricaoItem: json['descricaoItem'] as String,
      descricaoProprietario: json['descricaoProprietario'] as String,
      idEtiqueta: json['idEtiqueta'] as String,
      restricao: json['restricao'] as String?,
    );

Map<String, dynamic> _$$ItemTagPrintDTOImplToJson(
        _$ItemTagPrintDTOImpl instance) =>
    <String, dynamic>{
      'descricaoItem': instance.descricaoItem,
      'descricaoProprietario': instance.descricaoProprietario,
      'idEtiqueta': instance.idEtiqueta,
      'restricao': instance.restricao,
    };

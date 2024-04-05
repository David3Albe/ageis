// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaItemResponseDTOImpl _$$ItemEtiquetaItemResponseDTOImplFromJson(
        Map json) =>
    _$ItemEtiquetaItemResponseDTOImpl(
      cod: json['cod'] as int,
      codItem: json['codItem'] as int,
      idEtiqueta: json['idEtiqueta'] as String,
      qtdeProcessos: json['qtdeProcessos'] as int?,
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      nome: json['nome'] as String?,
      codUsuarioAlteracao: json['codUsuarioAlteracao'] as int?,
    );

Map<String, dynamic> _$$ItemEtiquetaItemResponseDTOImplToJson(
        _$ItemEtiquetaItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'qtdeProcessos': instance.qtdeProcessos,
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'nome': instance.nome,
      'codUsuarioAlteracao': instance.codUsuarioAlteracao,
    };

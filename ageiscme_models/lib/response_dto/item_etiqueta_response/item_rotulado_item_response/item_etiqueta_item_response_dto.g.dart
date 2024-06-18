// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaItemResponseDTOImpl _$$ItemEtiquetaItemResponseDTOImplFromJson(
        Map json) =>
    _$ItemEtiquetaItemResponseDTOImpl(
      cod: (json['cod'] as num).toInt(),
      codItem: (json['codItem'] as num).toInt(),
      idEtiqueta: json['idEtiqueta'] as String,
      qtdeProcessos: (json['qtdeProcessos'] as num?)?.toInt(),
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      nome: json['nome'] as String?,
      codUsuarioAlteracao: (json['codUsuarioAlteracao'] as num?)?.toInt(),
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

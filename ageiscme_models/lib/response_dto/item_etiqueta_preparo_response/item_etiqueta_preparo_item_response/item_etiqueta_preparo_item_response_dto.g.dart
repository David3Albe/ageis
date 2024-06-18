// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_preparo_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaPreparoItemResponseDTOImpl
    _$$ItemEtiquetaPreparoItemResponseDTOImplFromJson(Map json) =>
        _$ItemEtiquetaPreparoItemResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String,
          idEtiqueta: json['idEtiqueta'] as String,
          nomeTipoProcesso: json['nomeTipoProcesso'] as String,
          nomeProprietario: json['nomeProprietario'] as String,
          urgencia: json['urgencia'] as bool,
        );

Map<String, dynamic> _$$ItemEtiquetaPreparoItemResponseDTOImplToJson(
        _$ItemEtiquetaPreparoItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'idEtiqueta': instance.idEtiqueta,
      'nomeTipoProcesso': instance.nomeTipoProcesso,
      'nomeProprietario': instance.nomeProprietario,
      'urgencia': instance.urgencia,
    };

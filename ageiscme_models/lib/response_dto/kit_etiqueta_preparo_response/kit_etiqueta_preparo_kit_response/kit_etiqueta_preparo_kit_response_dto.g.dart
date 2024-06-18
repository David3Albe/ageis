// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_etiqueta_preparo_kit_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitEtiquetaPreparoKitResponseDTOImpl
    _$$KitEtiquetaPreparoKitResponseDTOImplFromJson(Map json) =>
        _$KitEtiquetaPreparoKitResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String,
          codBarra: json['codBarra'] as String,
          nomeTipoProcesso: json['nomeTipoProcesso'] as String,
          nomeProprietario: json['nomeProprietario'] as String,
          urgencia: json['urgencia'] as bool,
          totalItensKit: (json['totalItensKit'] as num).toInt(),
          totalItensLidosKit: (json['totalItensLidosKit'] as num).toInt(),
        );

Map<String, dynamic> _$$KitEtiquetaPreparoKitResponseDTOImplToJson(
        _$KitEtiquetaPreparoKitResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'codBarra': instance.codBarra,
      'nomeTipoProcesso': instance.nomeTipoProcesso,
      'nomeProprietario': instance.nomeProprietario,
      'urgencia': instance.urgencia,
      'totalItensKit': instance.totalItensKit,
      'totalItensLidosKit': instance.totalItensLidosKit,
    };

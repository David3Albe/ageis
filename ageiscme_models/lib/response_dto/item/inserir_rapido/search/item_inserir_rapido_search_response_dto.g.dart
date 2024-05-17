// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_inserir_rapido_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemInserirRapidoSearchResponseDTOImpl
    _$$ItemInserirRapidoSearchResponseDTOImplFromJson(Map json) =>
        _$ItemInserirRapidoSearchResponseDTOImpl(
          etiquetas: (json['etiquetas'] as List<dynamic>)
              .map((e) => ItemInserirRapidoSearchEtiquetaResponseDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
          idEtiqueta: json['idEtiqueta'] as String?,
          qtdeMax: json['qtdeMax'] as int?,
          qtdeExistente: json['qtdeExistente'] as int?,
        );

Map<String, dynamic> _$$ItemInserirRapidoSearchResponseDTOImplToJson(
        _$ItemInserirRapidoSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'etiquetas': instance.etiquetas.map((e) => e.toJson()).toList(),
      'idEtiqueta': instance.idEtiqueta,
      'qtdeMax': instance.qtdeMax,
      'qtdeExistente': instance.qtdeExistente,
    };

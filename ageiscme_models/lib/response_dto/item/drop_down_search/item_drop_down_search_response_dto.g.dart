// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_drop_down_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDropDownSearchResponseDTOImpl
    _$$ItemDropDownSearchResponseDTOImplFromJson(Map json) =>
        _$ItemDropDownSearchResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          idEtiqueta: json['idEtiqueta'] as String,
          descricao: json['descricao'] as String?,
        );

Map<String, dynamic> _$$ItemDropDownSearchResponseDTOImplToJson(
        _$ItemDropDownSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
    };

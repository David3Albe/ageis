// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_drop_down_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitDropDownSearchResponseDTOImpl _$$KitDropDownSearchResponseDTOImplFromJson(
        Map json) =>
    _$KitDropDownSearchResponseDTOImpl(
      cod: (json['cod'] as num).toInt(),
      codBarra: json['codBarra'] as String,
      nomeDescritor: json['nomeDescritor'] as String?,
    );

Map<String, dynamic> _$$KitDropDownSearchResponseDTOImplToJson(
        _$KitDropDownSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'nomeDescritor': instance.nomeDescritor,
    };

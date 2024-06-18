// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno_query_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnoQueryItemResponseDTOImpl _$$TurnoQueryItemResponseDTOImplFromJson(
        Map json) =>
    _$TurnoQueryItemResponseDTOImpl(
      cod: (json['cod'] as num).toInt(),
      descricao: json['descricao'] as String,
      ativo: json['ativo'] as bool,
      tstamp: json['tstamp'] as String,
    );

Map<String, dynamic> _$$TurnoQueryItemResponseDTOImplToJson(
        _$TurnoQueryItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'descricao': instance.descricao,
      'ativo': instance.ativo,
      'tstamp': instance.tstamp,
    };

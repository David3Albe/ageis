// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_query_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaQueryItemResponseDTOImpl _$$SiglaQueryItemResponseDTOImplFromJson(
        Map json) =>
    _$SiglaQueryItemResponseDTOImpl(
      cod: json['cod'] as int,
      sigla: json['sigla'] as String,
      descricao: json['descricao'] as String,
      ativo: json['ativo'] as bool,
      tstamp: json['tstamp'] as String,
    );

Map<String, dynamic> _$$SiglaQueryItemResponseDTOImplToJson(
        _$SiglaQueryItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'sigla': instance.sigla,
      'descricao': instance.descricao,
      'ativo': instance.ativo,
      'tstamp': instance.tstamp,
    };

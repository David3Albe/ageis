// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'ciclo_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CicloPrintDTOImpl _$$CicloPrintDTOImplFromJson(Map json) =>
    _$CicloPrintDTOImpl(
      instituicao: json['instituicao'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              CicloPrintItemsDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$CicloPrintDTOImplToJson(_$CicloPrintDTOImpl instance) =>
    <String, dynamic>{
      'instituicao': instance.instituicao,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitSearchResponseDTOImpl _$$KitSearchResponseDTOImplFromJson(Map json) =>
    _$KitSearchResponseDTOImpl(
      kits: (json['kits'] as List<dynamic>)
          .map((e) => KitSearchKitResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      descritores: (json['descritores'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            KitSearchDescritorResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
      cores: (json['cores'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            KitSearchCorResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
    );

Map<String, dynamic> _$$KitSearchResponseDTOImplToJson(
        _$KitSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'kits': instance.kits.map((e) => e.toJson()).toList(),
      'descritores': instance.descritores
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'cores': instance.cores.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_mesma_cor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitMesmaCorResponseDTOImpl _$$KitMesmaCorResponseDTOImplFromJson(Map json) =>
    _$KitMesmaCorResponseDTOImpl(
      kits: (json['kits'] as List<dynamic>)
          .map((e) => KitMesmaCorKitResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$KitMesmaCorResponseDTOImplToJson(
        _$KitMesmaCorResponseDTOImpl instance) =>
    <String, dynamic>{
      'kits': instance.kits.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'epi_delivery_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiDeliveryPrintDTOImpl _$$EpiDeliveryPrintDTOImplFromJson(Map json) =>
    _$EpiDeliveryPrintDTOImpl(
      instituition: json['instituition'] as String,
      userName: json['userName'] as String,
      epis: (json['epis'] as List<dynamic>)
          .map((e) => EpiDeliveryEpiPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      userDoc: json['userDoc'] as String?,
    );

Map<String, dynamic> _$$EpiDeliveryPrintDTOImplToJson(
        _$EpiDeliveryPrintDTOImpl instance) =>
    <String, dynamic>{
      'instituition': instance.instituition,
      'userName': instance.userName,
      'epis': instance.epis.map((e) => e.toJson()).toList(),
      'userDoc': instance.userDoc,
    };

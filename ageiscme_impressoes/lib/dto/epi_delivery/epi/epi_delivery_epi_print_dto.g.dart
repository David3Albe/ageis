// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'epi_delivery_epi_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiDeliveryEpiPrintDTOImpl _$$EpiDeliveryEpiPrintDTOImplFromJson(Map json) =>
    _$EpiDeliveryEpiPrintDTOImpl(
      description: json['description'] as String,
      CANumber: json['CANumber'] as String?,
      validity: json['validity'] == null
          ? null
          : DateTime.parse(json['validity'] as String),
    );

Map<String, dynamic> _$$EpiDeliveryEpiPrintDTOImplToJson(
        _$EpiDeliveryEpiPrintDTOImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'CANumber': instance.CANumber,
      'validity': instance.validity?.toIso8601String(),
    };

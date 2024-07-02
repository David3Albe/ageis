// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'arsenais_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArsenaisPrintDTOImpl _$$ArsenaisPrintDTOImplFromJson(Map json) =>
    _$ArsenaisPrintDTOImpl(
      companyCod: (json['companyCod'] as num).toInt(),
      companyName: json['companyName'] as String,
      arsenais: (json['arsenais'] as List<dynamic>)
          .map((e) =>
              ArsenalPrintDTO.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ArsenaisPrintDTOImplToJson(
        _$ArsenaisPrintDTOImpl instance) =>
    <String, dynamic>{
      'companyCod': instance.companyCod,
      'companyName': instance.companyName,
      'arsenais': instance.arsenais.map((e) => e.toJson()).toList(),
    };

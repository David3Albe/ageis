// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'packagings_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackagingsPrintDTOImpl _$$PackagingsPrintDTOImplFromJson(Map json) =>
    _$PackagingsPrintDTOImpl(
      companyName: json['companyName'] as String,
      companyCod: (json['companyCod'] as num).toInt(),
      packagings: (json['packagings'] as List<dynamic>)
          .map((e) => PackagingsPackagingPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$PackagingsPrintDTOImplToJson(
        _$PackagingsPrintDTOImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'companyCod': instance.companyCod,
      'packagings': instance.packagings.map((e) => e.toJson()).toList(),
    };

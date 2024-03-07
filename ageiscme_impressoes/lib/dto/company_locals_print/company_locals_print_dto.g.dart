// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'company_locals_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyLocalsPrintDTOImpl _$$CompanyLocalsPrintDTOImplFromJson(Map json) =>
    _$CompanyLocalsPrintDTOImpl(
      companyName: json['companyName'] as String,
      locals: (json['locals'] as List<dynamic>)
          .map((e) => CompanyLocalsPrintLocalDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$CompanyLocalsPrintDTOImplToJson(
        _$CompanyLocalsPrintDTOImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'locals': instance.locals.map((e) => e.toJson()).toList(),
    };

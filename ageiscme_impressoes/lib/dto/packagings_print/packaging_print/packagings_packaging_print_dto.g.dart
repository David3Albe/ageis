// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'packagings_packaging_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackagingsPackagingPrintDTOImpl _$$PackagingsPackagingPrintDTOImplFromJson(
        Map json) =>
    _$PackagingsPackagingPrintDTOImpl(
      name: json['name'] as String,
      tagId: (json['tagId'] as num).toInt(),
      selected: json['selected'] as bool,
    );

Map<String, dynamic> _$$PackagingsPackagingPrintDTOImplToJson(
        _$PackagingsPackagingPrintDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tagId': instance.tagId,
      'selected': instance.selected,
    };

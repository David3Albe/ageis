// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_print_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPrintUserResponseDTOImpl _$$UserPrintUserResponseDTOImplFromJson(
        Map json) =>
    _$UserPrintUserResponseDTOImpl(
      userName: json['userName'] as String,
      rg: (json['rg'] as num).toInt(),
      tagId: (json['tagId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserPrintUserResponseDTOImplToJson(
        _$UserPrintUserResponseDTOImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'rg': instance.rg,
      'tagId': instance.tagId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_print_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPrintResponseDTOImpl _$$UserPrintResponseDTOImplFromJson(Map json) =>
    _$UserPrintResponseDTOImpl(
      users: (json['users'] as List<dynamic>)
          .map((e) => UserPrintUserResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      company: UserPrintCompanyResponseDTO.fromJson(
          Map<String, Object?>.from(json['company'] as Map)),
    );

Map<String, dynamic> _$$UserPrintResponseDTOImplToJson(
        _$UserPrintResponseDTOImpl instance) =>
    <String, dynamic>{
      'users': instance.users.map((e) => e.toJson()).toList(),
      'company': instance.company.toJson(),
    };

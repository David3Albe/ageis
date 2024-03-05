// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommandResultModelImpl _$$CommandResultModelImplFromJson(Map json) =>
    _$CommandResultModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$CommandResultModelImplToJson(
        _$CommandResultModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

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
      alertType: $enumDecodeNullable(
          _$CommandResultAlertTypeEnumMap, json['alertType']),
    );

Map<String, dynamic> _$$CommandResultModelImplToJson(
        _$CommandResultModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'alertType': _$CommandResultAlertTypeEnumMap[instance.alertType],
    };

const _$CommandResultAlertTypeEnumMap = {
  CommandResultAlertType.Error: 1,
  CommandResultAlertType.Warning: 2,
  CommandResultAlertType.Notice: 3,
  CommandResultAlertType.Success: 4,
};

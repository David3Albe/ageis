// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'training_record_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingRecordPrintDTOImpl _$$TrainingRecordPrintDTOImplFromJson(Map json) =>
    _$TrainingRecordPrintDTOImpl(
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => TrainingRecordUserPrintDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      description: json['description'] as String?,
      entity: json['entity'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      workload: (json['workload'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TrainingRecordPrintDTOImplToJson(
        _$TrainingRecordPrintDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'users': instance.users.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'entity': instance.entity,
      'date': instance.date?.toIso8601String(),
      'workload': instance.workload,
    };

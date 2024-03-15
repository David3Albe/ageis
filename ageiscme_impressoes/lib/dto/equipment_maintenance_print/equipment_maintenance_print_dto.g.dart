// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'equipment_maintenance_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentMaintenancePrintDTOImpl _$$EquipmentMaintenancePrintDTOImplFromJson(
        Map json) =>
    _$EquipmentMaintenancePrintDTOImpl(
      cod: json['cod'] as int,
      company: EquipmentMaintenanceCompanyPrintDTO.fromJson(
          Map<String, Object?>.from(json['company'] as Map)),
      employeer: EquipmentMaintenanceEmployeerPrintDTO.fromJson(
          Map<String, Object?>.from(json['employeer'] as Map)),
      impressionTime: DateTime.parse(json['impressionTime'] as String),
      serviceName: json['serviceName'] as String,
      equipment: json['equipment'] == null
          ? null
          : EquipmentMaintenanceEquipmentPrintDTO.fromJson(
              Map<String, Object?>.from(json['equipment'] as Map)),
      item: json['item'] == null
          ? null
          : EquipmentMaintenanceItemPrintDTO.fromJson(
              Map<String, Object?>.from(json['item'] as Map)),
    );

Map<String, dynamic> _$$EquipmentMaintenancePrintDTOImplToJson(
        _$EquipmentMaintenancePrintDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'company': instance.company.toJson(),
      'employeer': instance.employeer.toJson(),
      'impressionTime': instance.impressionTime.toIso8601String(),
      'serviceName': instance.serviceName,
      'equipment': instance.equipment?.toJson(),
      'item': instance.item?.toJson(),
    };

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipment_maintenance_equipment_print_dto.g.dart';
part 'equipment_maintenance_equipment_print_dto.freezed.dart';

@unfreezed
sealed class EquipmentMaintenanceEquipmentPrintDTO with _$EquipmentMaintenanceEquipmentPrintDTO {
  factory EquipmentMaintenanceEquipmentPrintDTO({
    required int cod,
    required String name,
  }) = _EquipmentMaintenanceEquipmentPrintDTO;

  factory EquipmentMaintenanceEquipmentPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EquipmentMaintenanceEquipmentPrintDTOFromJson(json);

  static EquipmentMaintenanceEquipmentPrintDTO copy(
    EquipmentMaintenanceEquipmentPrintDTO obj,
  ) =>
      EquipmentMaintenanceEquipmentPrintDTO.fromJson(obj.toJson());
}

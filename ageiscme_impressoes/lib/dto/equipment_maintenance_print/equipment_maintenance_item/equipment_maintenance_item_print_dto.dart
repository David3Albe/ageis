import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipment_maintenance_item_print_dto.g.dart';
part 'equipment_maintenance_item_print_dto.freezed.dart';

@unfreezed
sealed class EquipmentMaintenanceItemPrintDTO with _$EquipmentMaintenanceItemPrintDTO {
  factory EquipmentMaintenanceItemPrintDTO({
    required int cod,
    required String name,
  }) = _EquipmentMaintenanceItemPrintDTO;

  factory EquipmentMaintenanceItemPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EquipmentMaintenanceItemPrintDTOFromJson(json);

  static EquipmentMaintenanceItemPrintDTO copy(
    EquipmentMaintenanceItemPrintDTO obj,
  ) =>
      EquipmentMaintenanceItemPrintDTO.fromJson(obj.toJson());
}

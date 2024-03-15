import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipment_maintenance_employeer_print_dto.g.dart';
part 'equipment_maintenance_employeer_print_dto.freezed.dart';

@unfreezed
sealed class EquipmentMaintenanceEmployeerPrintDTO
    with _$EquipmentMaintenanceEmployeerPrintDTO {
  factory EquipmentMaintenanceEmployeerPrintDTO({
    required String name,
    String? doc,
  }) = _EquipmentMaintenanceEmployeerPrintDTO;

  factory EquipmentMaintenanceEmployeerPrintDTO.fromJson(
    Map<String, Object?> json,
  ) =>
      _$EquipmentMaintenanceEmployeerPrintDTOFromJson(json);

  static EquipmentMaintenanceEmployeerPrintDTO copy(
    EquipmentMaintenanceEmployeerPrintDTO obj,
  ) =>
      EquipmentMaintenanceEmployeerPrintDTO.fromJson(obj.toJson());
}

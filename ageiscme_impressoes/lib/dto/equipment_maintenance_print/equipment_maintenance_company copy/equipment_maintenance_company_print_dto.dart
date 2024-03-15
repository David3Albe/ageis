import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipment_maintenance_company_print_dto.g.dart';
part 'equipment_maintenance_company_print_dto.freezed.dart';

@unfreezed
sealed class EquipmentMaintenanceCompanyPrintDTO with _$EquipmentMaintenanceCompanyPrintDTO {
  factory EquipmentMaintenanceCompanyPrintDTO({
    required int cod,
    required String name,
  }) = _EquipmentMaintenanceCompanyPrintDTO;

  factory EquipmentMaintenanceCompanyPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EquipmentMaintenanceCompanyPrintDTOFromJson(json);

  static EquipmentMaintenanceCompanyPrintDTO copy(
    EquipmentMaintenanceCompanyPrintDTO obj,
  ) =>
      EquipmentMaintenanceCompanyPrintDTO.fromJson(obj.toJson());
}

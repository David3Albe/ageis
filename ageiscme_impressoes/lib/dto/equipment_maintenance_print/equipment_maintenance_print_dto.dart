import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_company/equipment_maintenance_company_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_employeer/equipment_maintenance_employeer_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_equipment/equipment_maintenance_equipment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_item/equipment_maintenance_item_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipment_maintenance_print_dto.g.dart';
part 'equipment_maintenance_print_dto.freezed.dart';

@unfreezed
sealed class EquipmentMaintenancePrintDTO with _$EquipmentMaintenancePrintDTO {
  factory EquipmentMaintenancePrintDTO({
    required int cod,
    required EquipmentMaintenanceCompanyPrintDTO company,
    required EquipmentMaintenanceEmployeerPrintDTO employeer,
    required DateTime impressionTime,
    required String serviceName,
    EquipmentMaintenanceEquipmentPrintDTO? equipment,
    EquipmentMaintenanceItemPrintDTO? item,
  }) = _EquipmentMaintenancePrintDTO;

  factory EquipmentMaintenancePrintDTO.fromJson(Map<String, Object?> json) =>
      _$EquipmentMaintenancePrintDTOFromJson(json);

  static EquipmentMaintenancePrintDTO copy(
    EquipmentMaintenancePrintDTO obj,
  ) =>
      EquipmentMaintenancePrintDTO.fromJson(obj.toJson());
}

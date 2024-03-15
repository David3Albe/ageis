import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_equipment/equipment_maintenance_equipment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_item/equipment_maintenance_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class MaterialRowWidget extends StatelessWidget {
  final EquipmentMaintenancePrintDTO maintenance;

  MaterialRowWidget({
    required this.maintenance,
    required this.style,
  });
  final TextStyle style;

  @override
  Widget build(Context context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            _getMaterialString(),
            style: style,
          ),
        ),
      ],
    );
  }

  String _getMaterialString() {
    EquipmentMaintenanceEquipmentPrintDTO? equipment = maintenance.equipment;
    if (equipment != null) {
      return 'EQUIPAMENTO: (${equipment.cod}) ${equipment.name}';
    }

    EquipmentMaintenanceItemPrintDTO? item = maintenance.item;
    if (item != null) {
      return 'ITEM: (${item.cod}) ${item.name}';
    }

    return '';
  }
}

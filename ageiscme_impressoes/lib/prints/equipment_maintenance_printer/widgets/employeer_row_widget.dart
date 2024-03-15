import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_employeer/equipment_maintenance_employeer_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EmployeerRowWidget extends StatelessWidget {
  final EquipmentMaintenanceEmployeerPrintDTO employeer;

  EmployeerRowWidget({
    required this.employeer,
    required this.style,
  });
  final TextStyle style;

  @override
  Widget build(Context context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'OP.: ${_getEmployeerString()}',
            style: style,
          ),
        ),
      ],
    );
  }

  String _getEmployeerString() {
    String employeerName = employeer.name;
    if (employeerName.length > 15) {
      employeerName = employeerName.substring(0, 15);
    }

    String? employeerDoc = employeer.doc;
    String employeerDocString = '';
    if (employeerDoc != null && employeerDoc.length > 10) {
      employeerDoc = employeerDoc.substring(0, 10);
    }

    if (employeerDoc != null && !employeerDoc.isEmpty) {
      employeerDocString = ' - $employeerDoc';
    }
    return '$employeerName$employeerDocString';
  }
}

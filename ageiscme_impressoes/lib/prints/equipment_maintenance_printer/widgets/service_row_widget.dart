import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ServiceRowWidget extends StatelessWidget {
  final EquipmentMaintenancePrintDTO maintenance;

  ServiceRowWidget({
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
            'SERVIÇO: ${maintenance.serviceName}',
            style: style,
          ),
        ),
      ],
    );
  }
}

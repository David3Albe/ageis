import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ImpressionTimeRowWidget extends StatelessWidget {
  final EquipmentMaintenancePrintDTO maintenance;

  ImpressionTimeRowWidget({
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
            'REALIZADO EM: ${_getDateTimeFormat(maintenance.impressionTime)}',
            style: style,
          ),
        ),
      ],
    );
  }

  String _getDateTimeFormat(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    return formatter.format(dateTime);
  }
}

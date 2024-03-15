import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_company/equipment_maintenance_company_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class CompanyRowWidget extends StatelessWidget {
  final EquipmentMaintenanceCompanyPrintDTO company;

  CompanyRowWidget({
    required this.company,
    required this.style,
  });
  final TextStyle style;

  @override
  Widget build(Context context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            company.name,
            style: style,
          ),
        ),
      ],
    );
  }
}

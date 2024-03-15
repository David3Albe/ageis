import 'package:ageiscme_impressoes/dto/equipment_maintenance_print/equipment_maintenance_print_dto.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ModuleRowWidget extends StatelessWidget {
  final EquipmentMaintenancePrintDTO maintenance;

  ModuleRowWidget({
    required this.maintenance,
    required this.style,
  });
  final TextStyle style;

  @override
  Widget build(Context context) {
    String tagId = _getModuleString();
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        children: [
          Text(
            tagId,
            style: style,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
          ),
          BarcodeWidget(
            data: tagId,
            height: 25,
            width: 25,
            barcode: Barcode.dataMatrix(),
          ),
        ],
      ),
    );
  }

  String _getModuleString() {
    String modulo = ModulosEnum.Servico.toString();
    String company = maintenance.company.cod.toString().padLeft(3, '0');
    String cod = maintenance.cod.toString().padLeft(11, '0');
    return '$modulo$company$cod';
  }
}

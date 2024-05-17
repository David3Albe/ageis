import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ServiceTypeBarcodeWidget extends StatelessWidget {
  final MonitoringPrintDTO dto;

  ServiceTypeBarcodeWidget({
    required this.dto,
  });

  @override
  Widget build(Context context) {
    String serviceType = '122' +
        dto.companyCod.toString().padLeft(3, '0') +
        dto.cod.toString().padLeft(11, '0');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceType,
              style: const TextStyle(fontSize: 8),
            ),
            Padding(padding: const EdgeInsets.only(left: 15)),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: BarcodeWidget(
                data: serviceType,
                barcode: Barcode.dataMatrix(),
                height: 18,
                width: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

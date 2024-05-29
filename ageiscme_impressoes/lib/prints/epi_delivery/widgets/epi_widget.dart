import 'package:ageiscme_impressoes/dto/epi_delivery/epi/epi_delivery_epi_print_dto.dart';
import 'package:ageiscme_impressoes/dto/epi_delivery/epi_delivery_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EpiWidget extends StatelessWidget {
  final EpiDeliveryPrintDTO dto;
  final EpiDeliveryEpiPrintDTO epi;
  static const double WIDTH_EPI = 170;

  EpiWidget({
    required this.dto,
    required this.epi,
  });

  @override
  Widget build(Context context) {
    DateFormat format = DateFormat('dd/MM/yyyy');
    String? formatedDate =
        epi.validity == null ? null : format.format(epi.validity!);
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Text(
                epi.description,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Container(
              width: 160,
              child: Text(
                'Nr CA: ' + (epi.CANumber ?? ''),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Container(
              width: 160,
              child: Text(
                'Data de Validade: ' + (formatedDate ?? ''),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

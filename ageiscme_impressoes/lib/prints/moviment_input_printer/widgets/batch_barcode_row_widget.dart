import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class BatchBarcodeWidget extends StatelessWidget {
  final MovimentInputPrintDTO dto;

  BatchBarcodeWidget({
    required this.dto,
  });

  @override
  Widget build(Context context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOTE: ' + (dto.batch ?? ''),
              style: const TextStyle(fontSize: 8),
            ),
            Padding(padding: const EdgeInsets.only(left: 15)),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: BarcodeWidget(
                data: dto.batch ?? '',
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

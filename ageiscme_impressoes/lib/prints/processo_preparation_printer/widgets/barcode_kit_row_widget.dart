import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class BarcodeKitRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationKitPrintDTO kit;
  final ImageProvider urgencyImageProvider;

  BarcodeKitRowWidget({
    required this.dto,
    required this.kit,
    required this.urgencyImageProvider,
  });

  @override
  Widget build(Context context) {
    ImageProvider? urgencyProvider;
    if (kit.urgency) {
      urgencyProvider = urgencyImageProvider;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        urgencyProvider != null
            ? Image(
                urgencyProvider,
                height: 15,
                width: 15,
              )
            : BarcodeWidget(
                data: kit.tagId.toString(),
                barcode: Barcode.dataMatrix(),
                height: 15,
                width: 15,
              ),
        SizedBox(width: 30),
        BarcodeWidget(
          data: kit.tagId.toString(),
          barcode: Barcode.dataMatrix(),
          height: 15,
          width: 15,
        ),
        SizedBox(width: 30),
        BarcodeWidget(
          data: kit.tagId.toString(),
          barcode: Barcode.dataMatrix(),
          height: 15,
          width: 15,
        ),
      ],
    );
  }
}

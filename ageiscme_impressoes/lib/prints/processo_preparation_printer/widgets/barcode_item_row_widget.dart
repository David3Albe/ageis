import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class BarcodeItemRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationItemPrintDTO item;
  final ImageProvider urgencyImageProvider;

  BarcodeItemRowWidget({
    required this.dto,
    required this.item,
    required this.urgencyImageProvider,
  });

  @override
  Widget build(Context context) {
    ImageProvider? urgencyProvider;
    if (item.urgency) {
      urgencyProvider = urgencyImageProvider;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        urgencyProvider != null
            ? Image(
                urgencyProvider,
                height: 20,
                width: 20,
              )
            : BarcodeWidget(
                data: item.tagId,
                barcode: Barcode.dataMatrix(),
                height: 15,
                width: 15,
              ),
        SizedBox(width: 30),
        BarcodeWidget(
          data: item.tagId,
          barcode: Barcode.dataMatrix(),
          height: 15,
          width: 15,
        ),
        SizedBox(width: 30),
        BarcodeWidget(
          data: item.tagId,
          barcode: Barcode.dataMatrix(),
          height: 15,
          width: 15,
        ),
      ],
    );
  }
}

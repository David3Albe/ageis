import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PackagingRowWidget extends StatelessWidget {
  final PackagingsPackagingPrintDTO packaging;
  final PackagingsPrintDTO dto;

  PackagingRowWidget({
    required this.packaging,
    required this.dto,
  });

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Text(packaging.name),
        Padding(
          padding: const EdgeInsets.only(top: 2),
        ),
        // BarcodeWidget(
        //   data: tagId,
        //   height: 25,
        //   width: 25,
        //   barcode: Barcode.dataMatrix(),
        // ),
      ],
    );
  }

  // String _getTag() {
  //   String instituition = dto.
  //   String tag;
  // }
}

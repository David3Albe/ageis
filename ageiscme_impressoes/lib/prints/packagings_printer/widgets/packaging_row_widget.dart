import 'package:ageiscme_impressoes/dto/packagings_print/packaging_print/packagings_packaging_print_dto.dart';
import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:ageiscme_models/enums/modulos_enum.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PackagingRowWidget extends StatelessWidget {
  final PackagingsPackagingPrintDTO packaging;
  final PackagingsPackagingPrintDTO? packaging2;
  final PackagingsPrintDTO dto;

  PackagingRowWidget({
    required this.packaging,
    required this.dto,
    this.packaging2,
  });

  @override
  Widget build(Context context) {
    TextStyle? styleName = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
    TextStyle? styleCod = const TextStyle(fontSize: 8);
    String tagOne = _getTag(packaging.tagId);
    String? tagTwo = packaging2 != null ? _getTag(packaging2!.tagId) : null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(packaging.name, style: styleName),
            ),
            Expanded(
              child: packaging2 != null
                  ? Text(packaging2!.name, style: styleName)
                  : SizedBox(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: BarcodeWidget(
                  data: tagOne,
                  height: 20,
                  width: 20,
                  barcode: Barcode.dataMatrix(),
                ),
              ),
            ),
            Expanded(
              child: tagTwo != null
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: BarcodeWidget(
                        data: tagTwo,
                        height: 20,
                        width: 20,
                        barcode: Barcode.dataMatrix(),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(tagOne, style: styleCod),
              ),
              Expanded(
                child: tagTwo != null
                    ? Text(
                        tagTwo,
                        style: styleCod,
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getTag(int codEmbalagem) {
    String modulo = ModulosEnum.EtapaProcessoTipoEmbalagem.toString();
    String instituition = dto.companyCod.toString().padLeft(3, '0');
    String tagId = codEmbalagem.toString().padLeft(8, '0');
    return modulo + instituition + tagId;
  }
}

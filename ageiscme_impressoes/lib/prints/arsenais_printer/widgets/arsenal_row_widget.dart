import 'package:ageiscme_impressoes/dto/arsenais_print/arsenais_print_dto.dart';
import 'package:ageiscme_impressoes/dto/arsenais_print/arsenal_print/arsenal_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ArsenalRowWidget extends StatelessWidget {
  final ArsenalPrintDTO arsenal;
  final ArsenalPrintDTO? arsenalTwo;
  final ArsenaisPrintDTO dto;

  ArsenalRowWidget({
    required this.arsenal,
    required this.dto,
    this.arsenalTwo,
  });

  @override
  Widget build(Context context) {
    TextStyle? styleName = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
    TextStyle? styleCod = const TextStyle(fontSize: 8);
    String tagOne = arsenal.codBarra;
    String? tagTwo = arsenalTwo?.codBarra;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(arsenal.name, style: styleName),
            ),
            Expanded(
              child: arsenalTwo != null
                  ? Text(arsenalTwo!.name, style: styleName)
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
}

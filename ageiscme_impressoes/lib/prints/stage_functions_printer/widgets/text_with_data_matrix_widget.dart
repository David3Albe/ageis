import 'package:dependencias_comuns/printing_exports.dart';

class TextWithDataMatrixWidget extends StatelessWidget {
  final String tagId;
  final String text;

  TextWithDataMatrixWidget({
    required this.tagId,
    required this.text,
  });

  @override
  Widget build(Context context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Padding(padding: const EdgeInsets.only(top: 5)),
          Align(
            alignment: Alignment.centerLeft,
            child: BarcodeWidget(
              barcode: Barcode.dataMatrix(),
              data: tagId,
              height: 15,
              width: 15,
            ),
          ),
        ],
      ),
    );
  }
}

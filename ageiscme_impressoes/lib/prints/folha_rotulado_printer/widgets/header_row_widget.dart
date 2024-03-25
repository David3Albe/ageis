import 'package:dependencias_comuns/printing_exports.dart';

class HeaderRowWidget extends StatelessWidget {
  HeaderRowWidget({required this.tipo});

  final String tipo;

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tipo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:dependencias_comuns/printing_exports.dart';

class PresenceDescriptionWidget extends StatelessWidget {
  PresenceDescriptionWidget();

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 14)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'LISTA DE PRESENÇA',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

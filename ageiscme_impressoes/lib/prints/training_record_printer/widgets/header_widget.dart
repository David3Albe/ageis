import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderWidget extends StatelessWidget {
  final TrainingRecordPrintDTO dto;

  HeaderWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'REGISTRO DE TREINAMENTO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'NOME:',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                dto.name,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:ageiscme_impressoes/dto/training_record/training_record_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class DescriptionWidget extends StatelessWidget {
  final TrainingRecordPrintDTO dto;

  DescriptionWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat format = DateFormat('dd/MM/yyyy');
    String dateFormated = dto.date == null ? '' : format.format(dto.date!);
    String? hoursFormated;
    if (dto.workload != null) {
      int hours = dto.workload!.floor();
      int minutes = (dto.workload!.remainder(1) * 60).round();
      hoursFormated =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
    }
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 2)),
        Divider(
          height: 1,
          thickness: 0.5,
        ),
        Padding(padding: const EdgeInsets.only(top: 2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'DESCRIÇÃO:',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 4)),
        Container(
          height: 185,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  dto.description ?? '',
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 0.5,
        ),
        Padding(padding: const EdgeInsets.only(top: 4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'ENTIDADE:',
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
                dto.entity ?? '',
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Text(
                'DATA:',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'CARGA HORÁRIA (HR):',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Text(
                dateFormated,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ),
            Text(
              hoursFormated ?? '',
              style: const TextStyle(
                fontSize: 8,
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 8)),
        Divider(
          height: 1,
          thickness: 0.5,
        ),
      ],
    );
  }
}

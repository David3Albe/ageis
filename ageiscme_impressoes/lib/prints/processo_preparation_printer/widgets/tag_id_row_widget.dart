import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class TagIdRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final String tagId;

  TagIdRowWidget({required this.dto, required this.tagId});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 30),
        Text(
          tagId,
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}

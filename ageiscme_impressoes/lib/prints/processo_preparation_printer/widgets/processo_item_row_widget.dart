import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ProcessoItemRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationItemPrintDTO item;

  ProcessoItemRowWidget({required this.dto, required this.item});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'PROCESSO: ',
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        Text(
          item.nomeProcesso,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

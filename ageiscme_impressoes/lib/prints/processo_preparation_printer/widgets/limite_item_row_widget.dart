import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class LimiteItemRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationItemPrintDTO item;

  LimiteItemRowWidget({required this.dto, required this.item});

  @override
  Widget build(Context context) {
    DateFormat formato = DateFormat('dd/MM/yyyy');
    DateTime dataLimite =
        dto.actualTime.add(Duration(days: item.validadeEmbalagem));
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'DATA LIMITE DE USO: ',
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        Text(
          formato.format(dataLimite),
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

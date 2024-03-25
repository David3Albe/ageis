import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class KitRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationKitPrintDTO kit;

  KitRowWidget({required this.dto, required this.kit});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'MATERIAL: ',
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        Text(
          kit.nomeDescritor + ' (${kit.itensLidos}/${kit.itensTotalKit} Itens)',
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

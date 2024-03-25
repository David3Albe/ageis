import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ProprietarioKitRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;
  final ProcessoPreparationKitPrintDTO kit;

  ProprietarioKitRowWidget({required this.dto, required this.kit});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'PROPRIETÁRIO: ',
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        Text(
          kit.nomeProprietario,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

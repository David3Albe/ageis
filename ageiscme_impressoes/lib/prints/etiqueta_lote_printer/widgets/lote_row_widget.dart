import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class LoteRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;

  LoteRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              'LOTE: ${dto.codRegistroProcesso}',
              style: const TextStyle(
                fontSize: 9,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'LOTE: ${dto.codRegistroProcesso}',
                style: const TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'LOTE: ${dto.codRegistroProcesso}',
                style: const TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

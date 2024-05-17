import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/etiqueta_lote_printer_controller.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class LoteRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;
  final int impressoes;

  LoteRowWidget({
    required this.dto,
    required this.impressoes,
  });

  @override
  Widget build(Context context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: EtiquetaLotePrinterController.MAX_WIDTH,
            child: Text(
              'LOTE: ${dto.codRegistroProcesso}',
              style: const TextStyle(
                fontSize: 9,
              ),
            ),
          ),
          impressoes >= 2
              ? Container(
                  width: EtiquetaLotePrinterController.MAX_WIDTH,
                  child: Text(
                    'LOTE: ${dto.codRegistroProcesso}',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                )
              : SizedBox(),
          impressoes >= 3
              ? Container(
                  width: EtiquetaLotePrinterController.MAX_WIDTH,
                  child: Text(
                    'LOTE: ${dto.codRegistroProcesso}',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

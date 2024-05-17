import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/etiqueta_lote_printer_controller.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ValidadeRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;
  final int impressoes;

  ValidadeRowWidget({
    required this.dto,
    required this.impressoes,
  });

  @override
  Widget build(Context context) {
    DateFormat formato = DateFormat('dd/MM/yyyy HH:mm:ss');
    String dataHora = formato.format(dto.dataAtual);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: EtiquetaLotePrinterController.MAX_WIDTH,
            child: Text(
              dataHora,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          impressoes >= 2
              ? Container(
                  width: EtiquetaLotePrinterController.MAX_WIDTH,
                  child: Text(
                    dataHora,
                    style: const TextStyle(
                      fontSize: 6,
                    ),
                  ),
                )
              : SizedBox(),
          impressoes >= 3
              ? Container(
                  width: EtiquetaLotePrinterController.MAX_WIDTH,
                  child: Text(
                    dataHora,
                    style: const TextStyle(
                      fontSize: 6,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

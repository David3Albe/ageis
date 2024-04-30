import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ValidadeRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;

  ValidadeRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat formato = DateFormat('dd/MM/yyyy HH:mm:ss');
    String dataHora = formato.format(dto.dataAtual);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              dataHora,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                dataHora,
                style: const TextStyle(
                  fontSize: 6,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                dataHora,
                style: const TextStyle(
                  fontSize: 6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

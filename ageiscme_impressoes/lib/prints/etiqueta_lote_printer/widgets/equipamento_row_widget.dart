import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EquipamentoRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;

  EquipamentoRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              dto.nomeEquipamento,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                dto.nomeEquipamento,
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
                dto.nomeEquipamento,
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

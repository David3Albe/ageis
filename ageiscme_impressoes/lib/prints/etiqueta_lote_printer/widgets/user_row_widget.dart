import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;

  UserRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    String user =
        dto.nomeUsuario + (dto.userDoc == null ? '' : ' - ${dto.userDoc}');
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'OP.: ' + user,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'OP.: ' + user,
                style: const TextStyle(
                  fontSize: 6,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'OP.: ' + user,
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

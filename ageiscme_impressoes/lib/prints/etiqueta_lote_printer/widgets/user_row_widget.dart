import 'dart:math';

import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;

  UserRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    int lengthNome = min(dto.nomeUsuario.length, 15);
    int lengthDoc = min(dto.userDoc?.length ?? 0, 10);
    String user = dto.nomeUsuario.substring(lengthNome);
    if (dto.userDoc != null) {
      user += ' - ' + dto.userDoc!.substring(lengthDoc);
    }
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
            child: Text(
              'OP.: ' + user,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'OP.: ' + user,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

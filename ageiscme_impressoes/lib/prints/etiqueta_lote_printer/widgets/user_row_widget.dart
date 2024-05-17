import 'dart:math';

import 'package:ageiscme_impressoes/dto/etiqueta_lote_print/etiqueta_lote_print_dto.dart';
import 'package:ageiscme_impressoes/prints/etiqueta_lote_printer/etiqueta_lote_printer_controller.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserRowWidget extends StatelessWidget {
  final EtiquetaLotePrintDTO dto;
  final int impressoes;

  UserRowWidget({
    required this.dto,
    required this.impressoes,
  });

  @override
  Widget build(Context context) {
    int lengthNome = min(dto.nomeUsuario.length, 15);
    int lengthDoc = min(dto.userDoc?.length ?? 0, 10);
    String user = dto.nomeUsuario.substring(0, lengthNome);
    if (dto.userDoc != null) {
      user += ' - ' + dto.userDoc!.substring(0, lengthDoc);
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: EtiquetaLotePrinterController.MAX_WIDTH,
            child: Text(
              'OP.: ' + user,
              style: const TextStyle(
                fontSize: 6,
              ),
            ),
          ),
          impressoes >= 2
              ? Container(
                  width: EtiquetaLotePrinterController.MAX_WIDTH,
                  child: Text(
                    'OP.: ' + user,
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
                    'OP.: ' + user,
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

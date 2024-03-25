import 'dart:math';

import 'package:ageiscme_impressoes/dto/estoque_print/estoque_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderRowWidget extends StatelessWidget {
  final EstoquePrintDTO dto;
  final int pagina;

  HeaderRowWidget({
    required this.dto,
    required this.pagina,
  });

  @override
  Widget build(Context context) {
    final DateFormat formato = DateFormat('dd/MM/yyyy HH:mm:ss');
    String prontuario = '';
    if (dto.prontuario != null) {
      prontuario = ' - PRONTUÁRIO: ${dto.prontuario}';
    }
    String usuario = dto.userName.substring(0, min(25, dto.userName.length));
    if (dto.userDoc != null) {
      usuario += ' - ${dto.userDoc!.substring(
        0,
        min(
          25,
          dto.userDoc!.length,
        ),
      )}';
    }

    String circulante = dto.circulante.substring(
      0,
      min(
        25,
        dto.circulante.length,
      ),
    );
    if (dto.circulanteDoc != null) {
      circulante += ' - ${dto.circulanteDoc!.substring(
        0,
        min(
          dto.circulanteDoc!.length,
          25,
        ),
      )}';
    }

    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 10)),
        Divider(thickness: 1, height: 2),
        Padding(padding: const EdgeInsets.only(top: 2)),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  dto.companyName + ' - RELAÇÃO DE MATERIAIS RETIRADOS',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'LOCAL: ' + dto.nomeLocal + '$prontuario',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'OPERADOR: ' + usuario + ' - CIRCULANTE: $circulante',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'DATA: ${formato.format(dto.actualTime)} - PÁG.: $pagina',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 2)),
        Divider(thickness: 1, height: 2),
      ],
    );
  }
}

import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class EntryOutRowWidget extends StatelessWidget {
  final MovimentInputPrintDTO dto;

  EntryOutRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat dateFM = DateFormat('dd/MM/yyyy');
    String dataHora = dateFM.format(dto.dataHora);
    String validade = dto.validity == null ? '' : dateFM.format(dto.validity!);
    String row1 = 'ENTRADA: $dataHora       VALIDADE: $validade';
    String row2 =
        dto.nroNotaFiscal == null ? '' : 'NR NF: ${dto.nroNotaFiscal}';
    if (dto.entryOut != '1') {
      row1 = dto.equipamentName == null
          ? ''
          : 'EQUIPAMENTO DE DESTINO: ${dto.equipamentName}';
      row2 = 'DATA E HORA DO TERMINO: ____/____/______   ___:___';
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                row1,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  row2,
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

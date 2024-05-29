import 'dart:math';

import 'package:ageiscme_impressoes/dto/epi_delivery/epi_delivery_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class FooterWidget extends StatelessWidget {
  final EpiDeliveryPrintDTO dto;

  FooterWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat format = DateFormat("EEEE, dd 'de' MMMM 'de' yyyy", 'pt-BR');
    String dataAtual = format.format(DateTime.now());
    String nomeColaborador =
        dto.userName.substring(0, min(dto.userName.length, 100));
    String docClasse = '';
    if (dto.userDoc != null) {
      docClasse = dto.userDoc!.substring(0, min(dto.userDoc!.length, 100));
    }
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...getWords1().map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 29)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              child: Divider(thickness: 0.5, height: 1),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Colaborador: $nomeColaborador - Registro: $docClasse',
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                dataAtual,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<String> getWords1() {
    return [
      'Finalmente, declaro que estou de acordo com todos os termos presentes,',
      'razão pela qual assino, nesta data, por livre e espontânea vontade.',
    ];
  }
}

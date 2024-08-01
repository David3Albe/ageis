import 'package:ageiscme_impressoes/dto/epi_delivery/epi_delivery_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderWidget extends StatelessWidget {
  final EpiDeliveryPrintDTO dto;

  HeaderWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: Text(
        //         dto.instituition,
        //         style: const TextStyle(
        //           fontSize: 18,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                'DECLARAÇÃO DE RECEBIMENTO',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...getWords1().map(
          (e) => Wrap(
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
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...getWords2().map(
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
        Padding(padding: const EdgeInsets.only(top: 24)),
        ...getWords4().map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 125),
              Text(
                e,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...getWords5().map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 125),
              Text(
                e,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 6)),
        ...getWords6().map(
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 125),
              Text(
                e,
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "RELAÇÃO DOS EPI's ENTREGUES NESTA DATA:",
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
      'Declaro para todos os fins de direito que recebi gratuitamente, após orientação de uso e aplicação, os Equipamentos de Proteção Individual - EPIs abaixo descritos, os quais me comprometo a utilizar durante a realização de minhas atividades Declaro, ainda, ter ciência de que:',
    ];
  }

  List<String> getWords2() {
    return [
      'a) Os EPIs deverão ser utilizados, unicamente para a finalidade a qual se destinam;',
      'b) Qualquer alteração que os tornem parcial ou totalmente inadequados para o uso deverá ser por mim comunicado;',
      'c) A falta do uso, por mim, dos EPIs fornecidos constitui ato faltoso sujeito às sanções disciplinares prevista na legislação e no Regulamento Interno, aplicáveis ao assunto, inclusive à demissão por justa causa;',
      'd) Responsabilizar-me-ei, integralmente, pela guarda e conservação dos EPIs que me forem entregues. ',
    ];
  }

  List<String> getWords4() {
    return [
      'Base Legal',
    ];
  }

  List<String> getWords5() {
    return [
      'NR 1 (aprovada pela portaria TEM 3214, de 08/06/78):',
      'item 1.8 - Cabe ao empregado:',
      'a) Cumprir disposições legais e regulamentares sobre segurança e medicina ',
      '   do trabalho inclusive de ordens de serviços expedidas pelo empregador;',
      'b) Usar EPI fornecido pelo empregador;',
      'c) Submeter-se aos exames médicos previstos nas NR;',
      'd) Colaborar com a empresa na aplicação das NR;',
    ];
  }

  List<String> getWords6() {
    return [
      'NR 6 (aprovada pela portaria MTb nº 3214, de 08/06/78)',
      'Item 6.7.1 - Cabe ao empregado quanto ao EPI:',
      'a) Usar, utilizando-o apenas para finalidade a que se destina;',
      'b) Responsabilizar-se pela guarda e conservação;',
      'c) Cumprir as determinações do empregador sobre o uso adequado;',
    ];
  }
}

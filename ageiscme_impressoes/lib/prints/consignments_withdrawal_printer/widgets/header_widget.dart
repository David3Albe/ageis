import 'package:ageiscme_data/services/imagem/imagem_printing_service_helper.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments_withdrawal_print_dto.dart';
import 'package:ageiscme_models/models/imagem/imagem_model.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderWidget extends StatelessWidget {
  final ConsignmentsWithdrawalPrintDTO dto;
  final ImagemModel? imagem;

  HeaderWidget({
    required this.dto,
    required this.imagem,
  });

  @override
  Widget build(Context context) {
    String dataFormatada =
        DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    Image? widgetImage = ImagemPrintingServiceHelper.loadImagem(imagem);
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Text(
              'Data: ' + dataFormatada,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: PdfColors.black,
              width: 1,
            ),
          ),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  child: widgetImage,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      dto.instituitionName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 14)),
        Row(
          children: [
            Text(
              'RELAÇÃO DE MATERIAIS RETIRADOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 14)),
        Row(
          children: [
            Text(
              'Médico: ',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dto.doctorName,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 8)),
        Row(
          children: [
            Text(
              'MATERIAIS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

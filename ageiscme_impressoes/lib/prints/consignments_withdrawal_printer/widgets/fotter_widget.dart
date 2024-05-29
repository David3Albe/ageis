import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments_withdrawal_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class FotterWidget extends StatelessWidget {
  final ConsignmentsWithdrawalPrintDTO dto;

  FotterWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 18)),
        Row(
          children: [
            Text(
              'RESPONSÁVEIS: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 8)),
        Row(
          children: [
            Text(
              'Entrega: ',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dto.deliveryResponsibleName,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Retirada: ',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dto.withdrawalResponsibleName,
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
              'Assinaturas: _______________________________________________________',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

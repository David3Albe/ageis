import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments/consignments_withdrawal_consignment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments_withdrawal_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ConsignedWidget extends StatelessWidget {
  final ConsignmentsWithdrawalPrintDTO dto;
  final ConsignmentsWithdrawalConsignmentPrintDTO consignment;

  ConsignedWidget({
    required this.dto,
    required this.consignment,
  });

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Text(
                'Prontuário:',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 100,
              child: Text(
                consignment.prontuary ?? 'SEM PRONTUÁRIO',
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              child: Text(
                consignment.tagId + ' - ' + consignment.name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              child: Text(
                consignment.consignedItemId.toString() +
                    ' - ' +
                    consignment.consignedItemDescription,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            Text(
              'Recebido:',
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            Container(
              width: 50,
              child: Text(
                consignment.received.toString(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Consumido:',
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            Container(
              width: 50,
              child: Text(
                consignment.consumed.toString(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

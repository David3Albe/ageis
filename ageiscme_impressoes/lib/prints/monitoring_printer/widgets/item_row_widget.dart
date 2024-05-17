import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ItemRowWidget extends StatelessWidget {
  final MonitoringPrintDTO dto;

  ItemRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'ITEM: (${dto.itemCod!}) ' + dto.itemName!,
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

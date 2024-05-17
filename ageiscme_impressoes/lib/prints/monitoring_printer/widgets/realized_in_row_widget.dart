import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class RealizedInRowWidget extends StatelessWidget {
  final MonitoringPrintDTO dto;

  RealizedInRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm:ss');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'REALIZADO EM: ' + format.format(dto.dataAtual),
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class InstituitionRowWidget extends StatelessWidget {
  final MonitoringPrintDTO dto;

  InstituitionRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            dto.companyName,
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

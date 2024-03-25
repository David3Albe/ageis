import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class InstituitionRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;

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

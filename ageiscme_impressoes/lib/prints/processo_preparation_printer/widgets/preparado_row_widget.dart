import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class PreparadoRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;

  PreparadoRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    DateFormat formato = DateFormat('dd/MM/yyyy HH:mm:ss');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'PREPARADO EM: ' + formato.format(dto.actualTime),
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

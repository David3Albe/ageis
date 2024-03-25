import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class UserRowWidget extends StatelessWidget {
  final ProcessoPreparationPrintDTO dto;

  UserRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    String user =
        dto.userName + (dto.userDoc == null ? '' : ' - ${dto.userDoc}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'OP.: ' + user,
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            'Lote',
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

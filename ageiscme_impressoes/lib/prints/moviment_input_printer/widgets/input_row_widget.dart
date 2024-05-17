import 'package:ageiscme_impressoes/dto/moviment_input/moviment_input_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class InputRowWidget extends StatelessWidget {
  final MovimentInputPrintDTO dto;

  InputRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            dto.inputName,
            style: const TextStyle(
              fontSize: 8,
            ),
          ),
        ),
      ],
    );
  }
}

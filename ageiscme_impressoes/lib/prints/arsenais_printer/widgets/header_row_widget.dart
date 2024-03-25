import 'package:ageiscme_impressoes/dto/arsenais_print/arsenais_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderRowWidget extends StatelessWidget {
  HeaderRowWidget({required this.dto});

  final ArsenaisPrintDTO dto;

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                dto.companyName,
                  style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Arsenais da Instituição',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
        ),
      ],
    );
  }
}

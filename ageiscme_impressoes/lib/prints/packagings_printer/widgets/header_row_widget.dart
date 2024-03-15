import 'package:ageiscme_impressoes/dto/packagings_print/packagings_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class HeaderRowWidget extends StatelessWidget {
  HeaderRowWidget({required this.dto});

  final PackagingsPrintDTO dto;

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
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Preparo - Tipos de Emabalagem',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
        ),
      ],
    );
  }
}

import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ItemRowWidget extends StatelessWidget {
  final EstoqueItemPrintDTO dto;

  ItemRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              dto.codBarra,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10)),
          Expanded(
            flex: 4,
            child: Text(
              dto.nome,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

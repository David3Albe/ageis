import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_item_print/estoque_kit_item_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class KitItemRowWidget extends StatelessWidget {
  final EstoqueKitItemPrintDTO dto;

  KitItemRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Padding(padding: const EdgeInsets.only(left: 10)),
          Expanded(
            flex: 4,
            child: Text(
              '${dto.codBarra} - ${dto.nome}',
              style: TextStyle(
                fontSize: 10,
                decoration:
                    dto.riscado == true ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

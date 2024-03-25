import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_consignado_print/estoque_item_consignado_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ItemConsignadoRowWidget extends StatelessWidget {
  final EstoqueItemConsignadoPrintDTO dto;

  ItemConsignadoRowWidget({required this.dto});

  @override
  Widget build(Context context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              dto.cod,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10)),
          Expanded(
            flex: 4,
            child: Text(
              '${dto.nome} Qtde: ${dto.quantidade} Qtde Conf.: _____',
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

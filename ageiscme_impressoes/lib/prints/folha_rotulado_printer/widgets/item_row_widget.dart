import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_item_print/folha_rotulado_item_print_dto.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ItemRowWidget extends StatelessWidget {
  ItemRowWidget({
    required this.item,
  });

  final FolhaRotuladoItemPrintDTO item;

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ITEM: ${item.nomeItem}',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 3)),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'PROP.: ${item.nomeProprietario}',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.idEtiqueta,
                style: const TextStyle(fontSize: 8),
              ),
              Padding(padding: const EdgeInsets.only(left: 20)),
              BarcodeWidget(
                data: item.idEtiqueta,
                barcode: Barcode.dataMatrix(),
                height: 15,
                width: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

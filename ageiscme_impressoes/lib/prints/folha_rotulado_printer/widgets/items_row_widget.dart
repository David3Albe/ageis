import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_item_print/folha_rotulado_item_print_dto.dart';
import 'package:ageiscme_impressoes/prints/folha_rotulado_printer/widgets/item_row_widget.dart';
import 'package:dependencias_comuns/printing_exports.dart';

class ItemsRowWidget extends StatelessWidget {
  ItemsRowWidget({
    required this.itemOne,
    this.itemTwo,
    this.itemThree,
  });

  final FolhaRotuladoItemPrintDTO itemOne;
  final FolhaRotuladoItemPrintDTO? itemTwo;
  final FolhaRotuladoItemPrintDTO? itemThree;

  @override
  Widget build(Context context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
        ),
        Divider(thickness: 1.2),
        Padding(
          padding: const EdgeInsets.only(top: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ItemRowWidget(item: itemOne),
            ),
            Expanded(
              child:
                  itemTwo != null ? ItemRowWidget(item: itemTwo!) : SizedBox(),
            ),
            Expanded(
              child:
                  itemThree != null ? ItemRowWidget(item: itemThree!) : SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}

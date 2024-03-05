import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_items/processo_page_tree_view_item_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewItemsWidget extends StatelessWidget {
  ProcessoPageTreeViewItemsWidget({required this.itens});

  final List<ItemProcessoModel>? itens;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Column(
        children: getItems(),
      ),
    );
  }

  List<Widget> getItems() {
    List<Widget> widgets = [];
    if (itens == null) return widgets;
    for (ItemProcessoModel item in itens!) {
      widgets.add(
        Wrap(
          children: [
            ProcessoPageTreeViewItemWidget(item: item),
          ],
        ),
      );
    }
    return widgets;
  }
}

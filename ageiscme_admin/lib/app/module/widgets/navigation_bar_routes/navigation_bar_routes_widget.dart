import 'package:ageiscme_data/services/item_menu/item_menu_service.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_extensions.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/cubits/route/current_route/current_route_cubit.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class NavigationBarRoutesWidget extends StatelessWidget {
  const NavigationBarRoutesWidget({Key? key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentRouteCubit, String>(
      builder: (context, currentRoute) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: getRoutes(currentRoute),
        );
      },
    );
  }

  List<Widget> getRoutes(String currentRoute) {
    List<Widget> widgets = [];
    List<ItemMenuModel> itens = ItemMenuService()
        .getItems({}, ignorarDireitos: true)
        .getLastLevels()
        .where(
          (element) => element.route == currentRoute.replaceAll('/admin', ''),
        )
        .toList();

    if (itens.isEmpty) return widgets;
    ItemMenuModel item = itens.first;
    ItemMenuModel? itemPai = item.getFather();
    List<ItemMenuModel> itensRota = [];
    itensRota.add(item);
    while (itemPai != null) {
      itensRota.add(itemPai);
      itemPai = itemPai.getFather();
    }
    Iterable<ItemMenuModel> itensReversed = itensRota.reversed;
    for (ItemMenuModel rota in itensReversed) {
      TextStyle textStyle = const TextStyle(color: Cores.corRota);
      if (rota != itensReversed.last) {
        textStyle = const TextStyle(color: Cores.corRotaPai);
        rota.text = rota.text + ' > ';
      }
      widgets.add(
        Text(
          rota.text,
          style: textStyle,
        ),
      );
    }

    return widgets;
  }
}

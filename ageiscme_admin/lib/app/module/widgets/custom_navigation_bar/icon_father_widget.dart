import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:flutter/material.dart';

class IconFatherWidget extends StatelessWidget {
  const IconFatherWidget(this.item);
  final ItemMenuModel item;
  @override
  Widget build(BuildContext context) {
    if (item.getChildrens().isEmpty) return Container();
    if (item.expandido) {
      return const Icon(Icons.arrow_drop_up);
    } else {
      return const Icon(Icons.arrow_drop_down);
    }
  }
}

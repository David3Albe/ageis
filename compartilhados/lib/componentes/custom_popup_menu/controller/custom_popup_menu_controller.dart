import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuController {
  List<PopupMenuItem> convertModelToItems(
    List<CustomPopupItemModel> items,
    BuildContext context,
  ) =>
      items
          .map(
            (item) => PopupMenuItem(
              child: Text(item.text),
              onTap: item.onTap,
            ),
          )
          .toList();
}

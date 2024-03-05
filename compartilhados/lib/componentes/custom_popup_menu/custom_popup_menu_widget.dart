import 'package:compartilhados/componentes/custom_popup_menu/controller/custom_popup_menu_controller.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuWidget extends StatelessWidget {
  CustomPopupMenuWidget({required this.items});
  final List<CustomPopupItemModel> items;

  @override
  Widget build(BuildContext context) {
    CustomPopupMenuController controller = CustomPopupMenuController();
    List<PopupMenuItem> menuItems =
        controller.convertModelToItems(items, context);
    return PopupMenuButton(
      tooltip: 'Ações extras',
      itemBuilder: (ctx) => menuItems,
    );
  }
}

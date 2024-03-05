import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/icon_expandable_navigation_bar_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/item_menu_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_navigation_bar/user_avatar_widget.dart';
import 'package:ageiscme_models/models/item_menu/item_menu_model.dart';
import 'package:flutter/material.dart';

class MenuItemsWidget extends StatelessWidget {
  MenuItemsWidget({
    required this.expanded,
    required this.toogleExpand,
    required this.items,
  });
  final bool expanded;
  final void Function() toogleExpand;
  final List<ItemMenuModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatarWidget(expanded),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(width: 1, color: Colors.grey),
                  bottom: index == items.indexOf(items.last)
                      ? const BorderSide(width: 1, color: Colors.grey)
                      : BorderSide.none,
                ),
              ),
              child: ItemMenuWidget(
                items[index],
                expanded,
              ),
            ),
          ),
        ),
        IconExpandableNavigationBarWidget(expanded, toogleExpand),
      ],
    );
  }
}

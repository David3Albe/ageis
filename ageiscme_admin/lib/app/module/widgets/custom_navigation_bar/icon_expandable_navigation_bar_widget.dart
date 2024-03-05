import 'package:flutter/material.dart';

class IconExpandableNavigationBarWidget extends StatelessWidget {
  const IconExpandableNavigationBarWidget(this.expanded, this.onExpand);
  final Function() onExpand;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onExpand,
            child: expanded
                ? const Icon(Icons.arrow_back)
                : const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({this.onLogout, Key? key});

  final void Function()? onLogout;

  double getIconSize(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 26;
    } else if (height > 900) {
      return 24;
    } else if (height > 800) {
      return 22;
    } else if (height > 700) {
      return 20;
    } else if (height > 600) {
      return 18;
    } else if (height > 500) {
      return 16;
    } else if (height > 400) {
      return 14;
    }
    return 12;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconSize = getIconSize(size);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: 'Sair',
            child: InkWell(
              onTap: () {
                if (onLogout != null) onLogout!();
                NavigatorService.navigateToModuleSelection();
              },
              child: Icon(Icons.logout, size: iconSize),
            ),
          ),
        ],
      ),
    );
  }
}

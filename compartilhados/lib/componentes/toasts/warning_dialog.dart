import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class WarningUtils {
  static void showWarningDialog(
    BuildContext? context,
    String warning,
  ) async {
    late OverlayEntry overlayEntry;
    Size size = MediaQuery.of(ToastUtils.routerOutletContext ?? context!).size;
    overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.4),
        width: size.width,
        height: size.height,
        child: Center(
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: _WarningWidget(
              overlay: overlayEntry,
              warning: warning,
            ),
          ),
        ),
      ),
    );
    Overlay.of(ToastUtils.routerOutletContext ?? context!).insert(overlayEntry);
  }
}

class _WarningWidget extends StatelessWidget {
  const _WarningWidget({
    required this.warning,
    required this.overlay,
  });
  final String warning;
  final OverlayEntry overlay;
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 2.25;
    return Container(
      width: size,
      height: size,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Cores.corFundoIconeWarning,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: CloseButtonWidget(
                              backgroundColor:
                                  const Color.fromARGB(118, 225, 157, 0),
                              onPressed: overlay.remove,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Icon(
                            Symbols.warning,
                            size: 120,
                            color: Cores.corIconeToastWarning,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aviso',
                  style: Fontes.getRoboto(
                    fontSize: 32,
                    cor: Cores.corIconeToastWarning,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: SelectableText(
                  warning,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

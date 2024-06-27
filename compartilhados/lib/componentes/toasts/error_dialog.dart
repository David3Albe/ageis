import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ErrorUtils {
  static void showOneErrorDialog(
    BuildContext? context,
    String error,
  ) async {
    showErrorDialog(context, [error]);
  }

  static void showErrorDialog(
    BuildContext? context,
    List<String> errors,
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
            content: _ErrorWidget(
              overlay: overlayEntry,
              errors: errors,
            ),
          ),
        ),
      ),
    );
    Overlay.of(ToastUtils.routerOutletContext ?? context!).insert(overlayEntry);
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.errors,
    required this.overlay,
  });
  final List<String> errors;
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
              color: Cores.corFundoIconeErro,
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
                              backgroundColor: Cores.corFundoIconeErro,
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
                            Symbols.error,
                            size: 120,
                            color: Cores.corIconeErro,
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
                  'Erro',
                  style:
                      Fontes.getRoboto(fontSize: 32, cor: Cores.corFonteErro),
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
                  '${getErroFromErrors(errors)}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getErroFromErrors(List<String> erros) => erros.join('\n');
}

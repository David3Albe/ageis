import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class WarningUtils {
  static Future<bool> showWarningDialog(
    BuildContext context,
    String warning,
  ) async {
    bool? confirmacao = await showDialog<bool>(
      barrierDismissible: false,
      context: ToastUtils.routerOutletContext == null
          ? context
          : ToastUtils.routerOutletContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: _WarningWidget(
            warning: warning,
          ),
        );
      },
    );
    if (confirmacao == null) confirmacao = false;
    return confirmacao;
  }
}

class _WarningWidget extends StatelessWidget {
  const _WarningWidget({
    required this.warning,
  });
  final String warning;
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
                              backgroundColor: const Color.fromARGB(118, 225, 157, 0),
                              onPressed: () => Navigator.of(context).pop(false),
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
                child: Text(
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

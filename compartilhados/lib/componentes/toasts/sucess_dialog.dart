import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class SucessUtils {
  static Future<bool> showSucessDialog(
    BuildContext context,
    String message,
  ) async {
    bool? confirmacao = await showDialog<bool>(
      barrierDismissible: false,
      context: ToastUtils.routerOutletContext == null
          ? context
          : ToastUtils.routerOutletContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: _SucessWidget(
            message: message,
          ),
        );
      },
    );
    if (confirmacao == null) confirmacao = false;
    return confirmacao;
  }
}

class _SucessWidget extends StatelessWidget {
  const _SucessWidget({
    required this.message,
  });
  final String message;
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
              color: Colors.lightGreen.shade300,
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
                              backgroundColor: Colors.lightGreen.shade400,
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Icon(
                            Symbols.check_circle,
                            size: 120,
                            color: Colors.lightGreen.shade600,
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
                  'Sucesso',
                  style: Fontes.getRoboto(
                    fontSize: 32,
                    cor: Colors.lightGreen.shade600,
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
                  message,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

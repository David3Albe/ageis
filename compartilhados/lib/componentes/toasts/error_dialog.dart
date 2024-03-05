import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ErrorUtils {
  static Future<bool> showErrorDialog(
    BuildContext context,
    List<String> errors,
  ) async {
    bool? confirmacao = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: _ErrorWidget(
            errors: errors,
          ),
        );
      },
    );
    if (confirmacao == null) confirmacao = false;
    return confirmacao;
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.errors,
  });
  final List<String> errors;
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
                child: Text(
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

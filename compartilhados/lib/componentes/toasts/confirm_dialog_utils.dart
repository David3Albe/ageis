import 'dart:async';

import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConfirmDialogUtils {
  static Future<bool> showConfirmAlertDialog(
    BuildContext context,
    String message,
  ) async {
    bool? confirmacao = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: AlertConfirmDialog(
            realContext: context,
            message: message,
          ),
        );
      },
    );
    if (confirmacao == null) confirmacao = false;
    return confirmacao;
  }
}

class AlertConfirmDialog extends StatelessWidget {
  final String message;
  final BuildContext realContext;
  const AlertConfirmDialog({
    required this.message,
    required this.realContext,
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.6,
          height: size.height * 0.6,
          constraints: const BoxConstraints(
            minHeight: 400,
            maxHeight: 600,
            maxWidth: 600,
            minWidth: 400,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Icon(
                    Symbols.warning,
                    fill: 1,
                    color: Color.fromARGB(255, 255, 235, 59),
                    size: 48,
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TitleWidget(
                      text: 'Confirmação',
                    ),
                  ),
                  const Spacer(),
                  CloseButtonWidget(
                    onPressed: () => Navigator.of(realContext).pop(false),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        message,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  ConfirmButtonWidget(
                    onPressed: () => Navigator.of(realContext).pop(true),
                  ),
                  const Spacer(),
                  CancelButtonUnfilledWidget(
                    onPressed: () => Navigator.of(realContext).pop(false),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

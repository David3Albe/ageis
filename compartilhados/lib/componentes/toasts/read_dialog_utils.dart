import 'dart:async';

import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ReadDialogUtils {
  Future<(bool, String)> showReadDialog(
    BuildContext context,
    String message,
  ) async {
    (bool?, String?)? confirmacao = await showDialog<(bool?, String?)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: _AlertReadDialog(
            realContext: context,
            message: message,
          ),
        );
      },
    );
    return (confirmacao == null
        ? (false, '')
        : (confirmacao.$1 ?? false, confirmacao.$2 ?? ''));
  }
}

class _AlertReadDialog extends StatefulWidget {
  final String message;
  final BuildContext realContext;

  const _AlertReadDialog({
    required this.message,
    required this.realContext,
  });

  @override
  State<_AlertReadDialog> createState() => _AlertReadDialogState();
}

class _AlertReadDialogState extends State<_AlertReadDialog> {
  late String barCode;
  DateTime? lastTimeRead;
  late FocusNode _textNode;
  @override
  void initState() {
    barCode = '';
    _textNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coletorHelper =
        ColetoresHelper(onEnter: (str) => _handleKey(str, context));
    Size size = MediaQuery.of(context).size;
    return RawKeyboardListener(
      onKey: coletorHelper.handleKey,
      autofocus: true,
      focusNode: _textNode,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.6,
            constraints: BoxConstraints(
              maxHeight: size.height * 0.25,
              maxWidth: 450,
              minWidth: 350,
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
                        text: 'Leitura',
                      ),
                    ),
                    const Spacer(),
                    CloseButtonWidget(
                      onPressed: () =>
                          Navigator.of(widget.realContext).pop((false, '')),
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
                          widget.message,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    CancelButtonUnfilledWidget(
                      onPressed: () =>
                          Navigator.of(widget.realContext).pop((false, '')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleKey(String barCode, BuildContext context) {
    Navigator.of(context).pop((true, barCode));
  }
}

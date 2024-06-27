import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConfirmDialogUtils {
  static void showConfirmAlertDialog({
    required BuildContext context,
    required String message,
    required void Function() onConfirm,
    void Function()? onCancel,
  }) async {
    late OverlayEntry overlayEntry;
    Size size = MediaQuery.of(context).size;
    overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.4),
        width: size.width,
        height: size.height,
        child: Center(
          child: AlertDialog(
            content: AlertConfirmDialog(
              realContext: context,
              message: message,
              onCancel: () =>
                  onWidgetCancel(entry: overlayEntry, onCancel: onCancel),
              onConfirm: () =>
                  onWidgetConfirm(entry: overlayEntry, onConfirm: onConfirm),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  static void onWidgetCancel({
    required OverlayEntry entry,
    required void Function()? onCancel,
  }) {
    entry.remove();
    if (onCancel != null) onCancel();
  }

  static void onWidgetConfirm({
    required OverlayEntry entry,
    required void Function() onConfirm,
  }) {
    entry.remove();
    onConfirm();
  }
}

class AlertConfirmDialog extends StatelessWidget {
  final String message;
  final BuildContext realContext;
  final void Function() onConfirm;
  final void Function() onCancel;
  const AlertConfirmDialog({
    required this.message,
    required this.realContext,
    required this.onCancel,
    required this.onConfirm,
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          width: size.width * 0.4,
          height: size.height * 0.3,
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
                    onPressed: onCancel,
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
                    onPressed: onConfirm,
                  ),
                  const Spacer(),
                  CancelButtonUnfilledWidget(
                    onPressed: onCancel,
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

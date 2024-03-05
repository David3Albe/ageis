import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class FilterDialogWidget extends StatelessWidget {
  const FilterDialogWidget({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Expanded(
            child: TitleWidget(
              text: 'Filtros',
            ),
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: child,
      ),
      actions: [
        ConfirmButtonWidget(
          onPressed: () => {
            Navigator.of(context).pop(true),
          },
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => {
            Navigator.of(context).pop(false),
          },
        ),
      ],
    );
  }
}

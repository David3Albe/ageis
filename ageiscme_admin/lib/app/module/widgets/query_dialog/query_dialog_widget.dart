import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:flutter/material.dart';

class QueryDialogWidget extends StatelessWidget {
  const QueryDialogWidget({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              CloseButtonWidget(
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

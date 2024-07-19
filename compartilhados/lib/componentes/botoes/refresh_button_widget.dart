import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/forms/form_controller.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:flutter/material.dart';

class RefreshButtonWidget extends StatefulWidget {
  const RefreshButtonWidget({
    required this.onPressed,
    this.readonly = false,
    this.form,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final FormController? form;

  @override
  State<RefreshButtonWidget> createState() => _RefreshButtonWidgetState();
}

class _RefreshButtonWidgetState extends State<RefreshButtonWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Atualizar',
      child: Material(
        child: InkWell(
          onTap: handleClick,
          onHover: (bool hover) => setState(() => hovered = hover),
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            width: ButtonConstraints.SMALL_ICON_BUTTON_WIDTH,
            height: ButtonConstraints.SMALL_BUTTON_HEIGHT,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: hovered
                  ? Colors.blue.shade900
                  : Colors.blue.shade800,
            ),
            child: const Icon(
              Icons.refresh,
              size: 18,
              color: Cores.corIconeBranco,
            ),
          ),
        ),
      ),
    );
  }

  void handleClick() {
    if (widget.onPressed == null) return;
    EasyThrottle.throttle(
      'refresh-button',
      const Duration(seconds: 3),
      widget.onPressed!,
    );
  }
}

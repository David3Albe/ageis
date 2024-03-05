import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class CloseButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  const CloseButtonWidget({
    Key? key,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CloseButtonWidget> createState() => _CloseButtonWidgetState();
}

class _CloseButtonWidgetState extends State<CloseButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Fechar',
      child: Material(
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (bool hover) => setState(() => hovered = hover),
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            width: 30,
            color: widget.backgroundColor,
            height: 30,
            child: Icon(
              Icons.close,
              size: 30,
              color: hovered
                  ? const Color.fromARGB(255, 80, 50, 50)
                  : Cores.corBotaoCloseHover,
            ),
          ),
        ),
      ),
    );
  }
}

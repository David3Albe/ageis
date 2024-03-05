import 'package:compartilhados/cores/cores.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class RemoveButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  const RemoveButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RemoveButtonWidget> createState() => _RemoveButtonWidgetState();
}

class _RemoveButtonWidgetState extends State<RemoveButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Remover',
      child: Material(
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (bool hover) => setState(() => hovered = hover),
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: hovered
                  ? Cores.corBotaoRemoverSelecionado
                  : Cores.corBotaoRemover,
            ),
            child: const Icon(
              Symbols.close,
              size: 15,
              color: Cores.corIconeBranco,
            ),
          ),
        ),
      ),
    );
  }
}

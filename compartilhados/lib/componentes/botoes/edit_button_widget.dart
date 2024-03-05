import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class EditButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  const EditButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<EditButtonWidget> createState() => _EditButtonWidgetState();
}

class _EditButtonWidgetState extends State<EditButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Editar',
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
                  ? Cores.corBotaoEditarSelecionado
                  : Cores.corBotaoEditar,
            ),
            child: const Icon(
              Icons.edit,
              size: 15,
              color: Cores.corIconeBranco,
            ),
          ),
        ),
      ),
    );
  }
}

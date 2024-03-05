import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class ListButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData icon;

  const ListButtonWidget({
    Key? key,
    this.onPressed,
    this.text,
    required this.icon,
  }) : super(key: key);

  @override
  State<ListButtonWidget> createState() => _ListButtonWidgetState();
}

class _ListButtonWidgetState extends State<ListButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.text,
      child: Material(
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (bool hover) => setState(() => hovered = hover),
          mouseCursor: SystemMouseCursors.click,
          child: Container(
            width: 30,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: hovered
                  ? Cores.corBotaoEditarSelecionado
                  : Cores.corBotaoEditar,
            ),
            child: Icon(
              widget.icon,
              size: 25,
              color: Cores.corIconeBranco,
            ),
          ),
        ),
      ),
    );
  }
}

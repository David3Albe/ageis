import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class LinkButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  const LinkButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<LinkButtonWidget> createState() => _LinkButtonWidgetState();
}

class _LinkButtonWidgetState extends State<LinkButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Acessar',
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
              color: hovered ? Cores.corBotaoLink : Cores.corBotaoLinkHover,
            ),
            child: const Icon(
              Icons.link,
              size: 15,
              color: Cores.corIconeBranco,
            ),
          ),
        ),
      ),
    );
  }
}

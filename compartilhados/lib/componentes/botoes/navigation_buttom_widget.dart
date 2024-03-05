import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/forms/form_controller.dart';
import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatefulWidget {
  const NavigationButtonWidget({
    required this.onPressed,
    this.readonly = false,
    this.form,
    this.placeholder,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final FormController? form;
  final String? placeholder;

  @override
  State<NavigationButtonWidget> createState() => _NavigationButtonWidgetState();
}

class _NavigationButtonWidgetState extends State<NavigationButtonWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: !hovered
          ? ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoArquivo,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoArquivoHover,
            ),
      onPressed: !valid || widget.readonly ? null : widget.onPressed,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 30,
          maxWidth: 160,
        ),
        width: size.width * .2,
        height: size.height * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.placeholder!,
              style: const TextStyle(color: Cores.corTextoBranco),
            ),
          ],
        ),
      ),
    );
  }
}

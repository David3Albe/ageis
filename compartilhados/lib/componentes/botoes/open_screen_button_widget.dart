import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class OpenScreenButtonWidget extends StatefulWidget {
  const OpenScreenButtonWidget({
    required this.onPressed,
    this.text,
    this.icon,
    this.readonly = false,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final String? text;
  final IconData? icon;

  @override
  State<OpenScreenButtonWidget> createState() => _OpenScreenButtonState();
}

class _OpenScreenButtonState extends State<OpenScreenButtonWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
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
              backgroundColor: Cores.corBotaoAbrirTela,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoAbrirTelaHover,
            ),
      onPressed: !valid || widget.readonly ? null : widget.onPressed,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12.0 * scaleW,
          vertical: 6.0 * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon != null
                ? Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Icon(
                        widget.icon,
                        size: 20,
                        color: Cores.corIconeBranco,
                      ),
                    ),
                  )
                : const SizedBox(),
            widget.text != null
                ? Flexible(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.text!,
                        style: TextStyle(
                          color: Cores.corTextoBranco,
                          fontSize:
                              HelperFunctions.calculaFontSize(context, 16),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

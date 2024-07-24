import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class PrintButtonWidget extends StatefulWidget {
  const PrintButtonWidget({
    required this.onPressed,
    this.elevation = 5,
    this.paddingHeight = 6,
    this.paddingWidth = 8,
    this.readonly = false,
    Key? key,
  });

  final double elevation;
  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;
  final bool readonly;

  @override
  State<PrintButtonWidget> createState() => _PrintButtonWidgetState();
}

class _PrintButtonWidgetState extends State<PrintButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonConstraints.SMALL_BUTTON_WIDTH,
      height: ButtonConstraints.SMALL_BUTTON_HEIGHT,
      child: ElevatedButton(
        onHover: (bool hover) => setState(() => hovered = hover),
        style: hovered
            ? ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: hovered
                      ? BorderSide.none
                      : const BorderSide(
                          color: Cores.corBotaoImprimir, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                backgroundColor: Cores.corBotaoImprimir,
              )
            : ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: hovered
                      ? BorderSide.none
                      : const BorderSide(
                          color: Cores.corBotaoImprimir, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                backgroundColor: Colors.white,
              ),
        onPressed: widget.readonly ? null : widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(
                  Icons.print,
                  color:
                      hovered ? Cores.corIconeBranco : Cores.corBotaoImprimir,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Imprimir',
                  style: TextStyle(
                    color:
                        hovered ? Cores.corTextoBranco : Cores.corBotaoImprimir,
                    fontSize: HelperFunctions.calculaFontSize(
                      context,
                      14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class PrintButtonWidget extends StatefulWidget {
  const PrintButtonWidget({
    required this.onPressed,
    this.elevation = 5,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
  });

  final double elevation;
  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;

  @override
  State<PrintButtonWidget> createState() => _PrintButtonWidgetState();
}

class _PrintButtonWidgetState extends State<PrintButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return Material(
      type: MaterialType.transparency,
      elevation: widget.elevation,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (bool hover) => setState(() => hovered = hover),
        mouseCursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Cores.corBotaoImprimir),
            color: hovered ? Cores.corBotaoImprimir : Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.paddingWidth * scaleW,
              vertical: widget.paddingHeight * scaleH,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Icon(
                      Icons.print,
                      size: 20,
                      color: hovered
                          ? Cores.corIconeBranco
                          : Cores.corBotaoImprimir,
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Imprimir',
                      style: Fontes.getRoboto(
                        cor: hovered
                            ? Cores.corTextoBranco
                            : Cores.corBotaoImprimir,
                        fontSize: HelperFunctions.calculaFontSize(context, 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

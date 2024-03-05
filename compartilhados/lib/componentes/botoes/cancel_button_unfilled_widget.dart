import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CancelButtonUnfilledWidget extends StatefulWidget {
  const CancelButtonUnfilledWidget({
    required this.onPressed,
    this.elevation = 3,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
  });

  final double elevation;
  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;

  @override
  State<CancelButtonUnfilledWidget> createState() =>
      _CancelButtonUnfilledWidgetState();
}

class _CancelButtonUnfilledWidgetState
    extends State<CancelButtonUnfilledWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    double scaleH = MediaQuery.of(context).size.height / 1080;
    double scaleW = MediaQuery.of(context).size.width / 1920;
    return Material(
      elevation: widget.elevation,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (bool hover) => setState(() => hovered = hover),
        mouseCursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Cores.corBotaoCancelar),
            color: hovered ? Cores.corBotaoCancelar : Colors.white,
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
                      Icons.close,
                      size: 20,
                      color: hovered
                          ? Cores.corIconeBranco
                          : Cores.corBotaoCancelar,
                    ),
                  ),
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Cancelar',
                      style: Fontes.getRoboto(
                        cor: hovered
                            ? Cores.corTextoBranco
                            : Cores.corBotaoCancelar,
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

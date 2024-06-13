import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class CleanButtonWidget extends StatefulWidget {
  const CleanButtonWidget({
    required this.onPressed,
    this.isVisible = true,
    this.elevation,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
  });

  final void Function()? onPressed;
  final bool isVisible;
  final double? elevation;
  final double paddingHeight;
  final double paddingWidth;

  @override
  State<CleanButtonWidget> createState() => _CleanButtonWidgetState();
}

class _CleanButtonWidgetState extends State<CleanButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) {
      return const SizedBox.shrink();
    }
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
              elevation: widget.elevation,
              backgroundColor: Cores.corBotaoLimpar,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              elevation: widget.elevation,
              backgroundColor: Cores.corBotaoLimparHovered,
            ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: widget.paddingWidth * scaleW,
          vertical: widget.paddingHeight * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Symbols.undo,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Limpar',
                  style: TextStyle(
                    color: Cores.corTextoBranco,
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

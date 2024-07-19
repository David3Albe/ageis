import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConfirmButtonWidget extends StatefulWidget {
  const ConfirmButtonWidget({
    required this.onPressed,
    this.elevation,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
  });

  final double? elevation;
  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;

  @override
  State<ConfirmButtonWidget> createState() => _ConfirmButtonWidgetState();
}

class _ConfirmButtonWidgetState extends State<ConfirmButtonWidget> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ButtonConstraints.SMALL_BUTTON_WIDTH,
      height: ButtonConstraints.SMALL_BUTTON_HEIGHT,
      child: ElevatedButton(
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
                backgroundColor: Cores.corBotaoVerde,
              )
            : ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                elevation: widget.elevation,
                backgroundColor: Cores.corBotaoVerdeSelecionado,
              ),
        onPressed: handleClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: const Icon(
                  Symbols.done,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: Text(
                  'Confirmar',
                  style: TextStyle(
                    color: Cores.corTextoBranco,
                    fontSize: HelperFunctions.calculaFontSize(context, 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleClick() {
    if (widget.onPressed == null) return;
    EasyThrottle.throttle(
      'confirm-button',
      const Duration(seconds: 3),
      widget.onPressed!,
    );
  }
}

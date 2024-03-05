import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class InsertButtonWidget extends StatefulWidget {
  const InsertButtonWidget({
    required this.onPressed,
    this.paddingHeight = 6,
    this.paddingWidth = 12,
    Key? key,
  });

  final double paddingHeight;
  final double paddingWidth;
  final void Function()? onPressed;

  @override
  State<InsertButtonWidget> createState() => _InsertButtonWidgetState();
}

class _InsertButtonWidgetState extends State<InsertButtonWidget> {
  bool hovered = false;
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
              backgroundColor: Cores.corBotaoLimpar,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Cores.corBotaoLimparHovered,
            ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
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
                fit: BoxFit.fitWidth,
                child: Icon(
                  Symbols.add,
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
                  'Inserir',
                  style: TextStyle(
                    color: Cores.corTextoBranco,
                    fontSize: HelperFunctions.calculaFontSize(context, 16),
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

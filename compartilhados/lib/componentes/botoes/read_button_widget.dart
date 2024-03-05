import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ReadButtonWidget extends StatefulWidget {
  const ReadButtonWidget({required this.onPressed, Key? key});

  final void Function()? onPressed;

  @override
  State<ReadButtonWidget> createState() => _ReadButtonWidgetState();
}

class _ReadButtonWidgetState extends State<ReadButtonWidget> {
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
              backgroundColor: Colors.lightBlue.shade400,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Colors.lightBlue.shade600,
            ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0 * scaleW,
          vertical: 6 * scaleH,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: const Icon(
                  Symbols.search_check,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Leitura',
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

import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class DeleteImageButtonWidget extends StatefulWidget {
  const DeleteImageButtonWidget({
    required this.onPressed,
    this.readonly = false,
    required this.placeholder,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final String placeholder;

  @override
  State<DeleteImageButtonWidget> createState() =>
      _DeleteImageButtonWidgetState();
}

class _DeleteImageButtonWidgetState extends State<DeleteImageButtonWidget> {
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
            const Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Symbols.delete,
                  color: Cores.corIconeBranco,
                  size: 20,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.placeholder,
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

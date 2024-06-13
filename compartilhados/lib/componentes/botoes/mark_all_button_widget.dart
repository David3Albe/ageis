import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/forms/form_controller.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class MarkAllButtonWidget extends StatefulWidget {
  const MarkAllButtonWidget({
    required this.onPressed,
    this.readonly = false,
    this.form,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final FormController? form;

  @override
  State<MarkAllButtonWidget> createState() => _MarkAllButtonWidgetState();
}

class _MarkAllButtonWidgetState extends State<MarkAllButtonWidget> {
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
              backgroundColor: Colors.blue.shade300,
            )
          : ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              backgroundColor: Colors.blue.shade500,
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
                fit: BoxFit.fitWidth,
                child: Icon(
                  Symbols.check,
                  size: 20,
                  color: Cores.corIconeBranco,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Marcar Todos',
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
}

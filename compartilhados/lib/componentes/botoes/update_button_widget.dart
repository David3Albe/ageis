import 'package:compartilhados/componentes/botoes/button_constraints.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/forms/form_controller.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/easy_debounce_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class UpdateButtonWidget extends StatefulWidget {
  const UpdateButtonWidget({
    required this.onPressed,
    this.readonly = false,
    this.form,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final FormController? form;

  @override
  State<UpdateButtonWidget> createState() => _UpdateButtonWidgetState();
}

class _UpdateButtonWidgetState extends State<UpdateButtonWidget> {
  bool hovered = false;
  bool valid = true;

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
                backgroundColor: Cores.corBotaoSalvar,
              )
            : ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                backgroundColor: Cores.corBotaoSalvarHovered,
              ),
        onPressed: !valid || widget.readonly ? null : handleClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(
                  Symbols.save,
                  size: 20,
                  color: Cores.corIconeBranco,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Alterar',
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
      'save-button',
      const Duration(seconds: 4),
      widget.onPressed!,
    );
  }
}

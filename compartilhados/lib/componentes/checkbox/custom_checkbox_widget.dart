import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCheckboxWidget extends StatefulWidget {
  const CustomCheckboxWidget({
    Key? key,
    this.checked,
    this.text = '',
    this.readonly = false,
    this.onClick,
    this.align = MainAxisAlignment.center,
  }) : super(key: key);

  final bool? checked;
  final void Function(bool value)? onClick;
  final bool readonly;
  final String text;
  final MainAxisAlignment align;

  @override
  State<CustomCheckboxWidget> createState() =>
      _CustomCheckboxWidgetState(checked: checked, onClick: onClick);
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  _CustomCheckboxWidgetState({required this.checked, required this.onClick});
  bool? checked;
  void Function(bool value)? onClick;

  @override
  Widget build(BuildContext context) {
    if (checked == null) {
      checked = false;
    }
    return Row(
      mainAxisAlignment: widget.align,
      children: [
        Transform.scale(
          scale: HelperFunctions.calculaTransformSize(context),
          child: Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: checked,
            onChanged: widget.readonly
                ? null
                : (bool? value) => setState(() {
                      checked = value;
                      if (onClick != null) {
                        bool valor = false;
                        if (value != null) valor = value;
                        onClick!(valor);
                      }
                    }),
          ),
        ),
        InkWell(
          onTap: () => {
            setState(() {
              bool toogleChecked = false;
              if (checked != null) toogleChecked = !checked!;
              if (onClick != null) {
                checked = toogleChecked;
                onClick!(toogleChecked);
              }
            }),
          },
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: HelperFunctions.calculaFontSize(context, 16),
            ),
          ),
        ),
      ],
    );
  }
}

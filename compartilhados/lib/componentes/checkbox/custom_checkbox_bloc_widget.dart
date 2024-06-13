import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomCheckboxBlocWidget extends StatefulWidget {
  const CustomCheckboxBlocWidget({
    Key? key,
    required this.checked,
    this.text = '',
    this.readonly = false,
    this.onClick,
    this.align = MainAxisAlignment.center,
    this.fontSize,
  }) : super(key: key);

  final bool checked;
  final void Function(bool value)? onClick;
  final bool readonly;
  final String text;
  final MainAxisAlignment align;
  final double? fontSize;

  @override
  State<CustomCheckboxBlocWidget> createState() =>
      _CustomCheckboxBlocWidgetState(
        onClick: onClick,
      );
}

class _CustomCheckboxBlocWidgetState extends State<CustomCheckboxBlocWidget> {
  _CustomCheckboxBlocWidgetState({required this.onClick});
  void Function(bool value)? onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.align,
      children: [
        Transform.scale(
          scale: HelperFunctions.calculaTransformSize(context),
          child: Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: widget.checked,
            onChanged: widget.readonly
                ? null
                : (bool? value) => setState(() {
                      if (onClick != null) {
                        bool valor = false;
                        if (value != null) valor = value;
                        onClick!(valor);
                      }
                    }),
          ),
        ),
        InkWell(
          onTap: widget.readonly
              ? null
              : () {
                  setState(() {
                    bool toogleChecked = !widget.checked;
                    if (onClick != null) {
                      onClick!(toogleChecked);
                    }
                  });
                },
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize ??
                  HelperFunctions.calculaFontSize(context, 14),
            ),
          ),
        ),
      ],
    );
  }
}

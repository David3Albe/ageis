import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

typedef SetValueBuilder = void Function(
  BuildContext context,
  void Function(bool) setValueWidget,
);

class CustomCheckboxWidget extends StatefulWidget {
  const CustomCheckboxWidget({
    Key? key,
    this.checked,
    this.text = '',
    this.readonly = false,
    this.onClick,
    this.align = MainAxisAlignment.center,
    this.fontSize,
    this.setValue,
  }) : super(key: key);

  final bool? checked;
  final void Function(bool value)? onClick;
  final bool readonly;
  final String text;
  final MainAxisAlignment align;
  final double? fontSize;
  final SetValueBuilder? setValue;

  @override
  State<CustomCheckboxWidget> createState() => _CustomCheckboxWidgetState(
        checked: checked,
        onClick: onClick,
      );
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  _CustomCheckboxWidgetState({required this.checked, required this.onClick});
  bool? checked;
  void Function(bool value)? onClick;

  void setValueFunction(bool? value) {
    setState(() {
      checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.setValue?.call(
      context,
      setValueFunction,
    );
    if (checked == null) checked = false;
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
          onTap: widget.readonly
              ? null
              : () {
                  setState(() {
                    bool toogleChecked = false;
                    if (checked != null) toogleChecked = !checked!;
                    if (onClick != null) {
                      checked = toogleChecked;
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

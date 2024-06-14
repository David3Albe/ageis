import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class ReactiveColorPickerFormWidget extends StatelessWidget {
  const ReactiveColorPickerFormWidget({
    required this.controlName,
    required this.placeholder,
    this.validationMessages,
    super.key,
  });

  final Map<String, String Function(Object)>? validationMessages;
  final String controlName;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return ReactiveColorPicker<Color>(
      formControlName: controlName,
      decoration: InputDecoration(
        labelText: placeholder,
      ),
      validationMessages: validationMessages,
    );
  }
}

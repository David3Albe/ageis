import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class ReactiveStringAreaFormWidget extends StatelessWidget {
  const ReactiveStringAreaFormWidget({
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
    return ReactiveTextField<String>(
      formControlName: controlName,
      keyboardType: TextInputType.multiline,
      maxLines: 7,
      minLines: 1,
      decoration: InputDecoration(
        label: Text(
          placeholder,
          style: Fontes.getRoboto(
            letterSpacing: 0,
            fontSize: HelperFunctions.calculaFontSize(context, 14),
            cor: Cores.corPlaceholderTextField,
          ),
        ),
      ),
      validationMessages: validationMessages,
    );
  }
}

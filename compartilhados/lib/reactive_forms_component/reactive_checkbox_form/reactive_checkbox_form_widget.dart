import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class ReactiveCheckboxFormWidget extends StatelessWidget {
  const ReactiveCheckboxFormWidget({
    required this.controlName,
    required this.placeholder,
    super.key,
  });

  final String controlName;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReactiveCheckbox(
          formControlName: controlName,
          checkColor: Colors.white,
          activeColor: Colors.blue,
        ),
        ReactiveFormConsumer(builder: (context, form, child) {
          return InkWell(
            onTap: () => toogleCheckbox(form),
            child: Text(
              placeholder,
              style: Fontes.getRoboto(
                letterSpacing: 0,
                fontSize: HelperFunctions.calculaFontSize(context, 14),
                cor: Cores.corPlaceholderTextField,
              ),
            ),
          );
        }),
      ],
    );
  }

  void toogleCheckbox(FormGroup form) {
    bool value = form.controls[controlName]!.value as bool;
    form.controls[controlName]!.value = !value;
  }
}

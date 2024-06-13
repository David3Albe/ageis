import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/reactive_forms_component/reactive_string_area_form/reactive_string_area_form_widget.dart';
import 'package:dependencias_comuns/reactive_forms_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeFrmLiberacaoPageWidget extends StatelessWidget {
  AnormalidadeFrmLiberacaoPageWidget({
    super.key,
  });

  final FormGroup form = fb.group(
    <String, Object>{
      'observacaoLiberacao': [
        '',
        Validators.required,
        Validators.maxLength(400),
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double scalePadding = size.width / 1920;
    return Container(
      constraints: const BoxConstraints(
        minWidth: 400,
        maxWidth: 1500,
        minHeight: 400,
        maxHeight: 1200,
      ),
      height: size.height * .4,
      width: size.width * .4,
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return Column(
            children: <Widget>[
              Row(
                children: [
                  const TitleWidget(
                    text: 'Liberação de Anormalidade',
                  ),
                  const Spacer(),
                  CloseButtonWidget(
                    onPressed: () => Navigator.of(context).pop((false, null)),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    ReactiveStringAreaFormWidget(
                      controlName: 'observacaoLiberacao',
                      placeholder: 'Observação da Liberação',
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Obrigatório',
                        ValidationMessage.maxLength: (_) =>
                            'Número de letras permitidas são no máximo 400',
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      runSpacing: 16 * scalePadding,
                      spacing: 16 * scalePadding,
                      alignment: WrapAlignment.end,
                      children: [
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                            return ConfirmButtonWidget(
                              onPressed: form.valid
                                  ? () => _confirmar(context: context)
                                  : null,
                            );
                          },
                        ),
                        CancelButtonUnfilledWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, null)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmar({
    required BuildContext context,
  }) {
    Navigator.of(context).pop(
      (true, form.controls['observacaoLiberacao']!.value as String?),
    );
  }
}

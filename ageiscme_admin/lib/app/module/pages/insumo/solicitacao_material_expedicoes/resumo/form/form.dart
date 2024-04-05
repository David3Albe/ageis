import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/form_state.dart'
    as form;
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  Form({required this.cod, Key? key});

  final int cod;
  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  void initState() {
    context.read<FormCubit>().carregar(widget.cod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    form.FormState formState = context.watch<FormCubit>().state;
    return AlertDialog(
      title: Row(
        children: [
          Expanded(
            child: TitleWidget(
              text:
                  'Solicitação de Material: ${formState.response?.solicitacao?.cod ?? ''}',
            ),
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.55,
        child: Builder(
          builder: (context) {
            if (formState.loading == true) {
              return const Center(child: LoadingWidget());
            }
            return Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    TextFieldStringWidget(
                      placeholder: 'Solicitante',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        CancelButtonUnfilledWidget(
          onPressed: () => {
            Navigator.of(context).pop(false),
          },
        ),
      ],
    );
  }
}

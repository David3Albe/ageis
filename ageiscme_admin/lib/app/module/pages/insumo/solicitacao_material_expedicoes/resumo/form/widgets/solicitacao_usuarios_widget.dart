import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/form_state.dart' as form;
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class SolicitacaoUsuariosWidget extends StatelessWidget {
  const SolicitacaoUsuariosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    form.FormState formState = context.watch<FormCubit>().state;
    SolicitacaoMaterialModel? solicitacao = formState.response?.solicitacao;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFieldStringWidget(
                placeholder: 'Solicitante',
                readOnly: true,
                initialValue: formState.response
                        ?.usuarios[solicitacao?.codUsuarioSolicitante]?.nome ??
                    '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 50)),
            Expanded(
              child: DatePickerWidget(
                formato: DateFormat('dd/MM/yyyy HH:mm'),
                placeholder: 'Data Solicitação',
                readOnly: true,
                initialValue: solicitacao?.dataHoraSolicitacao,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldStringWidget(
                placeholder: 'Autorizador',
                readOnly: true,
                initialValue: formState.response
                        ?.usuarios[solicitacao?.codUsuarioAutorizacao]?.nome ??
                    '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 50)),
            Expanded(
              child: DatePickerWidget(
                formato: DateFormat('dd/MM/yyyy HH:mm'),
                placeholder: 'Data Autorização',
                readOnly: true,
                initialValue: solicitacao?.dataHoraAutorizacao,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldStringWidget(
                placeholder: 'Entrega',
                readOnly: true,
                initialValue: formState.response
                        ?.usuarios[solicitacao?.codUsuarioEntrega]?.nome ??
                    '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 50)),
            Expanded(
              child: DatePickerWidget(
                formato: DateFormat('dd/MM/yyyy HH:mm'),
                placeholder: 'Data Entrega',
                readOnly: true,
                initialValue: solicitacao?.dataHoraEntrega,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldStringWidget(
                placeholder: 'Recebimento',
                readOnly: true,
                initialValue: formState.response
                        ?.usuarios[solicitacao?.codUsuarioRecebimento]?.nome ??
                    '',
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 50)),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

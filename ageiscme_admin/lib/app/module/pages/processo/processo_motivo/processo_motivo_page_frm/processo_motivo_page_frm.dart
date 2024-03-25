import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_frm/processo_motivo_page_frm_state.dart';
import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoMotivoPageFrm extends StatefulWidget {
  const ProcessoMotivoPageFrm({
    Key? key,
    required this.processoMotivo,
  }) : super(key: key);

  final ProcessoMotivoModel processoMotivo;

  @override
  State<ProcessoMotivoPageFrm> createState() =>
      _ProcessoMotivoPageFrmState(processoMotivo: processoMotivo);
}

class _ProcessoMotivoPageFrmState extends State<ProcessoMotivoPageFrm> {
  _ProcessoMotivoPageFrmState({required this.processoMotivo});
  late String titulo;
  ProcessoMotivoModel processoMotivo;
  late final ProcessoMotivoPageFrmCubit cubit = ProcessoMotivoPageFrmCubit(
    processoMotivoModel: processoMotivo,
    service: ProcessoMotivoService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      processoMotivo.descricao = txtDescricao.text;
    },
  );

  @override
  void initState() {
    txtDescricao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtDescricao.text = processoMotivo.descricao.toString();
    titulo = 'Cadastro de Motivo de Processo';
    if (processoMotivo.cod != 0) {
      titulo =
          'Edição de Motivo de Processo: ${processoMotivo.cod} - ${processoMotivo.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ProcessoMotivoPageFrmCubit, ProcessoMotivoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            minWidth: size.width * .5,
            minHeight: size.height * .5,
            maxHeight: size.height * .8,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: TitleWidget(
                          text: titulo,
                        ),
                      ),
                      const Spacer(),
                      CloseButtonWidget(
                        onPressed: () => Navigator.of(context).pop((false, '')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDescricao,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: processoMotivo.ativo,
                          onClick: (value) => processoMotivo.ativo = value,
                          text: 'Ativo',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: processoMotivo.arsenal,
                          onClick: (value) => processoMotivo.arsenal = value,
                          text: 'Arsenal',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: processoMotivo.preparo,
                          onClick: (value) => processoMotivo.preparo = value,
                          text: 'Preparo',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: processoMotivo.recepcaoExpurgo,
                          onClick: (value) =>
                              processoMotivo.recepcaoExpurgo = value,
                          text: 'Recepção / Expurgo',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: processoMotivo.bloquearPreparo,
                          onClick: (value) =>
                              processoMotivo.bloquearPreparo = value,
                          text: 'Bloquear Preparo',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SaveButtonWidget(
                          onPressed: () => {salvar()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CleanButtonWidget(
                          onPressed: () => {
                            setState(() {
                              processoMotivo = ProcessoMotivoModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: () =>
                              {Navigator.of(context).pop((false, ''))},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void salvar() {
    if (!txtDescricao.valid) return;
    cubit.save(processoMotivo);
  }
}

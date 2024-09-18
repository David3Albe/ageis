import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_frm/processo_motivo_page_frm_state.dart';
import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoMotivoPageFrm extends StatefulWidget {
  const ProcessoMotivoPageFrm({
    Key? key,
    required this.processoMotivo,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ProcessoMotivoModel processoMotivo;
  final void Function(String) onSaved;
  final void Function() onCancel;

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
    placeholder: 'Descrição *',
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
    return BlocBuilder<ProcessoMotivoPageFrmCubit, ProcessoMotivoPageFrmState>(
      bloc: cubit,
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
                  const Spacer(),
                  Row(
                    children: [
                      if (processoMotivo.cod != null && processoMotivo.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Motivo de Processo ${processoMotivo.cod}',
                              child: HistoricoPage(
                                pk: processoMotivo.cod!,
                                termo: 'PROCESSO_MOTIVO',
                              ),
                              context: context,
                            ),
                          ],
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly: processoMotivo.cod == 0 ||
                              processoMotivo.cod == null,
                          onPressed: () => {alterarExistente()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: InsertButtonWidget(
                          onPressed: () => {inserirNovo()},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: CleanButtonWidget(
                          onPressed: () => {
                            setState(() {
                              processoMotivo = ProcessoMotivoModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: CancelButtonUnfilledWidget(
                          onPressed: widget.onCancel,
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

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    if (!txtDescricao.valid) return;
    cubit.save(
      novo ? processoMotivo.copyWith(cod: 0, tstamp: null) : processoMotivo,
      widget.onSaved,
    );
  }
}

import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/acao_ocorrencia/acao_ocorrencia_page_frm/acao_ocorrencia_page_frm_state.dart';
import 'package:ageiscme_data/services/acao_ocorrencia/acao_ocorrencia_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AcaoOcorrenciaPageFrm extends StatefulWidget {
  const AcaoOcorrenciaPageFrm({
    Key? key,
    required this.acaoOcorrencia,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final AcaoOcorrenciaModel acaoOcorrencia;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<AcaoOcorrenciaPageFrm> createState() =>
      _AcaoOcorrenciaPageFrmState(acaoOcorrencia: acaoOcorrencia);
}

class _AcaoOcorrenciaPageFrmState extends State<AcaoOcorrenciaPageFrm> {
  _AcaoOcorrenciaPageFrmState({required this.acaoOcorrencia});
  late String titulo;
  AcaoOcorrenciaModel acaoOcorrencia;
  late final AcaoOcorrenciaPageFrmCubit cubit = AcaoOcorrenciaPageFrmCubit(
    acaoOcorrenciaModel: acaoOcorrencia,
    service: AcaoOcorrenciaService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      acaoOcorrencia.descricao = txtDescricao.text;
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
    txtDescricao.text = acaoOcorrencia.descricao.toString();
    titulo = 'Cadastro de Ação de Ocorrência';
    if (acaoOcorrencia.cod != 0) {
      titulo =
          'Edição da Ação de Ocorrência: ${acaoOcorrencia.cod} - ${acaoOcorrencia.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AcaoOcorrenciaPageFrmCubit, AcaoOcorrenciaPageFrmState>(
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
                          checked: acaoOcorrencia.ativo,
                          onClick: (value) => acaoOcorrencia.ativo = value,
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
                          checked: acaoOcorrencia.acaoCorretiva,
                          onClick: (value) =>
                              acaoOcorrencia.acaoCorretiva = value,
                          text: 'Ação Corretiva (SIM)',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: acaoOcorrencia.motivoNaoCorrecao,
                          onClick: (value) =>
                              acaoOcorrencia.motivoNaoCorrecao = value,
                          text: 'Motivo de Não Correção',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (acaoOcorrencia.cod != null && acaoOcorrencia.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: acaoOcorrencia.cod!,
                                termo: 'ACAO_OCOORRENCIA',
                              ),
                              context: context,
                            ),
                          ],
                        ),
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
                              acaoOcorrencia = AcaoOcorrenciaModel.empty();
                            }),
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
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

  void salvar() {
    if (!txtDescricao.valid) return;
    cubit.save(acaoOcorrencia, widget.onSaved);
  }
}

import 'package:ageiscme_admin/app/module/pages/biblioteca/gestao_contrato/gestao_contrato_page_frm/gestao_contrato_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/gestao_contrato/gestao_contrato_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GestaoContratoPageFrm extends StatefulWidget {
  const GestaoContratoPageFrm({
    Key? key,
    required this.gestaoContrato,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final GestaoContratoModel gestaoContrato;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<GestaoContratoPageFrm> createState() =>
      _GestaoContratoPageFrmState(gestaoContrato: gestaoContrato);
}

class _GestaoContratoPageFrmState extends State<GestaoContratoPageFrm> {
  _GestaoContratoPageFrmState({required this.gestaoContrato});
  late String titulo;
  GestaoContratoModel gestaoContrato;
  late final GestaoContratoPageFrmCubit cubit = GestaoContratoPageFrmCubit(
    gestaoContratoModel: gestaoContrato,
    service: GestaoContratoService(),
  );
  late final TextFieldStringWidget txtNomeLink = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      gestaoContrato.descricao = txtNomeLink.text;
    },
  );
  late final TextFieldStringWidget txtLink = TextFieldStringWidget(
    placeholder: 'Link *',
    onChanged: (String? str) {
      gestaoContrato.link = txtLink.text;
    },
  );

  @override
  void initState() {
    txtNomeLink.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 500) {
        return 'Pode ter no máximo 500 caracteres';
      }
      return '';
    });

    txtLink.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 500) {
        return 'Pode te rno máximo 500 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNomeLink.text = gestaoContrato.descricao.toString();
    txtLink.text = gestaoContrato.link.toString();
    titulo = 'Cadastro de Gestão de Documento';
    if (gestaoContrato.cod != 0) {
      titulo =
          'Edição de Gestão de Documento: ${gestaoContrato.cod} - ${gestaoContrato.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<GestaoContratoPageFrmCubit, GestaoContratoPageFrmState>(
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
                    child: txtNomeLink,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtLink,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (gestaoContrato.cod != null &&
                              gestaoContrato.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Gestão Contrato ${gestaoContrato.cod!}',
                              child: HistoricoPage(
                                pk: gestaoContrato.cod!,
                                termo: 'GESTAO_CONTRATO',
                              ),
                              context: context,
                            ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly: gestaoContrato.cod == 0 ||
                              gestaoContrato.cod == null,
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
                              gestaoContrato = GestaoContratoModel.empty();
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
    bool nomeValid = txtNomeLink.valid;
    bool linkValid = txtLink.valid;
    if (!nomeValid || !linkValid) return;
    cubit.save(
      novo ? gestaoContrato.copyWith(cod: 0, tstamp: null) : gestaoContrato,
      widget.onSaved,
    );
  }
}

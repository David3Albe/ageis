import 'package:ageiscme_admin/app/module/pages/colaborador/tipo_afastamento/tipo_afastamento_page_frm/tipo_afastamento_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/tipo_afastamento/tipo_afastamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TipoAfastamentoPageFrm extends StatefulWidget {
  const TipoAfastamentoPageFrm({
    Key? key,
    required this.tipoAfastamento,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final TipoAfastamentoModel tipoAfastamento;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<TipoAfastamentoPageFrm> createState() =>
      _TipoAfastamentoPageFrmState(tipoAfastamento: tipoAfastamento);
}

class _TipoAfastamentoPageFrmState extends State<TipoAfastamentoPageFrm> {
  _TipoAfastamentoPageFrmState({required this.tipoAfastamento});
  late String titulo;
  TipoAfastamentoModel tipoAfastamento;
  late final TipoAfastamentoPageFrmCubit cubit = TipoAfastamentoPageFrmCubit(
    tipoAfastamentoModel: tipoAfastamento,
    service: TipoAfastamentoService(),
  );
  late final TextFieldStringWidget txtMotivo = TextFieldStringWidget(
    placeholder: 'Motivo *',
    onChanged: (String? str) {
      tipoAfastamento.motivo = txtMotivo.text;
    },
  );
  late final TextFieldNumberWidget txtDiasConcedido = TextFieldNumberWidget(
    placeholder: 'Dias Concedidos *',
    onChanged: (String? str) {
      tipoAfastamento.diasConcedido =
          str == null || str.isEmpty ? null : int.parse(txtDiasConcedido.text);
    },
  );

  @override
  void initState() {
    txtMotivo.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrgatório';
      } else if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    txtDiasConcedido.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtMotivo.text = tipoAfastamento.motivo.toString();
    if (tipoAfastamento.diasConcedido == null) {
      txtDiasConcedido.text = '';
    } else {
      txtDiasConcedido.text = tipoAfastamento.diasConcedido.toString();
    }

    titulo = 'Cadastro de Tipo de Afastamento';
    if (tipoAfastamento.cod != 0) {
      titulo =
          'Edição de Tipo de Afastamento: ${tipoAfastamento.cod} - ${tipoAfastamento.motivo}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TipoAfastamentoPageFrmCubit,
        TipoAfastamentoPageFrmState>(
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
                    child: txtMotivo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDiasConcedido,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: tipoAfastamento.cat!,
                          onClick: (value) => tipoAfastamento.cat = value,
                          text: 'Abertura Obrigatória de CAT',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (tipoAfastamento.cod != null &&
                              tipoAfastamento.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                                  title: 'Tipo Afastamento ${tipoAfastamento.cod}',
                              child: HistoricoPage(
                                pk: tipoAfastamento.cod!,
                                termo: 'TIPO_AFASTAMENTO',
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
                              tipoAfastamento = TipoAfastamentoModel.empty();
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
    bool motivoValid = txtMotivo.valid;
    bool diasConcedidoValid = txtDiasConcedido.valid;
    if (!motivoValid || !diasConcedidoValid) return;
    cubit.save(tipoAfastamento, widget.onSaved);
  }
}

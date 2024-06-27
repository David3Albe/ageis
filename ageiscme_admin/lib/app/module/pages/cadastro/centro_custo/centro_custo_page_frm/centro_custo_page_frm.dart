import 'package:ageiscme_admin/app/module/pages/cadastro/centro_custo/centro_custo_page_frm/centro_custo_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CentroCustoPageFrm extends StatefulWidget {
  const CentroCustoPageFrm({
    Key? key,
    required this.centroCusto,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final CentroCustoModel centroCusto;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<CentroCustoPageFrm> createState() =>
      _CentroCustoPageFrmState(centroCusto: centroCusto);
}

class _CentroCustoPageFrmState extends State<CentroCustoPageFrm> {
  _CentroCustoPageFrmState({required this.centroCusto});
  late String titulo;
  CentroCustoModel centroCusto;
  late final CentroCustoPageFrmCubit cubit = CentroCustoPageFrmCubit(
    centroCustoModel: centroCusto,
    service: CentroCustoService(),
  );
  late final TextFieldStringWidget txtCentroCusto = TextFieldStringWidget(
    placeholder: 'Centro Custo *',
    onChanged: (String? str) {
      centroCusto.centroCusto = txtCentroCusto.text;
    },
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      centroCusto.descricao = txtDescricao.text;
    },
  );

  @override
  void initState() {
    txtCentroCusto.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 20) {
        return 'Pode ter no máximo 20 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 60) {
        return 'Pode ter no máximo 60 caracters';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtCentroCusto.text = centroCusto.centroCusto.toString();
    txtDescricao.text = centroCusto.descricao.toString();
    titulo = 'Cadastro de Centro de Custo';
    if (centroCusto.cod != 0) {
      titulo =
          'Edição de Centro de Custo: ${centroCusto.cod} - ${centroCusto.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    double scalePadding = size.width / 1920;
    return BlocBuilder<CentroCustoPageFrmCubit, CentroCustoPageFrmState>(
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
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: txtCentroCusto,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: txtDescricao,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0 * scalePadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomCheckboxWidget(
                            align: MainAxisAlignment.start,
                            checked: centroCusto.ativo,
                            onClick: (value) => centroCusto.ativo = value,
                            text: 'Ativo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPopupMenuWidget(
                        items: [
                          if (centroCusto.cod != null && centroCusto.cod != 0)
                            CustomPopupItemHistoryModel.getHistoryItem(
                              child: HistoricoPage(
                                pk: centroCusto.cod!,
                                termo: 'CENTRO_CUSTO',
                              ),
                              context: context,
                            ),
                        ],
                      ),
                      Expanded(
                        child: Wrap(
                          runSpacing: 16 * scalePadding,
                          spacing: 16 * scalePadding,
                          alignment: WrapAlignment.end,
                          children: [
                            SaveButtonWidget(
                              onPressed: () => {salvar()},
                            ),
                            CleanButtonWidget(
                              onPressed: () => {
                                setState(() {
                                  centroCusto = CentroCustoModel.empty();
                                }),
                              },
                            ),
                            CancelButtonUnfilledWidget(
                              onPressed: widget.onCancel,
                            ),
                          ],
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
    bool centroCustoValid = txtCentroCusto.valid;
    bool descricaoValid = txtDescricao.valid;
    if (!centroCustoValid || !descricaoValid) return;

    cubit.save(centroCusto, widget.onSaved);
  }
}

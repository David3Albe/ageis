import 'package:ageiscme_admin/app/module/pages/cadastro/centro_custo/centro_custo_page_frm/centro_custo_page_frm_state.dart';
import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
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

class CentroCustoPageFrm extends StatefulWidget {
  const CentroCustoPageFrm({
    Key? key,
    required this.centroCusto,
  }) : super(key: key);

  final CentroCustoModel centroCusto;

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
    placeholder: 'Centro Custo',
    onChanged: (String? str) {
      centroCusto.centroCusto = txtCentroCusto.text;
    },
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
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
    return BlocListener<CentroCustoPageFrmCubit, CentroCustoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<CentroCustoPageFrmCubit, CentroCustoPageFrmState>(
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
                        const Spacer(),
                        CloseButtonWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, '')),
                        ),
                      ],
                    ),
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
                                onPressed: () =>
                                    {Navigator.of(context).pop((false, ''))},
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
      ),
    );
  }

  void salvar() {
    if (!txtCentroCusto.valid || !txtDescricao.valid) return;

    cubit.save(centroCusto);
  }
}

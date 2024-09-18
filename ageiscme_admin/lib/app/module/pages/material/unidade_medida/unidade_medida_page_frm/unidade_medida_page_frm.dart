import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page_frm/unidade_medida_page_frm_state.dart';
import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
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

class UnidadeMedidaPageFrm extends StatefulWidget {
  const UnidadeMedidaPageFrm({
    Key? key,
    required this.unidadeMedida,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final UnidadeMedidaModel unidadeMedida;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<UnidadeMedidaPageFrm> createState() =>
      _UnidadeMedidaPageFrmState(unidadeMedida: unidadeMedida);
}

class _UnidadeMedidaPageFrmState extends State<UnidadeMedidaPageFrm> {
  _UnidadeMedidaPageFrmState({required this.unidadeMedida});
  late String titulo;
  UnidadeMedidaModel unidadeMedida;
  late final UnidadeMedidaPageFrmCubit cubit = UnidadeMedidaPageFrmCubit(
    unidadeMedidaModel: unidadeMedida,
    service: UnidadeMedidaService(),
  );
  late final TextFieldStringWidget txtUnidadeMedida = TextFieldStringWidget(
    placeholder: 'Unidade Medida *',
    onChanged: (String? str) {
      unidadeMedida.nome = txtUnidadeMedida.text;
    },
  );

  @override
  void initState() {
    txtUnidadeMedida.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtUnidadeMedida.text = unidadeMedida.nome.toString();
    titulo = 'Cadastro de Unidade de Medida';
    if (unidadeMedida.cod != 0) {
      titulo =
          'Edição de Unidade de Medida: ${unidadeMedida.cod} - ${unidadeMedida.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UnidadeMedidaPageFrmCubit, UnidadeMedidaPageFrmState>(
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
                    child: txtUnidadeMedida,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (unidadeMedida.cod != null && unidadeMedida.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Unidade Medida ${unidadeMedida.cod}',
                              child: HistoricoPage(
                                pk: unidadeMedida.cod!,
                                termo: 'UNIDADE_MEDIDA',
                              ),
                              context: context,
                            ),
                          ],
                        ),
                      const Spacer(),
                           Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly:
                              unidadeMedida.cod == 0 || unidadeMedida.cod == null,
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
                              unidadeMedida = UnidadeMedidaModel.empty();
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
    if (!txtUnidadeMedida.valid) return;
    cubit.save(
      novo ? unidadeMedida.copyWith(cod: 0, tstamp: null) : unidadeMedida,
      widget.onSaved,
    );
  }
}

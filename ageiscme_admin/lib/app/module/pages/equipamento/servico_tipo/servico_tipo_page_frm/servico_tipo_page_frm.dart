import 'package:ageiscme_admin/app/module/pages/equipamento/servico_tipo/servico_tipo_page_frm/servico_tipo_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
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

class ServicoTipoPageFrm extends StatefulWidget {
  const ServicoTipoPageFrm({
    Key? key,
    required this.servicoTipo,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ServicoTipoModel servicoTipo;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<ServicoTipoPageFrm> createState() =>
      _ServicoTipoPageFrmState(servicoTipo: servicoTipo);
}

class _ServicoTipoPageFrmState extends State<ServicoTipoPageFrm> {
  _ServicoTipoPageFrmState({required this.servicoTipo});
  late String titulo;
  ServicoTipoModel servicoTipo;
  late final ServicoTipoPageFrmCubit cubit = ServicoTipoPageFrmCubit(
    servicoTipoModel: servicoTipo,
    service: ServicoTipoService(),
  );
  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      servicoTipo.nome = txtNome.text;
    },
  );

  @override
  void initState() {
    txtNome.addValidator((String str) {
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
    txtNome.text = servicoTipo.nome.toString();
    titulo = 'Cadastro de Tipo de Serviço';
    if (servicoTipo.cod != 0) {
      titulo =
          'Edição de Tipo de Serviço: ${servicoTipo.cod} - ${servicoTipo.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ServicoTipoPageFrmCubit, ServicoTipoPageFrmState>(
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
                    child: txtNome,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: servicoTipo.ativo,
                          onClick: (value) => servicoTipo.ativo = value,
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
                          checked: servicoTipo.monitoramento,
                          onClick: (value) => servicoTipo.monitoramento = value,
                          text: 'Monitoramento',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      children: [
                        CustomCheckboxWidget(
                          checked: servicoTipo.servicosEquipamentos,
                          onClick: (value) =>
                              servicoTipo.servicosEquipamentos = value,
                          text: 'Serviço em Equipamentos',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (servicoTipo.cod != null && servicoTipo.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Tipo de Serviço ${servicoTipo.cod}',
                              child: HistoricoPage(
                                pk: servicoTipo.cod!,
                                termo: 'SERVICO_TIPO',
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
                              servicoTipo = ServicoTipoModel.empty();
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
    if (!txtNome.valid) return;
    cubit.save(servicoTipo, widget.onSaved);
  }
}

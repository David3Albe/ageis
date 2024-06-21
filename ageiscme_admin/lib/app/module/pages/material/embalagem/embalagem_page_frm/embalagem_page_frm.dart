import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/embalagem/embalagem_page_frm/embalagem_page_frm_state.dart';
import 'package:ageiscme_data/services/embalagem/embalagem_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EmbalagemPageFrm extends StatefulWidget {
  const EmbalagemPageFrm({
    Key? key,
    required this.embalagem,
  }) : super(key: key);

  final EmbalagemModel embalagem;

  @override
  State<EmbalagemPageFrm> createState() =>
      _EmbalagemPageFrmState(embalagem: embalagem);
}

class _EmbalagemPageFrmState extends State<EmbalagemPageFrm> {
  _EmbalagemPageFrmState({required this.embalagem});
  late String titulo;
  EmbalagemModel embalagem;
  late final EmbalagemPageFrmCubit cubit = EmbalagemPageFrmCubit(
    embalagemModel: embalagem,
    service: EmbalagemService(),
  );
  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome da embalagem *',
    onChanged: (String? str) {
      embalagem.nome = txtNome.text;
    },
  );
  late final TextFieldNumberWidget txtValidadeProcesso = TextFieldNumberWidget(
    placeholder: 'Validade do processo *',
    onChanged: (String? str) {
      embalagem.validadeProcessosDias = int.parse(txtValidadeProcesso.text);
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

    txtValidadeProcesso.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str == '0') {
        return 'Validade do processo não pode ser zero';
      } else if (str.length > 10) {
        return 'Pode ser até no máximo 9999999999';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNome.text = embalagem.nome.toString();
    if (embalagem.validadeProcessosDias == null) {
      txtValidadeProcesso.text = '';
    } else {
      txtValidadeProcesso.text = embalagem.validadeProcessosDias.toString();
    }
    titulo = 'Cadastro de Embalagem';
    if (embalagem.cod != 0) {
      titulo = 'Edição de Embalagem: ${embalagem.cod} - ${embalagem.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<EmbalagemPageFrmCubit, EmbalagemPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<EmbalagemPageFrmCubit, EmbalagemPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            constraints: const BoxConstraints(
              maxHeight: 1000,
              minHeight: 400,
              maxWidth: 1200,
              minWidth: 600,
            ),
            height: size.height * .6,
            width: size.width * .6,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        TitleWidget(
                          text: titulo,
                        ),
                        const Spacer(),
                        CloseButtonWidget(
                          onPressed: () =>
                              Navigator.of(context).pop((false, '')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtNome,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: txtValidadeProcesso,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: embalagem.ativo,
                            onClick: (value) => embalagem.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (embalagem.cod != null && embalagem.cod != 0)
                          CustomPopupMenuWidget(
                            items: [
                              CustomPopupItemHistoryModel.getHistoryItem(
                                child: HistoricoPage(
                                  pk: embalagem.cod!,
                                  termo: 'EMBALAGEM',
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
                                embalagem = EmbalagemModel.empty();
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
      ),
    );
  }

  void salvar() {
    bool nomeValid = txtNome.valid;
    bool validadeProcessoValid = txtValidadeProcesso.valid;
    if (!nomeValid || !validadeProcessoValid) return;
    cubit.save(embalagem);
  }
}

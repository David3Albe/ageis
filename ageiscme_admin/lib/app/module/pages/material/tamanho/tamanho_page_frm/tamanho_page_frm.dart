import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page_frm/tamanho_page_frm_state.dart';
import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
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

class TamanhoPageFrm extends StatefulWidget {
  const TamanhoPageFrm({
    Key? key,
    required this.tamanho,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final TamanhoModel tamanho;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<TamanhoPageFrm> createState() => _TamanhoPageFrmState(tamanho: tamanho);
}

class _TamanhoPageFrmState extends State<TamanhoPageFrm> {
  _TamanhoPageFrmState({required this.tamanho});
  late String titulo;
  TamanhoModel tamanho;
  late final TamanhoPageFrmCubit cubit = TamanhoPageFrmCubit(
    tamanhoModel: tamanho,
    service: TamanhoService(),
  );
  late final TextFieldStringWidget txtSigla = TextFieldStringWidget(
    placeholder: 'Sigla *',
    onChanged: (String? str) {
      tamanho.sigla = txtSigla.text;
    },
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      tamanho.descricao = txtDescricao.text;
    },
  );
  late final TextFieldStringWidget txtReferencial = TextFieldStringWidget(
    placeholder: 'Referencial numérico único do tamanho *',
    onChanged: (String? str) {
      tamanho.referencial = int.parse(txtReferencial.text);
    },
  );

  @override
  void initState() {
    txtSigla.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 5) {
        return 'Pode ter no máximo 5 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.length > 30) {
        return 'Pode ter no máximo 30 caracteres';
      }
      return '';
    });

    txtReferencial.addValidator((String str) {
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
    txtSigla.text = tamanho.sigla.toString();
    txtDescricao.text = tamanho.descricao.toString();
    if (tamanho.referencial == null) {
      txtReferencial.text = '';
    } else {
      txtReferencial.text = tamanho.referencial.toString();
    }
    titulo = 'Cadastro de Tamanho';
    if (tamanho.cod != 0) {
      titulo = 'Edição de Tamanho: ${tamanho.cod} - ${tamanho.sigla}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TamanhoPageFrmCubit, TamanhoPageFrmState>(
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
                    child: txtSigla,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtDescricao,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: txtReferencial,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (tamanho.cod != null && tamanho.cod != 0)
                        CustomPopupMenuWidget(
                          items: [
                            CustomPopupItemHistoryModel.getHistoryItem(
                              title: 'Tamanho ${tamanho.cod}',
                              child: HistoricoPage(
                                pk: tamanho.cod!,
                                termo: 'TAMANHO',
                              ),
                              context: context,
                            ),
                          ],
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: UpdateButtonWidget(
                          readonly: tamanho.cod == 0 || tamanho.cod == null,
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
                              tamanho = TamanhoModel.empty();
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
    bool siglaValid = txtSigla.valid;
    bool descricaoValid = txtDescricao.valid;
    bool referencialValid = txtReferencial.valid;
    if (!siglaValid || !descricaoValid || !referencialValid) return;

    cubit.save(
      novo ? tamanho.copyWith(cod: 0, tstamp: null) : tamanho,
      widget.onSaved,
    );
  }
}

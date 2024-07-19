import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/local_instituicao/local_instituicao_page_frm/local_instituicao_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/local_instituicao/local_instituicao_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class LocalInstituicaoPageFrm extends StatefulWidget {
  const LocalInstituicaoPageFrm({
    Key? key,
    required this.localInstituicao,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final LocalInstituicaoModel localInstituicao;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<LocalInstituicaoPageFrm> createState() =>
      _LocalInstituicaoPageFrmState(localInstituicao: localInstituicao);
}

class _LocalInstituicaoPageFrmState extends State<LocalInstituicaoPageFrm> {
  _LocalInstituicaoPageFrmState({required this.localInstituicao});
  late final CentroCustoCubit centroCustoCubit;
  late String titulo;
  LocalInstituicaoModel localInstituicao;
  late final LocalInstituicaoPageFrmCubit cubit = LocalInstituicaoPageFrmCubit(
    localInstituicaoModel: localInstituicao,
    service: LocalInstituicaoService(),
  );
  late final TextFieldStringWidget txtNomeLocal = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      localInstituicao.nome = txtNomeLocal.text;
    },
  );
  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barras',
    readOnly: true,
    onChanged: (String? str) {
      localInstituicao.codBarra = txtCodBarra.text;
    },
  );
  late final TextFieldStringAreaWidget txtContato = TextFieldStringAreaWidget(
    placeholder: 'Contato *',
    onChanged: (String? str) {
      localInstituicao.contato = txtContato.text;
    },
  );
  late final TextFieldStringWidget txtLocalizacaoFisica = TextFieldStringWidget(
    placeholder: 'Localização Física *',
    onChanged: (String? str) {
      localInstituicao.localizacao = txtLocalizacaoFisica.text;
    },
  );
  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável *',
    onChanged: (String? str) {
      localInstituicao.responsavel = txtResponsavel.text;
    },
  );

  final ScrollController scroll = ScrollController();

  @override
  void initState() {
    centroCustoCubit = CentroCustoCubit();
    centroCustoCubit.loadAll();
    txtNomeLocal.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 150) {
        return 'Pode ter no máximo 150 caracteres';
      }
      return '';
    });

    txtContato.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 150) {
        return 'Pode ter no máximo 150 caracteres';
      }
      return '';
    });

    txtLocalizacaoFisica.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtResponsavel.addValidator((String str) {
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
    txtNomeLocal.text = localInstituicao.nome.toString();
    txtCodBarra.text = localInstituicao.codBarra.toString();
    txtContato.text = localInstituicao.contato.toString();
    txtLocalizacaoFisica.text = localInstituicao.localizacao.toString();
    txtResponsavel.text = localInstituicao.responsavel.toString();
    titulo = 'Cadastro de Local da Instituição';
    if (localInstituicao.cod != 0) {
      titulo =
          'Edição de Local da Instituição: ${localInstituicao.cod} - ${localInstituicao.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LocalInstituicaoPageFrmCubit,
        LocalInstituicaoPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                TitleWidget(
                  text: titulo,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 600,
                          minHeight: 500,
                          maxHeight: 1000,
                          maxWidth: 1200,
                        ),
                        height: size.height * .5,
                        width: size.width * .5,
                        child: SingleChildScrollView(
                          controller: scroll,
                          padding: const EdgeInsets.only(right: 14),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: txtNomeLocal,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: txtCodBarra,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: txtContato,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: txtLocalizacaoFisica,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: txtResponsavel,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: BlocBuilder<CentroCustoCubit,
                                    CentroCustoState>(
                                  bloc: centroCustoCubit,
                                  builder: (context, state) {
                                    if (state.loading) {
                                      return const Center(
                                        child: LoadingWidget(),
                                      );
                                    }
                                    List<CentroCustoModel> centrosCusto =
                                        state.centrosCusto;
                                    centrosCusto.sort(
                                      (a, b) => a.centroCusto!
                                          .compareTo(b.centroCusto!),
                                    );
                                    CentroCustoModel? centroCusto = centrosCusto
                                        .where(
                                          (element) =>
                                              element.cod ==
                                              localInstituicao.codCentroCusto,
                                        )
                                        .firstOrNull;
                                    List<CentroCustoModel> centrosCustoAtivos =
                                        centrosCusto
                                            .where(
                                              (element) =>
                                                  element.ativo == true,
                                            )
                                            .toList();
                                    centrosCustoAtivos.sort(
                                      (a, b) => (a.centroCusto ?? '')
                                          .compareTo(b.centroCusto ?? ''),
                                    );

                                    return DropDownSearchWidget<
                                        CentroCustoModel>(
                                      initialValue: centroCusto,
                                      textFunction: (p0) =>
                                          p0.CentroCustoText(),
                                      sourceList: centrosCusto
                                          .where(
                                            (element) => element.ativo == true,
                                          )
                                          .toList(),
                                      onChanged: (value) => localInstituicao
                                          .codCentroCusto = value?.cod,
                                      placeholder: 'Centro de Custo',
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    CustomCheckboxWidget(
                                      checked: localInstituicao.ativo,
                                      onClick: (value) =>
                                          localInstituicao.ativo = value,
                                      text: 'Ativo',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    CustomCheckboxWidget(
                                      checked: localInstituicao.exigeProntuario,
                                      onClick: (value) => localInstituicao
                                          .exigeProntuario = value,
                                      text: 'Exige Prontuário na Recepção',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    CustomCheckboxWidget(
                                      checked:
                                          localInstituicao.localConferencia,
                                      onClick: (value) => localInstituicao
                                          .localConferencia = value,
                                      text:
                                          'Local Conferência \n(Não atualizar o status do item na etapa de Recepção)',
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 24)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    if (localInstituicao.cod != null &&
                        localInstituicao.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: localInstituicao.cod!,
                          termo: 'LOCAL_INSTITUICAO',
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
                        localInstituicao = LocalInstituicaoModel.empty();
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
        );
      },
    );
  }

  void salvar() {
    bool localValid = txtNomeLocal.valid;
    bool contatoValid = txtContato.valid;
    bool localizacaoFisicaValid = txtLocalizacaoFisica.valid;
    bool responsavelValid = txtResponsavel.valid;

    if (!localValid) {
      scroll.jumpTo(0);
    } else if (!contatoValid) {
      scroll.jumpTo(90);
    } else if (!localizacaoFisicaValid) {
      scroll.jumpTo(140);
    } else if (!responsavelValid) {
      scroll.jumpTo(190);
    }
    if (!localValid ||
        !contatoValid ||
        !localizacaoFisicaValid ||
        !responsavelValid) return;

    cubit.save(localInstituicao, widget.onSaved);
  }
}

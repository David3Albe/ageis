import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/localizacao_arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/arsenal_estoque/arsenal_estoque_page_frm/arsenal_estoque_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/localizacao_arsenal/localizacao_arsenal_page_frm/localizacao_arsenal_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/arsenal/arsenal_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ArsenalEstoquePageFrm extends StatefulWidget {
  const ArsenalEstoquePageFrm({
    Key? key,
    required this.arsenalEstoque,
  }) : super(key: key);

  final ArsenalEstoqueModel arsenalEstoque;

  @override
  State<ArsenalEstoquePageFrm> createState() =>
      _ArsenalEstoquePageFrmState(arsenalEstoque: arsenalEstoque);
}

class _ArsenalEstoquePageFrmState extends State<ArsenalEstoquePageFrm> {
  _ArsenalEstoquePageFrmState({required this.arsenalEstoque});

  late String titulo;
  ArsenalEstoqueModel arsenalEstoque;
  late final LocalInstituicaoCubit localInstituicaoCubit;
  late final LocalizacaoArsenalCubit localizacaoArsenalCubit;

  late final ArsenalEstoquePageFrmCubit cubit = ArsenalEstoquePageFrmCubit(
    arsenalEstoqueModel: arsenalEstoque,
    service: ArsenalEstoqueService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      arsenalEstoque.nome = txtNome.text;
    },
  );

  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barra',
    readOnly: true,
    onChanged: (String? str) {
      arsenalEstoque.codBarra = txtCodBarra.text;
    },
  );

  late final TextFieldStringAreaWidget txtLocalizacoes =
      TextFieldStringAreaWidget(
    placeholder: 'Localizações do Estoque',
    readOnly: true,
  );

  late bool localIsEmpty = false;

  @override
  void initState() {
    localInstituicaoCubit = LocalInstituicaoCubit();
    localInstituicaoCubit.loadAll();
    localizacaoArsenalCubit = LocalizacaoArsenalCubit();
    localizacaoArsenalCubit.loadAll();

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtCodBarra.addValidator((String str) {
      if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = arsenalEstoque.nome.toString();
    txtCodBarra.text = arsenalEstoque.codBarra.toString();

    titulo = 'Cadastro de Arsenal';
    if (arsenalEstoque.cod != 0) {
      titulo =
          'Edição de Arsenal: ${arsenalEstoque.cod} - ${arsenalEstoque.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<ArsenalEstoquePageFrmCubit, ArsenalEstoquePageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child:
          BlocBuilder<ArsenalEstoquePageFrmCubit, ArsenalEstoquePageFrmState>(
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
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtNome,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtCodBarra,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<LocalInstituicaoCubit,
                          LocalInstituicaoState>(
                        bloc: localInstituicaoCubit,
                        builder: (context, locaisState) {
                          if (locaisState.loading) {
                            return const LoadingWidget();
                          }
                          List<LocalInstituicaoModel> locaisInstituicao =
                              locaisState.locaisInstituicoes;

                          locaisInstituicao.sort(
                            (a, b) => a.nome.compareTo(b.nome),
                          );
                          LocalInstituicaoModel? local = locaisInstituicao
                              .where(
                                (element) =>
                                    element.cod == arsenalEstoque.codLocal,
                              )
                              .firstOrNull;
                          return DropDownWidget<LocalInstituicaoModel>(
                            initialValue: local,
                            sourceList: locaisInstituicao
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) =>
                                arsenalEstoque.codLocal = value.cod,
                            placeholder: 'Local',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: arsenalEstoque.ativo,
                            onClick: (value) => arsenalEstoque.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<LocalizacaoArsenalCubit,
                          LocalizacaoArsenalState>(
                        bloc: localizacaoArsenalCubit,
                        builder: (context, localizacoesArsenaisState) {
                          if (localizacoesArsenaisState.loading) {
                            return const LoadingWidget();
                          }
                          List<LocalizacaoArsenalModel> localizacoesArsenais =
                              localizacoesArsenaisState.objs;

                          final local = localizacoesArsenais
                              .where(
                                (element) =>
                                    element.codEstoque == arsenalEstoque.cod,
                              )
                              .toList();

                          if (local.isEmpty) {
                            localIsEmpty = true;
                          }

                          final localizacoesText = local
                              .map((localizacao) => localizacao.local)
                              .join('\n');

                          if (local.isNotEmpty) {
                            txtLocalizacoes.text = localizacoesText.toString();
                            return txtLocalizacoes;
                          } else {
                            txtLocalizacoes.text = ' ';
                            return txtLocalizacoes;
                          }
                        },
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        if (arsenalEstoque.cod != null &&
                            arsenalEstoque.cod != 0)
                          CustomPopupMenuWidget(
                            items: [
                              CustomPopupItemModel(
                                text: 'Localizações',
                                onTap: () => {
                                  showDialog<(bool, String)>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: LocalizacaoArsenalPageFrm(
                                          localizacaoArsenal:
                                              LocalizacaoArsenalModel(
                                            cod: 0,
                                            ativo: true,
                                            arsenal: null,
                                            codBarra: null,
                                            codInstituicao: 0,
                                            local: '',
                                            ultimaAlteracao: null,
                                            tstamp: '',
                                            codEstoque: arsenalEstoque.cod,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((result) {
                                    if (result == null || !result.$1) return;
                                    ToastUtils.showCustomToastSucess(
                                      context,
                                      result.$2,
                                    );
                                  }),
                                },
                              ),
                              CustomPopupItemHistoryModel.getHistoryItem(
                                child: HistoricoPage(
                                  pk: arsenalEstoque.cod!,
                                  termo: 'ARSENAL_ESTQOUE',
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
                                arsenalEstoque = ArsenalEstoqueModel.empty();
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
    if (!txtNome.valid || !txtCodBarra.valid) {
      return;
    }

    if (localIsEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Este Arsenal ainda não possui uma Localização cadastrada e não será possível utiliza-lo no Processo. Utilize o botão Localizações e cadastre uma.',
      );
    }
    cubit.save(arsenalEstoque);
  }
}

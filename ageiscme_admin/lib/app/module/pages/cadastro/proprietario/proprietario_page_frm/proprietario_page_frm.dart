import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/arsenal/arsenal_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/proprietario/proprietario_page_frm/proprietario_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/proprietario/proprietario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/proprietario_arsenal/proprietario_arsenal_model.dart';
import 'package:ageiscme_models/models/proprietario_local/proprietario_local_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/list_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProprietarioPageFrm extends StatefulWidget {
  const ProprietarioPageFrm({
    Key? key,
    required this.proprietario,
    required this.localInstituicaoCubit,
    required this.arsenalEstoqueCubit,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ProprietarioModel proprietario;
  final LocalInstituicaoCubit localInstituicaoCubit;
  final ArsenalEstoqueCubit arsenalEstoqueCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<ProprietarioPageFrm> createState() =>
      _ProprietarioPageFrmState(proprietario: proprietario);
}

class _ProprietarioPageFrmState extends State<ProprietarioPageFrm> {
  _ProprietarioPageFrmState({required this.proprietario});

  late String titulo;
  ProprietarioModel proprietario;
  LocalInstituicaoModel? localInstituicaoRemover;
  LocalInstituicaoModel? localInstituicaoAdicionar;
  ArsenalEstoqueModel? arsenalEstoqueRemover;
  ArsenalEstoqueModel? arsenalEstoqueAdicionar;

  late final ProprietarioPageFrmCubit cubit = ProprietarioPageFrmCubit(
    proprietarioModel: proprietario,
    service: ProprietarioService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      proprietario.nome = txtNome.text;
    },
  );

  late final TextFieldNumberWidget txtCodBarra = TextFieldNumberWidget(
    placeholder: 'Código de Barra',
    onChanged: (String? str) {
      proprietario.codBarra = int.parse(txtCodBarra.text);
    },
  );

  late final TextFieldStringWidget txtContato = TextFieldStringWidget(
    placeholder: 'Contato *',
    onChanged: (String? str) {
      proprietario.contato = txtContato.text;
    },
  );

  @override
  void initState() {
    txtNome.addValidator((String str) {
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
      } else if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    super.initState();
  }

  final ScrollController scroll = ScrollController();

  void setFields() {
    txtNome.text = proprietario.nome.toString();
    txtContato.text = proprietario.contato.toString();

    if (proprietario.codBarra == 0 || proprietario.codBarra == null) {
      txtCodBarra.text = '';
    } else {
      txtCodBarra.text = proprietario.codBarra.toString();
    }

    titulo = 'Cadastro de Proprietários';
    if (proprietario.cod != 0) {
      titulo =
          'Edição do Proprietário: ${proprietario.cod} - ${proprietario.nome}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProprietarioPageFrmCubit, ProprietarioPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: size.width * .5,
                  minHeight: size.height * .5,
                  maxHeight: size.height * .8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scroll,
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
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
                              child: txtContato,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      CustomCheckboxWidget(
                                        checked: proprietario.ativo,
                                        onClick: (value) =>
                                            proprietario.ativo = value,
                                        text: 'Ativo',
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckboxWidget(
                                        checked:
                                            proprietario.manutencaoLiberada,
                                        onClick: (value) => proprietario
                                            .manutencaoLiberada = value,
                                        text: 'manutenção Liberada',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Locais do Proprietário',
                                      style: Fontes.getRoboto(
                                        fontSize:
                                            HelperFunctions.calculaFontSize(
                                          context,
                                          16,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: Text(
                                      'Locais Disponíveis',
                                      style: Fontes.getRoboto(
                                        fontSize:
                                            HelperFunctions.calculaFontSize(
                                          context,
                                          16,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListButtonWidget(
                                      text: 'Remover',
                                      icon: Icons.arrow_forward,
                                      onPressed: () {
                                        if (localInstituicaoRemover != null) {
                                          setState(() {
                                            if (proprietario
                                                    .proprietariosLocais !=
                                                null) {
                                              proprietario
                                                  .proprietariosLocais!
                                                  .removeWhere(
                                                (element) =>
                                                    element.codLocal ==
                                                    localInstituicaoRemover!
                                                        .cod,
                                              );
                                            }
                                          });
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Local foi selecionado',
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: ListButtonWidget(
                                      text: 'Adicionar',
                                      icon: Icons.arrow_back,
                                      onPressed: () {
                                        if (localInstituicaoAdicionar !=
                                            null) {
                                          setState(() {
                                            if (proprietario
                                                    .proprietariosLocais ==
                                                null) {
                                              proprietario
                                                  .proprietariosLocais = [];
                                            }
                                            ProprietarioLocalModel
                                                proprietarioLocal =
                                                ProprietarioLocalModel
                                                    .empty();
                                            proprietarioLocal.codLocal =
                                                localInstituicaoAdicionar!
                                                    .cod;
                                            proprietario.proprietariosLocais!
                                                .add(proprietarioLocal);
    
                                            localInstituicaoAdicionar = null;
                                          });
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Local foi selecionado',
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: BlocBuilder<LocalInstituicaoCubit,
                                        LocalInstituicaoState>(
                                      bloc: widget.localInstituicaoCubit,
                                      builder: (context, locaisState) {
                                        if (locaisState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<LocalInstituicaoModel> locais =
                                            locaisState.locaisInstituicoes;
    
                                        List<LocalInstituicaoModel>
                                            locaisAdicionado = [];
                                        if (proprietario
                                                .proprietariosLocais !=
                                            null) {
                                          for (final proprietarioLocal
                                              in proprietario
                                                  .proprietariosLocais!) {
                                            final codLocal =
                                                proprietarioLocal.codLocal;
    
                                            if (locais.isNotEmpty) {
                                              final proprietarioLocalAdicionado =
                                                  locais
                                                      .where(
                                                        (proprietarioLocal) =>
                                                            proprietarioLocal
                                                                .cod ==
                                                            codLocal,
                                                      )
                                                      .firstOrNull;
                                              if (proprietarioLocalAdicionado !=
                                                  null) {
                                                locaisAdicionado.add(
                                                  proprietarioLocalAdicionado,
                                                );
                                              }
                                            }
                                          }
                                        }
    
                                        locaisAdicionado.sort(
                                          (a, b) => a.nome.compareTo(b.nome),
                                        );
    
                                        return ListFieldWidget<
                                            LocalInstituicaoModel>(
                                          sourceList: locaisAdicionado,
                                          removeButton: false,
                                          onItemSelected:
                                              (selectedProprietarioLocal) {
                                            setState(() {
                                              localInstituicaoRemover =
                                                  selectedProprietarioLocal;
                                            });
                                          },
                                          itemText: (proprietarioLocal) {
                                            return proprietarioLocal.nome;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: BlocBuilder<LocalInstituicaoCubit,
                                        LocalInstituicaoState>(
                                      bloc: widget.localInstituicaoCubit,
                                      builder: (context, locaisState) {
                                        if (locaisState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<LocalInstituicaoModel> locais =
                                            locaisState.locaisInstituicoes;
    
                                        if (proprietario
                                                .proprietariosLocais ==
                                            null) {
                                          proprietario.proprietariosLocais =
                                              [];
                                        }
    
                                        List<LocalInstituicaoModel>
                                            locaisDisponiveis = locais
                                                .where(
                                                  (localInsituicao) =>
                                                      !proprietario
                                                          .proprietariosLocais!
                                                          .any(
                                                    (proprietarioLocal) =>
                                                        proprietarioLocal
                                                            .codLocal ==
                                                        localInsituicao.cod,
                                                  ),
                                                )
                                                .toList();
    
                                        locaisDisponiveis.sort(
                                          (a, b) => a.nome.compareTo(b.nome),
                                        );
    
                                        return ListFieldWidget<
                                            LocalInstituicaoModel>(
                                          sourceList: locaisDisponiveis,
                                          removeButton: false,
                                          onItemSelected:
                                              (selectedProprietarioLocal) {
                                            setState(() {
                                              localInstituicaoAdicionar =
                                                  selectedProprietarioLocal;
                                            });
                                          },
                                          itemText: (propritarioLocal) {
                                            return propritarioLocal.nome;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 24.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Arsenais do Proprietário',
                                      style: Fontes.getRoboto(
                                        fontSize:
                                            HelperFunctions.calculaFontSize(
                                          context,
                                          16,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: Text(
                                      'Arsenais Disponíveis',
                                      style: Fontes.getRoboto(
                                        fontSize:
                                            HelperFunctions.calculaFontSize(
                                          context,
                                          16,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListButtonWidget(
                                      text: 'Remover',
                                      icon: Icons.arrow_forward,
                                      onPressed: () {
                                        if (arsenalEstoqueRemover != null) {
                                          setState(() {
                                            if (proprietario
                                                    .proprietariosArsenais !=
                                                null) {
                                              proprietario
                                                  .proprietariosArsenais!
                                                  .removeWhere(
                                                (element) =>
                                                    element.codEstoque ==
                                                    arsenalEstoqueRemover!
                                                        .cod,
                                              );
                                            }
                                          });
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Arsenal foi selecionado',
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: ListButtonWidget(
                                      text: 'Adicionar',
                                      icon: Icons.arrow_back,
                                      onPressed: () {
                                        if (arsenalEstoqueAdicionar != null) {
                                          setState(() {
                                            if (proprietario
                                                    .proprietariosArsenais ==
                                                null) {
                                              proprietario
                                                  .proprietariosArsenais = [];
                                            }
                                            ProprietarioArsenalModel
                                                proprietarioArsenal =
                                                ProprietarioArsenalModel
                                                    .empty();
                                            proprietarioArsenal.codEstoque =
                                                arsenalEstoqueAdicionar!.cod;
                                            proprietario
                                                .proprietariosArsenais!
                                                .add(proprietarioArsenal);
    
                                            arsenalEstoqueAdicionar = null;
                                          });
                                        } else {
                                          ToastUtils.showCustomToastError(
                                            context,
                                            'Nenhum Arsenal foi selecionado',
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: BlocBuilder<ArsenalEstoqueCubit,
                                        ArsenalEstoqueState>(
                                      bloc: widget.arsenalEstoqueCubit,
                                      builder: (context, arsenaisState) {
                                        if (arsenaisState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<ArsenalEstoqueModel> arsenais =
                                            arsenaisState.arsenaisEstoques;
    
                                        List<ArsenalEstoqueModel>
                                            arsenaisAdicionado = [];
                                        if (proprietario
                                                .proprietariosArsenais !=
                                            null) {
                                          for (final proprietarioArsenal
                                              in proprietario
                                                  .proprietariosArsenais!) {
                                            final codEstoque =
                                                proprietarioArsenal
                                                    .codEstoque;
    
                                            if (arsenais.isNotEmpty) {
                                              final proprietarioArsenalAdicionado =
                                                  arsenais
                                                      .where(
                                                        (proprietarioArsenal) =>
                                                            proprietarioArsenal
                                                                .cod ==
                                                            codEstoque,
                                                      )
                                                      .firstOrNull;
                                              if (proprietarioArsenalAdicionado !=
                                                  null) {
                                                arsenaisAdicionado.add(
                                                  proprietarioArsenalAdicionado,
                                                );
                                              }
                                            }
                                          }
                                        }
    
                                        arsenaisAdicionado.sort(
                                          (a, b) =>
                                              a.nome!.compareTo(b.nome!),
                                        );
    
                                        return ListFieldWidget<
                                            ArsenalEstoqueModel>(
                                          sourceList: arsenaisAdicionado,
                                          removeButton: false,
                                          onItemSelected:
                                              (selectedProprietarioArsenal) {
                                            setState(() {
                                              arsenalEstoqueRemover =
                                                  selectedProprietarioArsenal;
                                            });
                                          },
                                          itemText: (proprietarioArsenal) {
                                            return proprietarioArsenal.nome!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 25.0),
                                  Expanded(
                                    child: BlocBuilder<ArsenalEstoqueCubit,
                                        ArsenalEstoqueState>(
                                      bloc: widget.arsenalEstoqueCubit,
                                      builder: (context, arsenaisState) {
                                        if (arsenaisState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<ArsenalEstoqueModel> arsenais =
                                            arsenaisState.arsenaisEstoques;
    
                                        if (proprietario
                                                .proprietariosArsenais ==
                                            null) {
                                          proprietario.proprietariosArsenais =
                                              [];
                                        }
    
                                        List<ArsenalEstoqueModel>
                                            arsenaisDisponiveis = arsenais
                                                .where(
                                                  (arsenalEstoque) =>
                                                      !proprietario
                                                          .proprietariosArsenais!
                                                          .any(
                                                    (proprietarioArsenal) =>
                                                        proprietarioArsenal
                                                            .codEstoque ==
                                                        arsenalEstoque.cod,
                                                  ),
                                                )
                                                .toList();
    
                                        arsenaisDisponiveis.sort(
                                          (a, b) =>
                                              a.nome!.compareTo(b.nome!),
                                        );
    
                                        return ListFieldWidget<
                                            ArsenalEstoqueModel>(
                                          sourceList: arsenaisDisponiveis,
                                          removeButton: false,
                                          onItemSelected:
                                              (selectedProprietarioArsenal) {
                                            setState(() {
                                              arsenalEstoqueAdicionar =
                                                  selectedProprietarioArsenal;
                                            });
                                          },
                                          itemText: (propritarioArsenal) {
                                            return propritarioArsenal.nome!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                    if (proprietario.cod != null && proprietario.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: proprietario.cod!,
                          termo: 'PROPRIETARIO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SaveButtonWidget(
                    onPressed: salvar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CleanButtonWidget(
                    onPressed: () => {
                      setState(() {
                        proprietario = ProprietarioModel.empty();
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
    bool nomeValid = txtNome.valid;
    bool contatoValid = txtContato.valid;
    if (!nomeValid) {
      scroll.jumpTo(0);
    } else if (!contatoValid) {
      scroll.jumpTo(90);
    }
    if (!nomeValid || !contatoValid) return;

    final registrarProprietarioLocal = <ProprietarioLocalModel>[];
    final registrarProprietarioArsenal = <ProprietarioArsenalModel>[];

    for (final proprietarioLocal in proprietario.proprietariosLocais!) {
      final localProprietario = ProprietarioLocalModel(
        cod: proprietarioLocal.cod,
        codInstituicao: proprietarioLocal.codInstituicao,
        codLocal: proprietarioLocal.codLocal,
        codProprietario: proprietario.cod,
        proprietario: null,
        tstamp: '',
        ultimaAlteracao: null,
      );
      registrarProprietarioLocal.add(localProprietario);
    }

    for (final proprietarioArsenal in proprietario.proprietariosArsenais!) {
      final arsenalProprietario = ProprietarioArsenalModel(
        cod: proprietarioArsenal.cod,
        codInstituicao: proprietarioArsenal.codInstituicao,
        codEstoque: proprietarioArsenal.codEstoque,
        codProprietario: proprietario.cod,
        proprietario: null,
        tstamp: '',
        ultimaAlteracao: null,
      );
      registrarProprietarioArsenal.add(arsenalProprietario);
    }

    proprietario.proprietariosArsenais = registrarProprietarioArsenal;
    proprietario.proprietariosLocais = registrarProprietarioLocal;
    cubit.save(proprietario, widget.onSaved);
  }
}

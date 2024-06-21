// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/direito/direito_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/perfil_acesso/perfil_acesso_page_frm/perfil_acesso_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/direito/direito_model.dart';
import 'package:ageiscme_models/models/perfil_direito/perfil_direito_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/list_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class PerfilAcessoPageFrm extends StatefulWidget {
  const PerfilAcessoPageFrm({
    Key? key,
    required this.perfilAcesso,
    required this.direitoCubit,
  }) : super(key: key);

  final PerfilAcessoModel perfilAcesso;
  final DireitoCubit direitoCubit;

  @override
  State<PerfilAcessoPageFrm> createState() =>
      _PerfilAcessoPageFrmState(perfilAcesso: perfilAcesso);
}

class _PerfilAcessoPageFrmState extends State<PerfilAcessoPageFrm> {
  _PerfilAcessoPageFrmState({required this.perfilAcesso});
  late String titulo;
  PerfilAcessoModel perfilAcesso;
  DireitoModel? direitoRemover;
  DireitoModel? direitoAdicionar;

  late final PerfilAcessoPageFrmCubit cubit = PerfilAcessoPageFrmCubit(
    perfilAcessoModel: perfilAcesso,
    service: PerfilAcessoService(),
  );

  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      perfilAcesso.descricao = txtDescricao.text;
    },
  );

  void initState() {
    txtDescricao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 100) {
        return 'Pode ter no máximo 100 caracteres';
      }
      return '';
    });
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void setFields() {
    txtDescricao.text = perfilAcesso.descricao.toString();
    titulo = 'Cadastro de Perfis';
    if (perfilAcesso.cod != 0) {
      titulo =
          'Edição do Peril: ${perfilAcesso.cod} - ${perfilAcesso.descricao}';
    }
  }

  final ScrollController scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<PerfilAcessoPageFrmCubit, PerfilAcessoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<PerfilAcessoPageFrmCubit, PerfilAcessoPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
            title: Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
                const Spacer(),
                CloseButtonWidget(
                  onPressed: () => Navigator.of(context).pop((false, '')),
                ),
              ],
            ),
            content: Container(
              constraints: BoxConstraints(
                minWidth: size.width * .5,
                minHeight: size.height * .5,
                maxHeight: size.height * .8,
              ),
              child: SingleChildScrollView(
                controller: scroll,
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: perfilAcesso.ativo,
                            onClick: (value) => perfilAcesso.ativo = value,
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
                            checked: perfilAcesso.perfilRestrito,
                            onClick: (value) =>
                                perfilAcesso.perfilRestrito = value,
                            text: 'Perfil Restrito',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Direitos do Perfil',
                              style: Fontes.getRoboto(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: Text(
                              'Direitos Ausentes do Perfil',
                              style: Fontes.getRoboto(),
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
                              text: 'Remover Direito',
                              icon: Icons.arrow_forward,
                              onPressed: () {
                                if (direitoRemover != null) {
                                  setState(() {
                                    if (perfilAcesso.perfilDireitos != null) {
                                      perfilAcesso.perfilDireitos!.removeWhere(
                                        (element) =>
                                            element.codDireito ==
                                            direitoRemover!.cod,
                                      );
                                    }
                                  });
                                } else {
                                  ToastUtils.showCustomToastError(
                                    context,
                                    'Nenhum Direito selecionado',
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: ListButtonWidget(
                              text: 'Incluir Direito',
                              icon: Icons.arrow_back,
                              onPressed: () {
                                if (direitoAdicionar != null) {
                                  setState(() {
                                    if (perfilAcesso.perfilDireitos == null) {
                                      perfilAcesso.perfilDireitos = [];
                                    }
                                    PerfilDireitoModel perfilDireito =
                                        PerfilDireitoModel.empty();
                                    perfilDireito.codDireito =
                                        direitoAdicionar!.cod;
                                    perfilAcesso.perfilDireitos!
                                        .add(perfilDireito);

                                    direitoAdicionar = null;
                                  });
                                } else {
                                  ToastUtils.showCustomToastError(
                                    context,
                                    'Nenhum Direito selecionado',
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
                            child: BlocBuilder<DireitoCubit, DireitoState>(
                              bloc: widget.direitoCubit,
                              builder: (context, direitoState) {
                                if (direitoState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<DireitoModel> direitos =
                                    direitoState.direitos;

                                List<DireitoModel> direitosAdicionado = [];

                                if (perfilAcesso.perfilDireitos != null) {
                                  for (final perfilDireito
                                      in perfilAcesso.perfilDireitos!) {
                                    final codDireito = perfilDireito.codDireito;

                                    if (direitos.isNotEmpty) {
                                      final direitoAdicionado = direitos
                                          .where(
                                            (direito) =>
                                                direito.cod == codDireito,
                                          )
                                          .firstOrNull;
                                      if (direitoAdicionado != null) {
                                        direitosAdicionado
                                            .add(direitoAdicionado);
                                      }
                                    }
                                  }
                                }

                                return ListFieldWidget<DireitoModel>(
                                  sourceList: direitosAdicionado,
                                  removeButton: false,
                                  onItemSelected: (selectedDireito) {
                                    setState(() {
                                      direitoRemover = selectedDireito;
                                    });
                                  },
                                  itemText: (direito) {
                                    return direito.descricao!;
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 25.0),
                          Expanded(
                            child: BlocBuilder<DireitoCubit, DireitoState>(
                              bloc: widget.direitoCubit,
                              builder: (context, direitoState) {
                                if (direitoState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<DireitoModel> direitos =
                                    direitoState.direitos;

                                if (perfilAcesso.perfilDireitos == null) {
                                  perfilAcesso.perfilDireitos = [];
                                }

                                List<DireitoModel> direitosDisponiveis =
                                    direitos
                                        .where(
                                          (direito) =>
                                              !perfilAcesso.perfilDireitos!.any(
                                            (direitoPerfil) =>
                                                direitoPerfil.codDireito ==
                                                direito.cod,
                                          ),
                                        )
                                        .toList();

                                return ListFieldWidget<DireitoModel>(
                                  sourceList: direitosDisponiveis,
                                  removeButton: false,
                                  onItemSelected: (selectedDireito) {
                                    setState(() {
                                      direitoAdicionar = selectedDireito;
                                    });
                                  },
                                  itemText: (direito) {
                                    return direito.descricao!;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (perfilAcesso.cod != null && perfilAcesso.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: perfilAcesso.cod!,
                            termo: 'PERFIL_ACESSO',
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
                          perfilAcesso = PerfilAcessoModel.empty();
                        }),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CancelButtonUnfilledWidget(
                      onPressed: () => {Navigator.of(context).pop((false, ''))},
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvar() {
    if (!txtDescricao.valid) {
      scroll.jumpTo(0);
    }
    if (!txtDescricao.valid) return;

    final registrarDireitos = <PerfilDireitoModel>[];

    for (final direitoPerfil in perfilAcesso.perfilDireitos!) {
      final perfilDireito = PerfilDireitoModel(
        cod: 0,
        codInstituicao: 0,
        codPerfil: perfilAcesso.cod,
        codDireito: direitoPerfil.codDireito,
        perfilAcesso: null,
        usuarioPerfil: null,
        tstamp: '',
        ultimaAlteracao: null,
      );
      registrarDireitos.add(perfilDireito);
    }
    perfilAcesso.perfilDireitos = registrarDireitos;
    cubit.save(perfilAcesso);
  }
}

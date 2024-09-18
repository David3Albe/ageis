import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/item_descritor/item_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tamanho/tamanho_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/item_descritor_kit_page_frm/item_descritor_kit_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_frm/kit_descritor_page_frm_state.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitDescritorPageFrm extends StatefulWidget {
  const KitDescritorPageFrm({
    Key? key,
    required this.kitDescritor,
    required this.processoTipoCubit,
    required this.itemDescritorCubit,
    required this.onSaved,
    required this.onCancel,
    required this.instituicao,
  }) : super(key: key);

  final KitDescritorModel kitDescritor;
  final ProcessoTipoCubit processoTipoCubit;
  final ItemDescritorCubit itemDescritorCubit;
  final void Function(String, int) onSaved;
  final void Function() onCancel;
  final InstituicaoModel instituicao;

  @override
  State<KitDescritorPageFrm> createState() =>
      _KitDescritorPageFrmState(kitDescritor: kitDescritor);
}

class _KitDescritorPageFrmState extends State<KitDescritorPageFrm> {
  _KitDescritorPageFrmState({required this.kitDescritor});

  late String titulo;
  KitDescritorModel kitDescritor;
  late final TamanhoCubit tamanhoCubit;
  // late final EmbalagemCubit embalagemCubit;
  late final ProcessoTipoCubit processoTipoCubit;
  late final CentroCustoCubit centroCustoCubit;
  // late final ItemDescritorCubit itemDescritorCubit;

  List<ItemDescritorKitModel> listaDeItens = [];

  late KitDescritorPageFrmCubit cubit = KitDescritorPageFrmCubit(
    kitDescritorModel: kitDescritor,
    service: KitDescritorService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome *',
    onChanged: (String? str) {
      kitDescritor.nome = txtNome.text;
    },
  );

  late final TextFieldStringAreaWidget txtDescricao = TextFieldStringAreaWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      kitDescritor.descricao = txtDescricao.text;
    },
  );

  late final TextFieldStringAreaWidget txtItensKits = TextFieldStringAreaWidget(
    placeholder: 'Itens deste Kit (Quantidade)',
    readOnly: true,
  );

  late bool Function() validaTipoProcessoNormal;
  late bool Function() validaTipoProcessoUrgencia;

  @override
  void initState() {
    tamanhoCubit = TamanhoCubit();
    tamanhoCubit.loadAll();
    // embalagemCubit = EmbalagemCubit();
    // embalagemCubit.loadAll();
    processoTipoCubit = ProcessoTipoCubit();
    processoTipoCubit.loadAll();
    centroCustoCubit = CentroCustoCubit();
    centroCustoCubit.loadAll();

    txtNome.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtDescricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtNome.text = kitDescritor.nome.toString();

    if (kitDescritor.descricao == null) {
      txtDescricao.text = '';
    } else {
      txtDescricao.text = kitDescritor.descricao.toString();
    }

    if (kitDescritor.itensDescritorKits != null) {
      listaDeItens.addAll(kitDescritor.itensDescritorKits!);
      kitDescritor.itensDescritorKits = null;
    }

    titulo = 'Cadastro de Descritor de Kits';
    if (kitDescritor.cod != 0) {
      titulo =
          'Edição de Descritor de Kits: ${kitDescritor.cod} - ${kitDescritor.nome}';
    }
  }

  final ScrollController scroll = ScrollController();

  late void Function(TamanhoModel?) setTamanho;
  late void Function(ProcessoTipoModel?) setTipoProcessoNormal;
  late void Function(ProcessoTipoModel?) setTipoProcessoUrgente;
  late void Function(CentroCustoModel?) setCentroCusto;

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<KitDescritorPageFrmCubit, KitDescritorPageFrmState>(
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
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtNome,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child:
                                        BlocBuilder<TamanhoCubit, TamanhoState>(
                                      bloc: tamanhoCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        TamanhoModel? tamanho = state.tamanhos
                                            .where(
                                              (element) =>
                                                  element.sigla ==
                                                  kitDescritor.tamanhoSigla,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setTamanho =
                                                  setSelectedItemMethod,
                                          initialValue: tamanho,
                                          sourceList: state.tamanhos,
                                          onChanged: (value) => kitDescritor
                                              .tamanhoSigla = value?.sigla,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          placeholder: 'Tamanho',
                                        );
                                      },
                                    ),
                                  ),
                                  // const SizedBox(width: 16.0),
                                  // Expanded(
                                  //   child: BlocBuilder<EmbalagemCubit,
                                  //       EmbalagemState>(
                                  //     bloc: embalagemCubit,
                                  //     builder: (context, state) {
                                  //       if (state.loading) {
                                  //         return const Center(
                                  //           child: LoadingWidget(),
                                  //         );
                                  //       }
                                  //       List<EmbalagemModel> embalagens =
                                  //           state.embalagens;
                                  //       embalagens.sort(
                                  //         (a, b) => a.nome!.compareTo(b.nome!),
                                  //       );
                                  //       EmbalagemModel? embalagem = embalagens
                                  //           .where(
                                  //             (element) =>
                                  //                 element.cod ==
                                  //                 kitDescritor.codEmbalagem,
                                  //           )
                                  //           .firstOrNull;
                                  //       return DropDownSearchWidget(
                                  //         initialValue: embalagem,
                                  //         textFunction: (p0) =>
                                  //             p0.GetDropDownText(),
                                  //         sourceList: embalagens
                                  //             .where(
                                  //               (element) =>
                                  //                   element.ativo == true,
                                  //             )
                                  //             .toList(),
                                  //         onChanged: (value) => kitDescritor
                                  //             .codEmbalagem = value?.cod,
                                  //         placeholder: 'Embalagem',
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<ProcessoTipoCubit,
                                  ProcessoTipoState>(
                                bloc: processoTipoCubit,
                                builder: (context, processosTiposState) {
                                  if (processosTiposState.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<ProcessoTipoModel> processosTipos =
                                      processosTiposState.processosTipos;

                                  processosTipos.sort(
                                    (a, b) => a.nome.compareTo(b.nome),
                                  );
                                  ProcessoTipoModel? processoTipo =
                                      processosTipos
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                kitDescritor
                                                    .codTipoProcessoNormal,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget(
                                    setSelectedItemBuilder: (
                                      context,
                                      setSelectedItemMethod,
                                    ) =>
                                        setTipoProcessoNormal =
                                            setSelectedItemMethod,
                                    initialValue: processoTipo,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validaTipoProcessoNormal =
                                                validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    sourceList: processosTipos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      kitDescritor.codTipoProcessoNormal =
                                          value?.cod;
                                      kitDescritor.tipoProcesso = value;
                                      if (widget.instituicao.fluxoAlternado !=
                                          true) {
                                        kitDescritor.codTipoProcessoUrgencia =
                                            value?.cod;
                                        kitDescritor.tipoProcessoUrgencia =
                                            value;
                                        kitDescritor.codTipoProcessoEmergencia =
                                            value?.cod;
                                        kitDescritor.tipoProcessoEmergencia =
                                            value;
                                        processoTipoCubit.refresh();
                                      }
                                    },
                                    placeholder:
                                        'Tipo de Processo para prioridade Normal *',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<ProcessoTipoCubit,
                                  ProcessoTipoState>(
                                bloc: processoTipoCubit,
                                builder: (context, processosTiposState) {
                                  if (processosTiposState.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<ProcessoTipoModel> processosTipos =
                                      processosTiposState.processosTipos;

                                  processosTipos.sort(
                                    (a, b) => a.nome.compareTo(b.nome),
                                  );
                                  ProcessoTipoModel? processoTipo =
                                      processosTipos
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                kitDescritor
                                                    .codTipoProcessoUrgencia,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget(
                                    setSelectedItemBuilder: (
                                      context,
                                      setSelectedItemMethod,
                                    ) =>
                                        setTipoProcessoUrgente =
                                            setSelectedItemMethod,
                                    readOnly:
                                        widget.instituicao.fluxoAlternado !=
                                            true,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validaTipoProcessoUrgencia =
                                                validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    initialValue: processoTipo,
                                    sourceList: processosTipos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    onChanged: (value) => kitDescritor
                                        .codTipoProcessoUrgencia = value?.cod,
                                    placeholder:
                                        'Tipo de Processo para prioridade Urgência *',
                                  );
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 5.0),
                            //   child: BlocBuilder<ProcessoTipoCubit, ProcessoTipoState>(
                            //     bloc: processoTipoCubit,
                            //     builder: (context, processosTiposState) {
                            //       if (processosTiposState.loading) {
                            //         return const LoadingWidget();
                            //       }
                            //       List<ProcessoTipoModel> processosTipos =
                            //           processosTiposState.processosTipos;

                            //       processosTipos.sort(
                            //         (a, b) => a.nome.compareTo(b.nome),
                            //       );
                            //       ProcessoTipoModel? processoTipo = processosTipos
                            //           .where(
                            //             (element) =>
                            //                 element.cod ==
                            //                 kitDescritor.codTipoProcessoEmergencia,
                            //           )
                            //           .firstOrNull;
                            //       return DropDownWidget(
                            //         initialValue: processoTipo,
                            //         sourceList: processosTipos
                            //             .where((element) => element.ativo == true)
                            //             .toList(),
                            //         onChanged: (value) => kitDescritor
                            //             .codTipoProcessoEmergencia = value.cod!,
                            //         placeholder:
                            //             'Tipo de Processo para prioridade Emergência',
                            //       );
                            //     },
                            //   ),
                            // ),
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
                                  List<CentroCustoModel> centrosCustos =
                                      state.centrosCusto;
                                  centrosCustos.sort(
                                    (a, b) => a.centroCusto!
                                        .compareTo(b.centroCusto!),
                                  );
                                  CentroCustoModel? centroCusto = centrosCustos
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            kitDescritor.codCusto,
                                      )
                                      .firstOrNull;
                                  return DropDownSearchWidget(
                                    setSelectedItemBuilder: (
                                      context,
                                      setSelectedItemMethod,
                                    ) =>
                                        setCentroCusto = setSelectedItemMethod,
                                    initialValue: centroCusto,
                                    textFunction: (p0) => p0.CentroCustoText(),
                                    sourceList: centrosCustos,
                                    onChanged: (value) =>
                                        kitDescritor.codCusto = value?.cod,
                                    placeholder: 'Valor do Peso',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: CustomCheckboxWidget(
                                align: MainAxisAlignment.start,
                                checked: kitDescritor.exigeProntuario,
                                onClick: (value) =>
                                    kitDescritor.exigeProntuario = value,
                                text: 'Preenchimento do Prontuário Obrigatório',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: CustomCheckboxWidget(
                                align: MainAxisAlignment.start,
                                checked: kitDescritor.ativo,
                                onClick: (value) => kitDescritor.ativo = value,
                                text: 'Ativo',
                              ),
                            ),
                            // if (listaDeItens.isNotEmpty) ...{
                            //   Padding(
                            //     padding: const EdgeInsets.only(top: 5.0),
                            //     child: Text(
                            //       'Itens deste Kit (quantidades)',
                            //       style: Fontes.getRoboto(),
                            //     ),
                            //   ),
                            //   Padding(
                            //     padding: const EdgeInsets.only(top: 5.0),
                            //     child: BlocBuilder<ItemDescritorCubit,
                            //         ItemDescritorState>(
                            //       bloc: widget.itemDescritorCubit,
                            //       builder: (context, itensDescritorState) {
                            //         if (itensDescritorState.loading) {
                            //           return const LoadingWidget();
                            //         }
                            //         List<ItemDescritorModel> itensDescritores =
                            //             itensDescritorState.itensDescritores;

                            //         return ListFieldWidget<
                            //             ItemDescritorKitModel>(
                            //           sourceList: listaDeItens,
                            //           removeButton: false,
                            //           onItemSelected: (value) {},
                            //           itemText: (value) {
                            //             final codDescritorItem =
                            //                 value.codDescritorItem;
                            //             final quantidade = value.quantidade;

                            //             final descricaoItemDescritor =
                            //                 itensDescritores
                            //                     .where(
                            //                       (itemDescritor) =>
                            //                           itemDescritor.cod ==
                            //                           codDescritorItem,
                            //                     )
                            //                     .firstOrNull;

                            //             final descricaoCurta =
                            //                 descricaoItemDescritor
                            //                     ?.descricaoCurta;
                            //             if (descricaoCurta == null) {
                            //               return '';
                            //             }
                            //             return '$descricaoCurta - ($quantidade)';
                            //           },
                            //         );
                            //       },
                            //     ),
                            //   ),
                            // },
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: LabelStringWidget(
                                text:
                                    '${kitDescritor.imagem == null ? '' : 'Imagem anexada'}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ImageDisplayWidget(
                                imageBase64: kitDescritor.imagem,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    // CustomPopupItemModel(
                    //   text: 'Itens',
                    //   onTap: abrirTelaItens,
                    // ),
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar Imagem',
                      salvarImagem,
                    ),
                    if (kitDescritor.imagem != null)
                      CustomPopupItemOpenDocModel.getOpenDocItem(
                        'Abrir Imagem',
                        context,
                        kitDescritor.imagem,
                        'arquivo sem nome.Webp',
                      ),
                    if (kitDescritor.imagem != null)
                      CustomPopupItemModel(
                        text: 'Excluir Imagem',
                        onTap: excluirImagem,
                      ),
                    if (kitDescritor.cod != null && kitDescritor.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Descritor de Kit ${kitDescritor.cod}',
                        child: HistoricoPage(
                          pk: kitDescritor.cod!,
                          termo: 'KIT_DESCRITOR',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: kitDescritor.cod == 0 || kitDescritor.cod == null,
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
                        kitDescritor = KitDescritorModel.empty();
                        setTamanho(null);
                        setCentroCusto(null);
                        setTipoProcessoNormal(null);
                        setTipoProcessoUrgente(null);
                        listaDeItens = [];
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
        );
      },
    );
  }

  void salvarImagem(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      kitDescritor.imagem = imageNew.base64;
    });
  }

  void excluirImagem() {
    setState(() {
      kitDescritor.imagem = null;
    });
  }

  void abrirTelaItens() {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ItemDescritorKitPageFrm(
            itemDescritorKit: ItemDescritorKitModel(
              cod: 0,
              codDescritorItem: 0,
              codDescritorKit: kitDescritor.cod!,
              quantidade: 0,
              codInstituicao: 0,
              ultimaAlteracao: null,
              tstamp: '',
            ),
            onSave: (itemDescritorKit) {
              setState(() {
                listaDeItens.add(itemDescritorKit);
              });
            },
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) {
        return;
      }
      ToastUtils.showCustomToastSucess(
        context,
        result.$2,
      );
    });
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    bool nomeValid = txtNome.valid;
    bool descricaoValid = txtDescricao.valid;
    bool tipoProcessoNormalValid = validaTipoProcessoNormal();
    bool tipoProcessoUrgenciaValid = validaTipoProcessoUrgencia();
    if (!nomeValid) {
      scroll.jumpTo(0);
    } else if (!descricaoValid) {
      scroll.jumpTo(50);
    } else if (!tipoProcessoNormalValid) {
      scroll.jumpTo(150);
    } else if (!tipoProcessoUrgenciaValid) {
      scroll.jumpTo(200);
    }
    if (!nomeValid ||
        !descricaoValid ||
        !tipoProcessoNormalValid ||
        !tipoProcessoUrgenciaValid) {
      return;
    }

    cubit.save(
      novo
          ? kitDescritor.copyWith(
              cod: 0,
              tstamp: null,
            )
          : kitDescritor,
      widget.onSaved,
    );
  }
}

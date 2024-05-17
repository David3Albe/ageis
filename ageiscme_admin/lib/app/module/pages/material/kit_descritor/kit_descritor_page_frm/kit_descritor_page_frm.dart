import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/embalagem/embalagem_cubit.dart';
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
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/delete_image_button_widget.dart';
import 'package:compartilhados/componentes/botoes/navigation_buttom_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitDescritorPageFrm extends StatefulWidget {
  const KitDescritorPageFrm({
    Key? key,
    required this.kitDescritor,
    required this.processoTipoCubit,
    required this.itemDescritorCubit,
  }) : super(key: key);

  final KitDescritorModel kitDescritor;
  final ProcessoTipoCubit processoTipoCubit;
  final ItemDescritorCubit itemDescritorCubit;

  @override
  State<KitDescritorPageFrm> createState() =>
      _KitDescritorPageFrmState(kitDescritor: kitDescritor);
}

class _KitDescritorPageFrmState extends State<KitDescritorPageFrm> {
  _KitDescritorPageFrmState({required this.kitDescritor});

  late String titulo;
  KitDescritorModel kitDescritor;
  late final TamanhoCubit tamanhoCubit;
  late final EmbalagemCubit embalagemCubit;
  late final ProcessoTipoCubit processoTipoCubit;
  late final CentroCustoCubit centroCustoCubit;
  // late final ItemDescritorCubit itemDescritorCubit;

  List<ItemDescritorKitModel> listaDeItens = [];

  late KitDescritorPageFrmCubit cubit = KitDescritorPageFrmCubit(
    kitDescritorModel: kitDescritor,
    service: KitDescritorService(),
  );

  late final TextFieldStringWidget txtNome = TextFieldStringWidget(
    placeholder: 'Nome',
    onChanged: (String? str) {
      kitDescritor.nome = txtNome.text;
    },
  );

  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      kitDescritor.descricao = txtDescricao.text;
    },
  );

  late final TextFieldStringAreaWidget txtItensKits = TextFieldStringAreaWidget(
    placeholder: 'Itens deste Kit (Quantidade)',
    readOnly: true,
  );

  @override
  void initState() {
    tamanhoCubit = TamanhoCubit();
    tamanhoCubit.loadAll();
    embalagemCubit = EmbalagemCubit();
    embalagemCubit.loadAll();
    processoTipoCubit = ProcessoTipoCubit();
    processoTipoCubit.loadAll();
    centroCustoCubit = CentroCustoCubit();
    centroCustoCubit.loadAll();
    // itemDescritorCubit = ItemDescritorCubit();
    // itemDescritorCubit.loadAll();

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

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<KitDescritorPageFrmCubit, KitDescritorPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<KitDescritorPageFrmCubit, KitDescritorPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            constraints: BoxConstraints(
              minWidth: size.width * .5,
              minHeight: size.height * .5,
              maxHeight: size.height * .8,
            ),
            child: AlertDialog(
              contentPadding: const EdgeInsets.all(8.0),
              titlePadding: const EdgeInsets.all(8.0),
              actionsPadding: const EdgeInsets.all(8.0),
              insetPadding: const EdgeInsets.all(50.0),
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
              content: SingleChildScrollView(
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
                                BlocBuilder<TamanhoCubit, List<TamanhoModel>>(
                              bloc: tamanhoCubit,
                              builder: (context, tamanhos) {
                                TamanhoModel? tamanho = tamanhos
                                    .where(
                                      (element) =>
                                          element.sigla ==
                                          kitDescritor.tamanhoSigla,
                                    )
                                    .firstOrNull;
                                return DropDownWidget(
                                  initialValue: tamanho,
                                  sourceList: tamanhos,
                                  onChanged: (value) =>
                                      kitDescritor.tamanhoSigla = value.sigla!,
                                  placeholder: 'Tamanho',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<EmbalagemCubit,
                                List<EmbalagemModel>>(
                              bloc: embalagemCubit,
                              builder: (context, embalagens) {
                                embalagens.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                EmbalagemModel? embalagem = embalagens
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          kitDescritor.codEmbalagem,
                                    )
                                    .firstOrNull;
                                return DropDownWidget(
                                  initialValue: embalagem,
                                  sourceList: embalagens
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kitDescritor.codEmbalagem = value.cod!,
                                  placeholder: 'Embalagem',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<ProcessoTipoCubit, ProcessoTipoState>(
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
                          ProcessoTipoModel? processoTipo = processosTipos
                              .where(
                                (element) =>
                                    element.cod ==
                                    kitDescritor.codTipoProcessoNormal,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: processoTipo,
                            sourceList: processosTipos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) =>
                                kitDescritor.codTipoProcessoNormal = value.cod!,
                            placeholder:
                                'Tipo de Processo para prioridade Normal',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<ProcessoTipoCubit, ProcessoTipoState>(
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
                          ProcessoTipoModel? processoTipo = processosTipos
                              .where(
                                (element) =>
                                    element.cod ==
                                    kitDescritor.codTipoProcessoUrgencia,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: processoTipo,
                            sourceList: processosTipos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) => kitDescritor
                                .codTipoProcessoUrgencia = value.cod!,
                            placeholder:
                                'Tipo de Processo para prioridade Urgência',
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
                      child:
                          BlocBuilder<CentroCustoCubit, List<CentroCustoModel>>(
                        bloc: centroCustoCubit,
                        builder: (context, centrosCustos) {
                          centrosCustos.sort(
                            (a, b) => a.centroCusto!.compareTo(b.centroCusto!),
                          );
                          CentroCustoModel? centroCusto = centrosCustos
                              .where(
                                (element) =>
                                    element.cod == kitDescritor.codCusto,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: centroCusto,
                            sourceList: centrosCustos,
                            onChanged: (value) =>
                                kitDescritor.codCusto = value.cod!,
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
                    if (listaDeItens.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Itens deste Kit (quantidades)',
                          style: Fontes.getRoboto(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child:
                            BlocBuilder<ItemDescritorCubit, ItemDescritorState>(
                          bloc: widget.itemDescritorCubit,
                          builder: (context, itensDescritorState) {
                            if (itensDescritorState.loading) {
                              return const LoadingWidget();
                            }
                            List<ItemDescritorModel> itensDescritores =
                                itensDescritorState.itensDescritores;

                            return ListFieldWidget<ItemDescritorKitModel>(
                              sourceList: listaDeItens,
                              removeButton: false,
                              onItemSelected: (value) {},
                              itemText: (value) {
                                final codDescritorItem = value.codDescritorItem;
                                final quantidade = value.quantidade;

                                final descricaoItemDescritor = itensDescritores
                                    .where(
                                      (itemDescritor) =>
                                          itemDescritor.cod == codDescritorItem,
                                    )
                                    .firstOrNull;

                                final descricaoCurta =
                                    descricaoItemDescritor?.descricaoCurta;
                                if (descricaoCurta == null) {
                                  return '';
                                }
                                return '$descricaoCurta - ($quantidade)';
                              },
                            );
                          },
                        ),
                      ),
                    },
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ImageDisplayWidget(
                        imageBase64: kitDescritor.imagem,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 16 * paddingHorizontalScale,
                            spacing: 16 * paddingHorizontalScale,
                            children: [
                              if (kitDescritor.cod != 0) ...{
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: NavigationButtonWidget(
                                    placeholder: 'Itens',
                                    onPressed: () => {
                                      showDialog<(bool, String)>(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: ItemDescritorKitPageFrm(
                                              itemDescritorKit:
                                                  ItemDescritorKitModel(
                                                cod: 0,
                                                codDescritorItem: 0,
                                                codDescritorKit:
                                                    kitDescritor.cod!,
                                                quantidade: 0,
                                                codInstituicao: 0,
                                                ultimaAlteracao: null,
                                                tstamp: '',
                                              ),
                                              onSave: (itemDescritorKit) {
                                                setState(() {
                                                  listaDeItens
                                                      .add(itemDescritorKit);
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
                                      }),
                                    },
                                  ),
                                ),
                              },
                              UploadButtonWidget(
                                placeholder: 'Anexar Imagem',
                                imageSelected: (value1, value2) {
                                  salvarImagem(value1);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir Imagem',
                                onPressed: kitDescritor.imagem == null
                                    ? null
                                    : () => {excluirImagem()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir Imagem',
                                documentoString: kitDescritor.imagem,
                                documentName: 'arquivo sem nome.jpg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    if (kitDescritor.cod != null && kitDescritor.cod != 0)
                      CustomPopupMenuWidget(
                        items: [
                          CustomPopupItemHistoryModel.getHistoryItem(
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
                            kitDescritor = KitDescritorModel.empty();
                            listaDeItens = [];
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
          );
        },
      ),
    );
  }

  void salvarImagem(String value) {
    setState(() {
      kitDescritor.imagem = value;
    });
  }

  void excluirImagem() {
    setState(() {
      kitDescritor.imagem = null;
    });
  }

  void salvar() {
    if (!txtNome.valid || !txtDescricao.valid) {
      return;
    }

    // final registrarItemDescritorKit = <ItemDescritorKitModel>[];

    // for (final itemDescritorKit in listaDeItens) {
    //   final descritorSave = ItemDescritorKitModel(
    //     cod: 0,
    //     codInstituicao: 0,
    //     codDescritorItem: itemDescritorKit.codDescritorItem,
    //     codDescritorKit: kitDescritor.cod,
    //     quantidade: itemDescritorKit.quantidade,
    //     tstamp: '',
    //     ultimaAlteracao: null,
    //   );
    //   registrarItemDescritorKit.add(descritorSave);
    // }

    // kitDescritor.itensDescritorKits = registrarItemDescritorKit;

    if (kitDescritor.codTipoProcessoUrgencia == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Informe o tipo de processo para urgência',
      );
      return;
    }
    cubit.save(kitDescritor);
  }
}

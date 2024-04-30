import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/embalagem/embalagem_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/grupo_material/grupo_material_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tamanho/tamanho_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_image.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_itens_consignados.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_state.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/delete_image_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorPageFrm extends StatefulWidget {
  const ItemDescritorPageFrm({
    Key? key,
    required this.itemDescritor,
  }) : super(key: key);

  final ItemDescritorModel itemDescritor;

  @override
  State<ItemDescritorPageFrm> createState() =>
      _ItemDescritorPageFrmState(itemDescritor: itemDescritor);
}

class _ItemDescritorPageFrmState extends State<ItemDescritorPageFrm> {
  _ItemDescritorPageFrmState({required this.itemDescritor});
  late final GrupoMaterialCubit grupoMaterialCubit;
  late final EmbalagemCubit embalagemCubit;
  late final CentroCustoCubit centroCustoCubit;
  late final ProcessoTipoCubit processoTipoCubit;
  late final TamanhoCubit tamanhoCubit;
  final TextEditingController descricaoCurtaController =
      TextEditingController();
  final TextEditingController cmController = TextEditingController();
  late String titulo;
  ItemDescritorModel itemDescritor;

  late final ItemDescritorPageFrmCubit cubit = ItemDescritorPageFrmCubit(
    itemDescritorModel: itemDescritor,
    service: ItemDescritorService(),
  );

  late final TextFieldStringWidget txtDescricaoCurta = TextFieldStringWidget(
    placeholder: 'Descrição Curta',
    onChanged: (String? str) {
      itemDescritor.descricaoCurta = txtDescricaoCurta.text;
      _updateDescricaoCompleta();
    },
  );

  late final TextFieldNumberWidget txtCM = TextFieldNumberWidget(
    placeholder: '(CM)',
    onChanged: (String? str) {
      itemDescritor.cm = double.parse(txtCM.text);
      _updateDescricaoCompleta();
    },
  );

  late final TextFieldNumberWidget txtPeso = TextFieldNumberWidget(
    placeholder: 'Peso (g)',
    onChanged: (String? str) {
      itemDescritor.peso = double.parse(txtPeso.text);
    },
  );

  late final TextFieldStringWidget txtDescricaoCompleta = TextFieldStringWidget(
    placeholder: 'Descrição Completa',
    onChanged: (String? str) {
      itemDescritor.descricaoCompleta = txtDescricaoCompleta.text;
    },
  );

  late final TextFieldNumberWidget txtVolume = TextFieldNumberWidget(
    placeholder: 'Volume (cm3)',
    onChanged: (String? str) {
      itemDescritor.volume = double.parse(txtPeso.text);
    },
  );

  late final TextFieldNumberWidget txtVal1 = TextFieldNumberWidget(
    placeholder: '=',
    onChanged: (String? str) {
      _updateVolume();
    },
  );

  late final TextFieldNumberWidget txtVal2 = TextFieldNumberWidget(
    placeholder: 'X',
    onChanged: (String? str) {
      _updateVolume();
    },
  );

  late final TextFieldNumberWidget txtVal3 = TextFieldNumberWidget(
    placeholder: 'X',
    onChanged: (String? str) {
      _updateVolume();
    },
  );

  late final TextFieldStringWidget txtLimiteProcesso = TextFieldStringWidget(
    placeholder: 'Limite Processos',
    onChanged: (String? str) {
      itemDescritor.limiteProcessos = int.parse(txtLimiteProcesso.text);
    },
  );

  @override
  void initState() {
    grupoMaterialCubit = GrupoMaterialCubit();
    grupoMaterialCubit.loadAll();
    embalagemCubit = EmbalagemCubit();
    embalagemCubit.loadAll();
    centroCustoCubit = CentroCustoCubit();
    centroCustoCubit.loadAll();
    processoTipoCubit = ProcessoTipoCubit();
    processoTipoCubit.loadAll();
    tamanhoCubit = TamanhoCubit();
    tamanhoCubit.loadAll();

    txtDescricaoCurta.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 60) {
        return 'Pode ter no máximo 60 caracteres';
      }
      return '';
    });

    txtDescricaoCompleta.addValidator((String str) {
      if (str.length > 250) {
        return 'Pode ter no máximo 250 caracteres';
      }
      return '';
    });

    txtLimiteProcesso.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });

    txtVal1.addValidator((String str) {
      if (str == '0') {
        return 'Não é possível multiplicar por zero';
      }
      return '';
    });

    txtVal2.addValidator((String str) {
      if (str == '0') {
        return 'Não é possível multiplicar por zero';
      }
      return '';
    });

    txtVal3.addValidator((String str) {
      if (str == '0') {
        return 'Não é possível multiplicar por zero';
      }
      return '';
    });
    setFields();
    super.initState();
  }

  void _updateDescricaoCompleta() {
    final descricaoCurta = txtDescricaoCurta.text;
    final cm = txtCM.text;

    if (descricaoCurta.isNotEmpty && cm.isNotEmpty) {
      txtDescricaoCompleta.text = '$descricaoCurta - $cm';
      itemDescritor.descricaoCompleta = txtDescricaoCompleta.text;
    } else if (descricaoCurta.isNotEmpty && cm.isEmpty) {
      txtDescricaoCompleta.text = '$descricaoCurta';
      itemDescritor.descricaoCompleta = txtDescricaoCompleta.text;
    } else if (descricaoCurta.isEmpty && cm.isNotEmpty) {
      txtDescricaoCompleta.text = '$cm';
      itemDescritor.descricaoCompleta = txtDescricaoCompleta.text;
    }
  }

  void _updateVolume() {
    final val1 = double.tryParse(txtVal1.text) ?? 0;
    final val2 = double.tryParse(txtVal2.text) ?? 0;
    final val3 = double.tryParse(txtVal3.text) ?? 0;

    final volume = val1 * val2 * val3;
    txtVolume.text = volume.toString();
    itemDescritor.volume = volume;
  }

  void setFields() {
    txtDescricaoCurta.text = itemDescritor.descricaoCurta.toString();
    txtDescricaoCompleta.text = itemDescritor.descricaoCompleta.toString();
    descricaoCurtaController.text = itemDescritor.descricaoCurta.toString();
    cmController.text = itemDescritor.cm.toString();

    if (itemDescritor.cm == 0 || itemDescritor.cm == null) {
      txtCM.text = '';
    } else {
      txtCM.text = itemDescritor.cm.toString();
    }

    if (itemDescritor.peso == 0 || itemDescritor.peso == null) {
      txtPeso.text = '';
    } else {
      txtPeso.text = itemDescritor.peso.toString();
    }

    if (itemDescritor.volume == 0 || itemDescritor.volume == null) {
      txtVolume.text = '';
    } else {
      txtVolume.text = itemDescritor.volume.toString();
    }

    if (itemDescritor.limiteProcessos == null) {
      txtLimiteProcesso.text = '';
    } else {
      txtLimiteProcesso.text = itemDescritor.limiteProcessos.toString();
    }

    titulo = 'Cadastro de Descritor de Item';
    if (itemDescritor.cod != 0) {
      titulo =
          'Edição do Descritor de Item: ${itemDescritor.cod} - ${itemDescritor.descricaoCurta}';
    }
  }

  late Future Function() commitEditGridMethod;
  late void Function() setStateGridMethod;
  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    Size size = MediaQuery.of(context).size;
    return BlocListener<ItemDescritorPageFrmCubit, ItemDescritorPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<ItemDescritorPageFrmCubit, ItemDescritorPageFrmState>(
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
                maxWidth: size.width * .5,
                minHeight: size.height * .8,
                maxHeight: size.height * .8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricaoCurta,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<GrupoMaterialCubit,
                          List<GrupoMaterialModel>>(
                        bloc: grupoMaterialCubit,
                        builder: (context, gruposMateriais) {
                          gruposMateriais.sort(
                            (a, b) => a.nome!.compareTo(b.nome!),
                          );
                          GrupoMaterialModel? grupoMaterial = gruposMateriais
                              .where(
                                (element) =>
                                    element.cod == itemDescritor.codGrupoItem,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: grupoMaterial,
                            sourceList: gruposMateriais
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) =>
                                itemDescritor.codGrupoItem = value.cod!,
                            placeholder: 'Grupo Item',
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtCM,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtPeso,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtDescricaoCompleta,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtVolume,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: txtVal1,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: txtVal2,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: txtVal3,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtLimiteProcesso,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child:
                                BlocBuilder<TamanhoCubit, List<TamanhoModel>>(
                              bloc: tamanhoCubit,
                              builder: (context, tamanhos) {
                                tamanhos.sort(
                                  (a, b) => a.sigla!.compareTo(b.sigla!),
                                );
                                TamanhoModel? tamanho = tamanhos
                                    .where(
                                      (element) =>
                                          element.cod ==
                                          itemDescritor.tamanhoSigla,
                                    )
                                    .firstOrNull;
                                return DropDownWidget(
                                  initialValue: tamanho,
                                  sourceList: tamanhos,
                                  onChanged: (value) =>
                                      itemDescritor.tamanhoSigla = value.sigla!,
                                  placeholder: 'Tamanho',
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
                                    itemDescritor.codTipoProcessoNormal,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: processoTipo,
                            sourceList: processosTipos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) => itemDescritor
                                .codTipoProcessoNormal = value.cod!,
                            placeholder:
                                'Tipo do Processo para prioridade Normal',
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
                                    itemDescritor.codTipoProcessoUrgencia,
                              )
                              .firstOrNull;
                          return DropDownWidget(
                            initialValue: processoTipo,
                            sourceList: processosTipos
                                .where((element) => element.ativo == true)
                                .toList(),
                            onChanged: (value) => itemDescritor
                                .codTipoProcessoUrgencia = value.cod,
                            placeholder:
                                'Tipo do Processo para prioridade Urgência',
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
                    //                 itemDescritor.codTipoProcessoEmergencia,
                    //           )
                    //           .firstOrNull;
                    //       return DropDownWidget(
                    //         initialValue: processoTipo,
                    //         sourceList: processosTipos
                    //             .where((element) => element.ativo == true)
                    //             .toList(),
                    //         onChanged: (value) => itemDescritor
                    //             .codTipoProcessoEmergencia = value.cod!,
                    //         placeholder:
                    //             'Tipo do Processo para prioridade Emergência',
                    //       );
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
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
                                          itemDescritor.codEmbalagem,
                                    )
                                    .firstOrNull;
                                return DropDownWidget(
                                  initialValue: embalagem,
                                  sourceList: embalagens
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      itemDescritor.codEmbalagem = value.cod!,
                                  placeholder: 'Embalagem',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<CentroCustoCubit,
                                List<CentroCustoModel>>(
                              bloc: centroCustoCubit,
                              builder: (context, centrosCustos) {
                                CentroCustoModel? centroCusto = centrosCustos
                                    .where(
                                      (element) =>
                                          element.cod == itemDescritor.codCusto,
                                    )
                                    .firstOrNull;
                                return DropDownWidget(
                                  initialValue: centroCusto,
                                  sourceList: centrosCustos
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      itemDescritor.codCusto = value.cod!,
                                  placeholder: 'Valor do Peso',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: itemDescritor.ativo,
                                onClick: (value) => itemDescritor.ativo = value,
                                text: 'Ativo',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: itemDescritor.consignado,
                                onClick: (value) {
                                  itemDescritor.consignado = value;
                                  setStateGridMethod.call();
                                },
                                text: 'Material Consignado / Explante',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 16.0),
                          child: Row(
                            children: [
                              CustomCheckboxWidget(
                                checked: itemDescritor.complementar,
                                onClick: (value) =>
                                    itemDescritor.complementar = value,
                                text: 'Itens Complementares',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: ItemDescritorPageFrmImage(item: itemDescritor),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    ItemDescritorPageFrmItensConsignados(
                      itemDescritor: itemDescritor,
                      setGridStateMethod: (context, setGridStateBuilder) =>
                          setStateGridMethod = setGridStateBuilder,
                      commitMethod: (
                        context,
                        commitEditGridMethod,
                      ) =>
                          this.commitEditGridMethod = commitEditGridMethod,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 16 * paddingHorizontalScale,
                            spacing: 16 * paddingHorizontalScale,
                            children: [
                              UploadButtonWidget(
                                placeholder: 'Anexar Imagem',
                                imageSelected: (value1, value2) {
                                  salvarImage(value1);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir Imagem',
                                onPressed: itemDescritor.foto == null
                                    ? null
                                    : () => {excluirImagem()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir Imagem',
                                documentoString: itemDescritor.foto,
                                documentName: 'arquivo sem nome.jpg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 14.0)),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
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
                          itemDescritor = ItemDescritorModel.empty();
                          setFields();
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

  void salvarImage(String image) {
    setState(() {
      itemDescritor.foto = image;
    });
  }

  void excluirImagem() {
    setState(() {
      itemDescritor.foto = null;
    });
  }

  void salvar() async {
    if (itemDescritor.consignado == true) await commitEditGridMethod.call();
    if (!txtDescricaoCurta.valid ||
        !txtDescricaoCompleta.valid ||
        !txtLimiteProcesso.valid) return;
    bool valido = await validaItensConsignados();
    if(itemDescritor.codTipoProcessoUrgencia==null){
      ToastUtils.showCustomToastWarning(context, 'Informe o tipo de processo para urgência');
      return;
    }
    if (!valido) return;
    cubit.save(itemDescritor);
  }

  Future<bool> validaItensConsignados() async {
    if (itemDescritor.consignado != true) return true;
    if (itemDescritor.itensDescritoresConsignados == null ||
        itemDescritor.itensDescritoresConsignados!.isEmpty) {
      await ErrorUtils.showErrorDialog(
        context,
        [
          'O Descritor está marcado como consignado, informe os itens que o compoem',
        ],
      );
      return false;
    }
    for (ItemDescritorConsignadoModel item
        in itemDescritor.itensDescritoresConsignados!) {
      if (item.descricao == null || item.descricao!.isEmpty) {
        await ErrorUtils.showErrorDialog(
          context,
          [
            'Existem itens que compoem o descritor cosignado sem descrição e é obrigatória, informe e tente novamente',
          ],
        );
        return false;
      } else if (item.quantidade == null) {
        await ErrorUtils.showErrorDialog(
          context,
          [
            'Existem itens que compoem o descritor cosignado sem quantidade e é obrigatória, informe e tente novamente',
          ],
        );
        return false;
      }
    }
    return true;
  }
}

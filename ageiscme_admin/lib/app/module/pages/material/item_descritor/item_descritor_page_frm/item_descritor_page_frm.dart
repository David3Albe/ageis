import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/centro_custo/centro_custo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/embalagem/embalagem_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/grupo_material/grupo_material_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tamanho/tamanho_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_image.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_itens_consignados.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm_state.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorPageFrm extends StatefulWidget {
  const ItemDescritorPageFrm({
    Key? key,
    required this.itemDescritor,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final ItemDescritorModel itemDescritor;
  final void Function(String) onSaved;
  final void Function() onCancel;

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
    placeholder: 'Descrição Curta *',
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
    placeholder: 'Limite Processos *',
    onChanged: (String? str) {
      itemDescritor.limiteProcessos =
          str == null || str.isEmpty ? null : int.parse(txtLimiteProcesso.text);
    },
  );

  late bool Function() validateTipoProcessoNormal;
  late bool Function() validateTipoProcessoUrgencia;
  late bool Function() validateGrupoMaterial;
  late bool Function() validateEmbalagem;

  final ScrollController scroll = ScrollController();

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

    txtLimiteProcesso.text = itemDescritor.limiteProcessos?.toString() ?? '';

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
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ItemDescritorPageFrmCubit, ItemDescritorPageFrmState>(
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
                        maxWidth: size.width * .5,
                        minHeight: size.height * .8,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricaoCurta,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<GrupoMaterialCubit,
                                  GrupoMaterialState>(
                                bloc: grupoMaterialCubit,
                                builder: (context, state) {
                                  if (state.loading) {
                                    return const Center(
                                      child: LoadingWidget(),
                                    );
                                  }
                                  List<GrupoMaterialModel> gruposMateriais =
                                      state.grupoMateriais;
                                  gruposMateriais.sort(
                                    (a, b) => a.nome!.compareTo(b.nome!),
                                  );
                                  GrupoMaterialModel? grupoMaterial =
                                      gruposMateriais
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                itemDescritor.codGrupoItem,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget(
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validateGrupoMaterial =
                                                validateMethodBuilder,
                                    initialValue: grupoMaterial,
                                    sourceList: gruposMateriais
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    textFunction: (p0) => p0.GetGrupoNomeText(),
                                    onChanged: (value) =>
                                        itemDescritor.codGrupoItem = value?.cod,
                                    placeholder: 'Grupo Item *',
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
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, left: 4),
                                    child: const Text(
                                      '0 = Ilimitado',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
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
                                        List<TamanhoModel> tamanhos =
                                            state.tamanhos;
                                        tamanhos.sort(
                                          (a, b) =>
                                              a.sigla!.compareTo(b.sigla!),
                                        );
                                        TamanhoModel? tamanho = tamanhos
                                            .where(
                                              (element) =>
                                                  element.cod ==
                                                  itemDescritor.tamanhoSigla,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          initialValue: tamanho,
                                          sourceList: tamanhos,
                                          onChanged: (value) => itemDescritor
                                              .tamanhoSigla = value?.sigla,
                                          placeholder: 'Tamanho',
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                        );
                                      },
                                    ),
                                  ),
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
                                                itemDescritor
                                                    .codTipoProcessoNormal,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget(
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validateTipoProcessoNormal =
                                                validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    initialValue: processoTipo,
                                    sourceList: processosTipos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    onChanged: (value) => itemDescritor
                                        .codTipoProcessoNormal = value?.cod,
                                    placeholder:
                                        'Tipo do Processo para prioridade Normal *',
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
                                                itemDescritor
                                                    .codTipoProcessoUrgencia,
                                          )
                                          .firstOrNull;
                                  return DropDownSearchWidget(
                                    initialValue: processoTipo,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validateTipoProcessoUrgencia =
                                                validateMethodBuilder,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    sourceList: processosTipos
                                        .where(
                                          (element) => element.ativo == true,
                                        )
                                        .toList(),
                                    onChanged: (value) => itemDescritor
                                        .codTipoProcessoUrgencia = value?.cod,
                                    placeholder:
                                        'Tipo do Processo para prioridade Urgência *',
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
                                        EmbalagemState>(
                                      bloc: embalagemCubit,
                                      builder: (context, state) {
                                        if (state.loading == true) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        List<EmbalagemModel> embalagens =
                                            state.embalagens;
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
                                        return DropDownSearchWidget(
                                          initialValue: embalagem,
                                          validator: (val) => val == null
                                              ? 'Obrigatório'
                                              : null,
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              validateEmbalagem =
                                                  validateMethodBuilder,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          sourceList: embalagens
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
                                              .toList(),
                                          onChanged: (value) => itemDescritor
                                              .codEmbalagem = value?.cod,
                                          placeholder: 'Embalagem *',
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: BlocBuilder<CentroCustoCubit,
                                        CentroCustoState>(
                                      bloc: centroCustoCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }

                                        CentroCustoModel? centroCusto =
                                            state.centrosCusto
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      itemDescritor.codCusto,
                                                )
                                                .firstOrNull;
                                        return DropDownSearchWidget(
                                          initialValue: centroCusto,
                                          sourceList: state.centrosCusto
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
                                              .toList(),
                                          onChanged: (value) => itemDescritor
                                              .codCusto = value?.cod,
                                          placeholder: 'Valor do Peso',
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
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
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 16.0,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckboxWidget(
                                        checked: itemDescritor.ativo,
                                        onClick: (value) =>
                                            itemDescritor.ativo = value,
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
                                        checked: itemDescritor.consignado,
                                        onClick: (value) {
                                          itemDescritor.consignado = value;
                                          setStateGridMethod.call();
                                          if (value) {
                                            itemDescritor.limiteProcessos = 1;
                                            txtLimiteProcesso.text = '1';
                                          }
                                        },
                                        text: 'Material Consignado / Explante',
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
                              child: ItemDescritorPageFrmImage(
                                item: itemDescritor,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            ItemDescritorPageFrmItensConsignados(
                              itemDescritor: itemDescritor,
                              setGridStateMethod:
                                  (context, setGridStateBuilder) =>
                                      setStateGridMethod = setGridStateBuilder,
                              commitMethod: (
                                context,
                                commitEditGridMethod,
                              ) =>
                                  this.commitEditGridMethod =
                                      commitEditGridMethod,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 14.0)),
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
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar Imagem',
                      salvarImagem,
                    ),
                    CustomPopupItemOpenDocModel.getOpenDocItem(
                      'Abrir Imagem',
                      context,
                      itemDescritor.foto,
                      'arquivo sem nome.Webp',
                    ),
                    CustomPopupItemModel(
                      text: 'Excluir Imagem',
                      onTap: excluirImagem,
                    ),
                    if (itemDescritor.cod != null && itemDescritor.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: itemDescritor.cod!,
                          termo: 'ITEM_DESCRITOR',
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
                        itemDescritor = ItemDescritorModel.empty();
                        setFields();
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

  void salvarImagem(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      itemDescritor.foto = imageNew.base64;
    });
  }

  void excluirImagem() {
    setState(() {
      itemDescritor.foto = null;
    });
  }

  void salvar() async {
    if (itemDescritor.consignado == true) await commitEditGridMethod.call();
    bool descricaoCurtaValid = txtDescricaoCurta.valid;
    bool descricaoCompletaValid = txtDescricaoCompleta.valid;
    bool limiteProcessoValid = txtLimiteProcesso.valid;
    bool tipoProcessoNormalValid = validateTipoProcessoNormal();
    bool tipoProcessoUrgenciaValid = validateTipoProcessoUrgencia();
    bool grupoMaterialValid = validateGrupoMaterial();
    bool embalagemValid = validateEmbalagem();
    if (!descricaoCurtaValid) {
      scroll.jumpTo(0);
    } else if (!grupoMaterialValid) {
      scroll.jumpTo(50);
    } else if (!limiteProcessoValid) {
      scroll.jumpTo(250);
    } else if (!tipoProcessoNormalValid) {
      scroll.jumpTo(300);
    } else if (!tipoProcessoUrgenciaValid) {
      scroll.jumpTo(350);
    } else if (!embalagemValid) {
      scroll.jumpTo(350);
    }
    if (!descricaoCurtaValid ||
        !descricaoCompletaValid ||
        !limiteProcessoValid ||
        !tipoProcessoNormalValid ||
        !tipoProcessoUrgenciaValid ||
        !grupoMaterialValid ||
        !embalagemValid) return;
    bool valido = await validaItensConsignados();
    if (!valido) return;
    cubit.save(itemDescritor, widget.onSaved);
  }

  Future<bool> validaItensConsignados() async {
    if (itemDescritor.consignado != true) return true;
    if (itemDescritor.itensDescritoresConsignados == null ||
        itemDescritor.itensDescritoresConsignados!.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'O Descritor está marcado como consignado, informe os itens que o compoem',
      );
      return false;
    }
    for (ItemDescritorConsignadoModel item
        in itemDescritor.itensDescritoresConsignados!) {
      if (item.descricao == null || item.descricao!.isEmpty) {
        ToastUtils.showCustomToastWarning(
          context,
          'Existem itens que compoem o descritor cosignado sem descrição e é obrigatória, informe e tente novamente',
        );
        return false;
      } else if (item.quantidade == null) {
        ToastUtils.showCustomToastWarning(
          context,
          'Existem itens que compoem o descritor cosignado sem quantidade e é obrigatória, informe e tente novamente',
        );
        return false;
      }
    }
    return true;
  }
}

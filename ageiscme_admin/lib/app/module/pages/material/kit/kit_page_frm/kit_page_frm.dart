import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_adicionar_item/kit_page_frm_adicionar_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_remover_item/kit_page_frm_remover_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_repor_item/kit_page_frm_repor_item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm_state.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_impressoes/dto/kit_tag_print/kit_tag_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_print_dto.dart';
import 'package:ageiscme_impressoes/prints/kit_tag_printer/kit_tag_printer_controller.dart';
import 'package:ageiscme_impressoes/prints/processo_preparation_printer/processo_preparation_printer_controller.dart';
import 'package:ageiscme_models/dto/kit/kit_etiqueta_preparo/kit_etiqueta_preparo_dto.dart';
import 'package:ageiscme_models/dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_kit_response/kit_etiqueta_preparo_kit_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/query_dialog/query_dialog_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPageFrm extends StatefulWidget {
  const KitPageFrm({
    Key? key,
    required this.kit,
    required this.kitCorCubit,
  }) : super(key: key);

  final KitModel kit;
  final KitCorCubit kitCorCubit;

  @override
  State<KitPageFrm> createState() => _KitPageFrmState(kit: kit);
}

class _KitPageFrmState extends State<KitPageFrm> {
  _KitPageFrmState({required this.kit});

  late String titulo;
  KitModel kit;

  late final KitPageFrmCubit cubit = KitPageFrmCubit(
    kitModel: kit,
    service: KitService(),
  );

  late final TextFieldStringWidget txtCodBarra = TextFieldStringWidget(
    placeholder: 'Código de Barras',
    readOnly: true,
  );

  late final TextFieldStringWidget txtRestricao = TextFieldStringWidget(
    placeholder: 'Restrição',
    onChanged: (String? str) {
      kit.restricao = txtRestricao.text;
    },
  );

  late final TextFieldStringWidget txtConjuntoAtual = TextFieldStringWidget(
    placeholder: 'Conjunto Atual',
    readOnly: true,
  );

  late final TextFieldStringWidget txtPreparo = TextFieldStringWidget(
    placeholder: 'Sit. Preparo',
    readOnly: true,
    onChanged: (String str) {
      kit.preparo = str;
    },
  );

  late final TextFieldNumberWidget txtCodEmbalagem = TextFieldNumberWidget(
    placeholder: 'Embalagem',
    readOnly: true,
    onChanged: (String str) {
      kit.codEmbalagem = str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldNumberWidget txtProcessoLeitura = TextFieldNumberWidget(
    placeholder: 'Leitura',
    readOnly: true,
    onChanged: (String str) {
      kit.codProcessoLeitura = str.isEmpty ? null : int.parse(str);
    },
  );

  @override
  void initState() {
    txtRestricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    super.initState();
  }

  void setFields() {
    txtCodBarra.text = kit.codBarra.toString();
    txtPreparo.text = kit.preparo.toString();
    txtCodEmbalagem.text = kit.codEmbalagem?.toString() ?? '';
    txtConjuntoAtual.text = kit.codConjunto?.toString() ?? '';
    txtProcessoLeitura.text = kit.codProcessoLeitura?.toString() ?? '';
    txtRestricao.text = kit.restricao?.toString() ?? '';

    titulo = 'Cadastro de Kits';
    if (kit.cod != 0) {
      titulo = 'Edição do Kit: ${kit.cod} - ${kit.codBarra}';
    }
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<KitPageFrmCubit, KitPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<KitPageFrmCubit, KitPageFrmState>(
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
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropDownSearchApiWidget<
                                KitDescritorDropDownSearchResponseDTO>(
                              search: (str) async =>
                                  (await KitDescritorService()
                                          .getDropDownSearch(
                                    KitDescritorDropDownSearchDTO(
                                      numeroRegistros: 30,
                                      termoPesquisa: str,
                                      apenasAtivos: true,
                                    ),
                                  ))
                                      ?.$2 ??
                                  [],
                              textFunction: (kitDescritor) =>
                                  kitDescritor.Nome(),
                              initialValue: kit.descritor == null
                                  ? null
                                  : KitDescritorDropDownSearchResponseDTO(
                                      cod: kit.descritor!.cod!,
                                      nome: kit.descritor?.nome,
                                    ),
                              onChanged: (value) =>
                                  kit.codDescritorKit = value?.cod,
                              placeholder: 'Descritor do Kit',
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtCodBarra,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const Center(
                                    child: const LoadingWidget(),
                                  );
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;

                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor1,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor1 = value?.cod,
                                  placeholder: 'Cor 1',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const Center(child: LoadingWidget());
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor2,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor2 = value?.cod,
                                  placeholder: 'Cor 2',
                                );
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
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const LoadingWidget();
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor3,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor3 = value?.cod,
                                  placeholder: 'Cor 3',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: BlocBuilder<KitCorCubit, KitCorState>(
                              bloc: widget.kitCorCubit,
                              builder: (context, kitsCoresState) {
                                if (kitsCoresState.loading) {
                                  return const LoadingWidget();
                                }
                                List<KitCorModel> kitsCores =
                                    kitsCoresState.kitCores;
                                kitsCores.sort(
                                  (a, b) => a.nome!.compareTo(b.nome!),
                                );
                                KitCorModel? kitCor = kitsCores
                                    .where(
                                      (element) => element.cod == kit.codCor4,
                                    )
                                    .firstOrNull;
                                return DropDownSearchWidget(
                                  textFunction: (kit) =>
                                      kit.GetNomeKitCorText(),
                                  initialValue: kitCor,
                                  sourceList: kitsCores
                                      .where((element) => element.ativo == true)
                                      .toList(),
                                  onChanged: (value) =>
                                      kit.codCor4 = value?.cod,
                                  placeholder: 'Cor 4',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownWidget<KitSituacaoOption>(
                        initialValue: KitSituacaoOption.situacaoOptions
                            .where(
                              (element) => element.cod == kit.status,
                            )
                            .firstOrNull,
                        sourceList: KitSituacaoOption.situacaoOptions,
                        onChanged: (value) => kit.status = value.cod.toString(),
                        placeholder: 'Situação',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtRestricao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtConjuntoAtual,
                    ),
                    if (kit.itens!.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Itens deste Kit',
                          style: Fontes.getRoboto(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Builder(
                          builder: (context) {
                            List<ItemModel>? itens = [];

                            itens.addAll(kit.itens!);

                            return ListFieldWidget<ItemModel>(
                              sourceList: itens,
                              removeButton: false,
                              onItemSelected: (value) {},
                              onDoubleTap: (ItemModel item) =>
                                  _detalharItem(item.cod),
                              itemText: (value) {
                                return '${value.descricao}, ${value.idEtiqueta}';
                              },
                            );
                          },
                        ),
                      ),
                    },
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: txtPreparo,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtCodEmbalagem,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: txtProcessoLeitura,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (kit.cod != 0 && kit.cod != null)
                        CustomPopupItemModel(
                          text: 'Imprimir Etiqueta Kit',
                          onTap: _imprimirTagKit,
                        ),
                      if (kit.cod != 0 && kit.cod != null)
                        CustomPopupItemModel(
                          text: 'Imprimir Etiqueta Preparo',
                          onTap: _imprimirEtiquetaPreparo,
                        ),
                      if (kit.cod == 0 || kit.cod == null)
                        CustomPopupItemModel(
                          text: 'Montar Itens Kit',
                          onTap: adicionarItemKit,
                        ),
                      if (kit.cod != 0 && kit.cod != null)
                        CustomPopupItemModel(
                          text: 'Repor Item no Kit',
                          onTap: reporItemKit,
                        ),
                      if (kit.cod != 0 && kit.cod != null)
                        CustomPopupItemModel(
                          text: 'Remover Item do Kit',
                          onTap: removerItemKit,
                        ),
                      if (kit.cod != 0 && kit.cod != null)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: kit.cod!,
                            termo: 'KIT',
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
                          kit = KitModel.empty();
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

  Future removerItemKit() async {
    if (kit.cod == 0 || kit.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'O Kit precisa estar criado para remover itens.',
      );
      return;
    }
    bool? salvo = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return KitPageFrmRemoverItemPage(
          kit: kit,
        );
      },
    );
    if (salvo != true) return;
    await _carregarItensKit();
  }

  Future _carregarItensKit() async {
    List<ItemModel> itens = await ItemService().Filter(
      ItemFilter(
        codKit: kit.cod,
      ),
    );
    setState(() {
      kit.itens = itens;
    });
  }

  Future reporItemKit() async {
    if (kit.cod == 0 || kit.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'O Kit precisa estar criado para repor itens.',
      );
      return;
    }
    bool? salvo = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return KitPageFrmReporItemPage(
          kit: kit,
        );
      },
    );
    if (salvo != true) return;
    await _carregarItensKit();
  }

  Future _detalharItem(int? codItem) async {
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ItemPage(
            frmType: ItemPageFrmtype.Items,
            codItem: codItem,
          ),
        );
      },
    );
  }

  Future adicionarItemKit() async {
    List<ItemModel>? itensAdicionados = await showDialog<List<ItemModel>>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const KitPageFrmAdicionarItemPage();
      },
    );
    if (itensAdicionados == null || itensAdicionados.isEmpty) return;
    _adicionarItensKit(itensAdicionados);
  }

  void _adicionarItensKit(List<ItemModel> itens) {
    if (kit.itens == null) kit.itens = [];
    setState(() {
      kit.itens!.addAll(itens);
    });
  }

  void salvar() {
    if (!txtRestricao.valid) return;
    Function(KitModel)? afterSave;
    if (kit.codDescritorKit == null || kit.codDescritorKit == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'O campo Descritor do Kit é obrigatório.',
      );
      return;
    }
    if (kit.cod == 0 || kit.cod == null) {
      afterSave = (kitImprimir) => _imprimirTagKit(kitImprimir: kitImprimir);
    }
    cubit.save(kit, afterSave);
  }

  Future _imprimirTagKit({KitModel? kitImprimir}) async {
    KitTagPrinterController controller = KitTagPrinterController(
      context: context,
      dto: KitTagPrintDTO(
        codBarra: kitImprimir?.codBarra ?? kit.codBarra!,
      ),
    );
    LoadingController loading = LoadingController(context: context);
    await controller.print();
    loading.closeDefault();
  }

  Future _imprimirEtiquetaPreparo() async {
    (String, KitEtiquetaPreparoResponseDTO)? response = await KitService()
        .getEtiquetaPreparo(dto: KitEtiquetaPreparoDTO(codKit: kit.cod!));
    if (response == null) return;
    KitEtiquetaPreparoKitResponseDTO kitEtiqueta = response.$2.kit;
    ProcessoPreparationPrintDTO dto = ProcessoPreparationPrintDTO(
      actualTime: response.$2.dataLeitura,
      companyName: response.$2.instituicao.nome,
      userName: response.$2.usuario.nome,
      userDoc: response.$2.usuario.docClasse,
      kits: [
        ProcessoPreparationKitPrintDTO(
          nomeDescritor: kitEtiqueta.nome,
          nomeProprietario: kitEtiqueta.nomeProprietario,
          nomeProcesso: kitEtiqueta.nomeTipoProcesso,
          validadeEmbalagem: response.$2.validadeEmbalagem,
          tagId: kitEtiqueta.codBarra,
          urgency: kitEtiqueta.urgencia,
          itensLidos: kitEtiqueta.totalItensLidosKit,
          itensTotalKit: kitEtiqueta.totalItensLidosKit,
        ),
      ],
      itens: [],
    );
    ProcessoPreparationPrinterController controller =
        ProcessoPreparationPrinterController(
      context: context,
      dto: dto,
    );
    LoadingController loading = LoadingController(context: context);
    await controller.print();
    loading.closeDefault();
  }
}

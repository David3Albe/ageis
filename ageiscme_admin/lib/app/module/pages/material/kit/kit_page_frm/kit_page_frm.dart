import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_mesma_cor_page/kit_mesma_cor_page_widget.dart';
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
import 'package:ageiscme_models/dto/kit/mesma_cor/kit_mesma_cor_dto.dart';
import 'package:ageiscme_models/dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/mesma_cor/kit_mesma_cor_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_kit_response/kit_etiqueta_preparo_kit_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPageFrm extends StatefulWidget {
  const KitPageFrm({
    Key? key,
    required this.kit,
    required this.kitCorCubit,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final KitModel kit;
  final KitCorCubit kitCorCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

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

  late final TextFieldStringAreaWidget txtRestricao = TextFieldStringAreaWidget(
    placeholder: 'Observação',
    onChanged: (String? str) {
      kit.restricao = txtRestricao.text;
    },
  );

  // late final TextFieldStringWidget txtConjuntoAtual = TextFieldStringWidget(
  //   placeholder: 'Conjunto Atual',
  //   readOnly: true,
  // );

  late final TextFieldStringWidget txtPreparo = TextFieldStringWidget(
    placeholder: 'Sit. Preparo',
    readOnly: true,
    onChanged: (String str) {
      kit.preparo = str;
    },
  );

  late final DatePickerWidget dtpDataDescarte = DatePickerWidget(
    setDateValueBuilder: (context, method) => setDateDescarte = method,
    placeholder: 'Data Descarte',
    onDateSelected: (value) => kit.dataDescarte = value,
    initialValue: kit.dataDescarte,
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

  late bool Function() validateDescritor;
  late bool Function() validateSituacao;

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
    // txtConjuntoAtual.text = kit.codConjunto?.toString() ?? '';
    txtProcessoLeitura.text = kit.codProcessoLeitura?.toString() ?? '';
    txtRestricao.text = kit.restricao?.toString() ?? '';

    titulo = 'Cadastro de Kits';
    if (kit.cod != 0) {
      titulo = 'Edição do Kit: ${kit.cod} - ${kit.codBarra}';
    }
  }

  void Function(DateTime?)? setDateDescarte;
  final ScrollController scroll = ScrollController();

  late void Function(KitDescritorDropDownSearchResponseDTO?) setDescritor;
  late void Function(KitCorModel?) setCor1;
  late void Function(KitCorModel?) setCor2;
  late void Function(KitCorModel?) setCor3;
  late void Function(KitCorModel?) setCor4;
  late void Function(KitSituacaoOption?) setSituacao;

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<KitPageFrmCubit, KitPageFrmState>(
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
                                      setSelectedItemBuilder: (
                                        context,
                                        setSelectedItemMethod,
                                      ) =>
                                          setDescritor = setSelectedItemMethod,
                                      validateBuilder:
                                          (context, validateMethodBuilder) =>
                                              validateDescritor =
                                                  validateMethodBuilder,
                                      validator: (val) =>
                                          val == null ? 'Obrigatório' : null,
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
                                      placeholder: 'Descritor do Kit *',
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
                                    child:
                                        BlocBuilder<KitCorCubit, KitCorState>(
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
                                              (element) =>
                                                  element.cod == kit.codCor1,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setCor1 = setSelectedItemMethod,
                                          textFunction: (kit) =>
                                              kit.GetNomeKitCorText(),
                                          initialValue: kitCor,
                                          sourceList: kitsCores
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
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
                                    child:
                                        BlocBuilder<KitCorCubit, KitCorState>(
                                      bloc: widget.kitCorCubit,
                                      builder: (context, kitsCoresState) {
                                        if (kitsCoresState.loading) {
                                          return const Center(
                                            child: LoadingWidget(),
                                          );
                                        }
                                        List<KitCorModel> kitsCores =
                                            kitsCoresState.kitCores;
                                        kitsCores.sort(
                                          (a, b) => a.nome!.compareTo(b.nome!),
                                        );
                                        KitCorModel? kitCor = kitsCores
                                            .where(
                                              (element) =>
                                                  element.cod == kit.codCor2,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setCor2 = setSelectedItemMethod,
                                          textFunction: (kit) =>
                                              kit.GetNomeKitCorText(),
                                          initialValue: kitCor,
                                          sourceList: kitsCores
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
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
                                    child:
                                        BlocBuilder<KitCorCubit, KitCorState>(
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
                                              (element) =>
                                                  element.cod == kit.codCor3,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setCor3 = setSelectedItemMethod,
                                          textFunction: (kit) =>
                                              kit.GetNomeKitCorText(),
                                          initialValue: kitCor,
                                          sourceList: kitsCores
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
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
                                    child:
                                        BlocBuilder<KitCorCubit, KitCorState>(
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
                                              (element) =>
                                                  element.cod == kit.codCor4,
                                            )
                                            .firstOrNull;
                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setCor4 = setSelectedItemMethod,
                                          textFunction: (kit) =>
                                              kit.GetNomeKitCorText(),
                                          initialValue: kitCor,
                                          sourceList: kitsCores
                                              .where(
                                                (element) =>
                                                    element.ativo == true,
                                              )
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
                              child: DropDownSearchWidget<KitSituacaoOption>(
                                setSelectedItemBuilder: (
                                  context,
                                  setSelectedItemMethod,
                                ) =>
                                    setSituacao = setSelectedItemMethod,
                                validator: (val) =>
                                    val == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    validateSituacao = validateMethodBuilder,
                                textFunction: (p0) => p0.GetDropDownText(),
                                initialValue: KitSituacaoOption.situacaoOptions
                                    .where(
                                      (element) => element.cod == kit.status,
                                    )
                                    .firstOrNull,
                                sourceList: KitSituacaoOption.situacaoOptions,
                                onChanged: (value) =>
                                    kit.status = value?.cod.toString(),
                                placeholder: 'Situação *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: dtpDataDescarte,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtRestricao,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 5.0),
                            //   child: txtConjuntoAtual,
                            // ),
                            if (kit.itens != null && kit.itens!.isNotEmpty) ...{
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'Itens deste Kit  (${kit.itens!.length})',
                                  style: Fontes.getRoboto(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ListFieldWidget<ItemModel>(
                                  sourceList: kit.itens ?? [],
                                  removeButton: false,
                                  onItemSelected: (value) {},
                                  onDoubleTap: (ItemModel item) =>
                                      _detalharItem(item.cod),
                                  itemText: (value) {
                                    return '${value.descricao}, ${value.idEtiqueta}';
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
                  ),
                ],
              ),
            ),
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
                        title: 'Kit ${kit.cod}',
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
                    onPressed: salvar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CleanButtonWidget(
                    onPressed: () => {
                      setState(() {
                        kit = KitModel.empty();
                        setDateDescarte?.call(null);
                        setCor1(null);
                        setCor2(null);
                        setCor3(null);
                        setCor4(null);
                        setSituacao(null);
                        setDescritor(null);
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

  Future _detalharItem(
    int? codItem,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (codItem ?? 0).toString(),
      title: 'Cadastro/Edição Item - Kit ${kit.descritor?.descricao} ',
      widget: ItemPage(
        detailModalName:
            'Cadastro/Edição Item - Kit ${kit.descritor?.descricao}',
        frmType: ItemPageFrmtype.Items,
        afterDetail: () => WindowsHelper.RemoverWidget(chave),
        codItem: codItem,
      ),
    );
  }

  Future adicionarItemKit() async {
    List<ItemModel>? itensAdicionados = await showDialog<List<ItemModel>>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return KitPageFrmAdicionarItemPage(
          kit: kit,
        );
      },
    );
    _adicionarItensKit(itensAdicionados ?? []);
  }

  void _adicionarItensKit(List<ItemModel> itens) {
    if (kit.itens == null) kit.itens = [];
    setState(() {
      for (ItemModel item in itens) {
        if (kit.itens?.where((it) => it.cod == item.cod).firstOrNull != null) {
          continue;
        }
        kit.itens!.add(item);
      }
    });
  }

  void salvar() async {
    bool restricaoValid = txtRestricao.valid;
    bool descritorKitValid = validateDescritor();
    bool situacaoValid = validateSituacao();
    if (!descritorKitValid) {
      scroll.jumpTo(0);
    } else if (!situacaoValid) {
      scroll.jumpTo(150);
    }
    if (!restricaoValid || !descritorKitValid || !situacaoValid) return;
    if ((kit.cod == null || kit.cod == 0) && kit.itens == null ||
        kit.itens!.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não é possível adicionar um kit sem itens',
      );
      return;
    }
    bool? corIgual = await _validaKitsMesmaCor();
    if (corIgual != true) return;
    Function(KitModel)? afterSave;
    if (kit.cod == 0 || kit.cod == null) {
      afterSave = (kitImprimir) => _imprimirTagKit(kitImprimir: kitImprimir);
    }
    await cubit.save(kit, afterSave, widget.onSaved);
  }

  Future<bool?> _validaKitsMesmaCor() async {
    (String, KitMesmaCorResponseDTO)? result = await KitService().mesmaCor(
      dto: KitMesmaCorDTO(
        codCor1: kit.codCor1,
        codCor2: kit.codCor2,
        codCor3: kit.codCor3,
        codCor4: kit.codCor4,
        codKit: kit.cod,
      ),
    );
    if (result == null) return false;
    if (result.$2.kits.isEmpty) return true;
    return await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => KitMesmaCorPageWidget(mesmaCor: result.$2),
    );
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

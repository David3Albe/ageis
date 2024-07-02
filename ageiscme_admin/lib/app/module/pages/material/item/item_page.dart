import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm/item_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_impressao_rotulados/item_page_frm_impressao_rotulados.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/proprietario/proprietario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    super.key,
    required this.frmType,
    this.afterDetail,
    this.detailModalName = 'Cadastro/Edição Item',
    this.codItem,
  });

  final ItemPageFrmtype frmType;
  final int? codItem;
  final void Function()? afterDetail;
  final String detailModalName;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final List<CustomDataColumn> colunas = [
    // CustomDataColumn(
    //   text: 'Cód',
    //   field: 'cod',
    //   type: CustomDataColumnType.Number,
    // ),
    CustomDataColumn(text: 'Id Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Descritor',
      field: 'descritor',
      valueConverter: (obj) => obj?['descricaoCurta'] ?? '',
    ),
    CustomDataColumn(text: 'Fabricante', field: 'fabricante'),
    CustomDataColumn(text: 'Fornecedor', field: 'fornecedor'),
    CustomDataColumn(text: 'RMS', field: 'registroAnvisa'),
    CustomDataColumn(
      text: 'Validade',
      field: 'rmsValidade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Data Aquisição',
      field: 'dataAquisicao',
      type: CustomDataColumnType.Date,
    ),
  ];

  late final ItemPageCubit bloc;
  late final ItemService service;
  late final ProprietarioCubit proprietarioCubit;
  late final ItemFilter filter;

  @override
  void initState() {
    filter = ItemFilter.empty();
    filter.cod = widget.codItem;
    // filter.startDate =
    //     DateUtils.dateOnly(DateTime.now().add(const Duration(days: -31)));
    // filter.finalDate = DateUtils.dateOnly(DateTime.now());
    _defineFilter(filter);
    service = ItemService();
    proprietarioCubit = ProprietarioCubit();
    bloc = ItemPageCubit(service: service);
    bloc.loadItemFilter(filter).then((value) {
      int? codItem = filter.cod;
      filter.cod = null;
      ItemModel? item = bloc.state.itens.firstOrNull;
      if (item == null || codItem == null) return;
      WidgetsBinding.instance
          .addPostFrameCallback((_) => openModal(context, item));
    });
    super.initState();
  }

  void _defineFilter(ItemFilter filter) {
    filter.carregarDescritorResumido = true;
    filter.numeroRegistros = 500;
    filter.ordenarPorCodDecrescente = true;
    switch (widget.frmType) {
      case ItemPageFrmtype.Items:
        filter.apenasItensNaoConsignados = true;
        return;
      case ItemPageFrmtype.Consigned:
        filter.apenasItensConsignados = true;
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FilterButtonWidget(
              onPressed: () => {
                openModalFilter(context),
              },
            ),
            const Padding(padding: EdgeInsets.only(right: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  ItemModel.empty().copyWith(status: '1'),
                ),
              },
            ),
            const Spacer(),
            CustomPopupMenuWidget(
              items: [
                CustomPopupItemModel(
                  text: 'Imprimir Folha Rotulados',
                  onTap: imprimirFolhaRotulados,
                ),
              ],
            ),
          ],
        ),
        BlocListener<ItemPageCubit, ItemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ItemPageCubit, ItemPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    onEdit: (ItemModel objeto) =>
                        {openModal(context, ItemModel.copy(objeto))},
                    onDelete: (ItemModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.itens,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future openModalFilter(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            CustomAutocompleteWidget<ItemModel>(
              initialValue: filter.idEtiquetaContem,
              onChange: (str) => filter.idEtiquetaContem = str,
              onItemSelectedText: (item) => item.idEtiqueta ?? null,
              label: 'Item',
              title: (p0) => Text(p0.EtiquetaDescricaoText()),
              suggestionsCallback: (str) => ItemService().Filter(
                ItemFilter(numeroRegistros: 30, termoPesquisa: str),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
              initialValue: filter.codBarraKitContem,
              onChange: (str) => filter.codBarraKitContem = str,
              onItemSelectedText: (kit) => kit.codBarra,
              label: 'Kit',
              title: (p0) => Text(p0.CodBarraDescritorText()),
              suggestionsCallback: (str) async {
                return (await KitService().getDropDownSearchKits(
                      KitDropDownSearchDTO(
                        search: str,
                        numeroRegistros: 30,
                      ),
                    ))
                        ?.$2 ??
                    [];
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            TextFieldNumberWidget(
              startValue: filter.numeroRegistros,
              placeholder: 'Máx Reg.',
              onChanged: (str) => {filter.numeroRegistros = int.parse(str)},
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    if (filter.cod != null ||
        filter.numeroRegistros != null ||
        filter.codKit != null ||
        filter.idEtiquetaContem != null) {
      filter.startDate = null;
      filter.finalDate = null;
    }
    if (filter.numeroRegistros.toString().isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'Informe um limite de itens para buscar',
      );
      return;
    }
    await bloc.loadItemFilter(filter);
  }

  Future imprimirFolhaRotulados() async {
    ItemRotuladoResponseDTO response =
        await ItemService().getItensImpressaoRotulado();
    await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ItemPageFrmImpressaoRotulados(
          rotulado: response,
        );
      },
    );
  }

  void loadProprietarioCubit() async {
    if (!proprietarioCubit.state.loaded) {
      await proprietarioCubit.loadFilter(
        ProprietarioFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
          comecaCom:
              widget.frmType == ItemPageFrmtype.Consigned ? 'OPME' : null,
        ),
      );
      if (proprietarioCubit.state.proprietarios.isEmpty) {
        await proprietarioCubit.loadFilter(
          ProprietarioFilter(
            apenasAtivos: true,
            ordenarPorNomeCrescente: true,
          ),
        );
      }
    }
  }

  Future<ItemModel?> getFilter(ItemModel item) async {
    return service.FilterOne(
      ItemFilter(
        cod: item.cod,
        carregarKit: true,
        carregarDescritor: true,
        carregarUsuarios: true,
        carregarProprietario: true,
        carregarItensConsignado: widget.frmType == ItemPageFrmtype.Consigned,
      ),
    );
  }

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  Future openModal(
    BuildContext context,
    ItemModel item,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadProprietarioCubit();

    ItemModel? itemModel = item;
    if (item.cod != 0) {
      itemModel = await getFilter(
        item,
      );
      if (itemModel == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    } else {
      AuthenticationResultDTO? value = await recuperaUsuario();
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      item.codUsuarioCadastro = value.usuario!.cod;
      item.usuario = value.usuario;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: widget.detailModalName,
      widget: ItemPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (codItem) => onSaved(chave, codItem, itemModel!),
        proprietarioCubit: proprietarioCubit,
        item: itemModel,
        frmType: widget.frmType,
      ),
    );
    if (widget.afterDetail != null) widget.afterDetail!();
  }

  Future onSaved(
    int chave,
    int? codItem,
    ItemModel item,
  ) async {
    WindowsHelper.RemoverWidget(chave);
    if (codItem != null) {
      item.tstamp = null;
      await bloc.loadItemFilter(filter);
      await openModal(context, item);
      return;
    }
    await bloc.loadItemFilter(filter);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ItemModel item) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Confirma a remoção do  Item\n${item.cod} - ${item.descricao}',
      onConfirm: () => confirmDelete(item),
    );
  }

  void confirmDelete(ItemModel item) {
    bloc.delete(item);
  }

  void deleted(ItemPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadItemFilter(filter);
  }

  void onError(ItemPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Item que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

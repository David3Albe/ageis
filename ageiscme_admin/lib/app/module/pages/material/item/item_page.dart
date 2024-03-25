import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit/kit_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm/item_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_impressao_rotulados/item_page_frm_impressao_rotulados.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_frm_type.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/item_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/proprietario/proprietario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/item_rotulado_response/item_rotulado_response_dto.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.frmType});

  final ItemPageFrmtype frmType;

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
  late final KitCubit kitBloc;

  @override
  void initState() {
    filter = ItemFilter.empty();
    filter.startDate =
        DateUtils.dateOnly(DateTime.now().add(const Duration(days: -31)));
    filter.finalDate = DateUtils.dateOnly(DateTime.now());
    _defineFilter(filter);
    service = ItemService();
    proprietarioCubit = ProprietarioCubit();
    bloc = ItemPageCubit(service: service);
    kitBloc = KitCubit();
    kitBloc.loadAll();
    bloc.loadItemFilter(filter);
    super.initState();
  }

  void _defineFilter(ItemFilter filter) {
    filter.carregarDescritorResumido = true;
    filter.numeroRegistros = 500;
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
                  ItemModel.empty(),
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

  void openModalFilter(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              DatePickerWidget(
                placeholder: 'Data Inicio',
                onDateSelected: (value) => filter.startDate = value,
                initialValue: filter.startDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                placeholder: 'Data Término',
                onDateSelected: (value) => filter.finalDate = value,
                initialValue: filter.finalDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DropDownSearchApiWidget<ItemModel>(
                textFunction: (item) => item.EtiquetaDescricaoText(),
                initialValue: filter.itemFilter,
                search: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
                onChanged: (value) {
                  filter.itemFilter = value;
                  filter.cod = value?.cod;
                },
                placeholder: 'Item',
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<KitCubit, List<KitModel>>(
                bloc: kitBloc,
                builder: (context, kits) {
                  KitModel? kit = kits
                      .where(
                        (element) => element.cod == filter.codKit,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitModel>(
                    textFunction: (kit) => kit.CodBarraDescritorText(),
                    initialValue: kit,
                    sourceList: kits,
                    onChanged: (value) => filter.codKit = value?.cod,
                    placeholder: 'Kit',
                  );
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
        );
      },
    ).then((result) {
      if (result == true) {
        if (filter.cod != null ||
            filter.numeroRegistros != null ||
            filter.codKit != null) {
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
        bloc.loadItemFilter(filter);
      }
    });
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
        tStamp: item.tstamp,
        carregarKit: true,
        carregarDescritor: true,
        carregarUsuarios: true,
        carregarProprietario: true,
        carregarItensConsignado: widget.frmType == ItemPageFrmtype.Consigned,
      ),
    );
  }

  Future<void> openModal(BuildContext context, ItemModel item) async {
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
    }
    loading.close(context, mounted);

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ItemPageFrm(
          proprietarioCubit: proprietarioCubit,
          item: itemModel!,
          frmType: widget.frmType,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadItemFilter(filter);
  }

  void delete(BuildContext context, ItemModel item) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do  Item\n${item.cod} - ${item.descricao}',
    );
    if (confirmacao) bloc.delete(item);
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

import 'package:ageiscme_admin/app/module/pages/material/item_descritor/cubits/item_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/filter/item_descritor_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_frm/item_descritor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/item_descritor/item_descritor_page_state.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorPage extends StatefulWidget {
  const ItemDescritorPage({super.key});

  @override
  State<ItemDescritorPage> createState() => _ItemDescritorPageState();
}

class _ItemDescritorPageState extends State<ItemDescritorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Descrição Curta', field: 'descricaoCurta'),
    CustomDataColumn(
      text: '(CM)',
      field: 'cm',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Peso (g)',
      field: 'peso',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Volume (cm3)',
      field: 'volume',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Grupo Item',
      field: 'grupoMaterial',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(text: 'Tamanho', field: 'tamanhoSigla'),
    CustomDataColumn(
      text: 'Embalagem',
      field: 'embalagem',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(
      text: 'Valor Peso',
      field: 'centroCusto',
      valueConverter: (value) => value != null ? value['descricao'] : '',
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final ItemDescritorPageCubit bloc;
  late final ItemDescritorService service;
  late final ItemDescritorCubitFilter cubitFilter;

  @override
  void initState() {
    service = ItemDescritorService();
    bloc = ItemDescritorPageCubit(service: service);
    cubitFilter = ItemDescritorCubitFilter();
    bloc.getScreenData(cubitFilter.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubitFilter),
        BlocProvider.value(value: bloc),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ItemDescritorButtonFilterWidget(),
              const Padding(padding: EdgeInsets.only(left: 8)),
              AddButtonWidget(
                onPressed: () => {
                  openModal(
                    context,
                    ItemDescritorModel.empty(),
                  ),
                },
              ),
            ],
          ),
          BlocConsumer<ItemDescritorPageCubit, ItemDescritorPageState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.deleted) deleted(state);
              if (state.error.isNotEmpty) onError(state);
            },
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
                    filterOnlyActives: true,
                    onEdit: (ItemDescritorModel objeto) =>
                        {openModal(context, ItemDescritorModel.copy(objeto))},
                    onDelete: (ItemDescritorModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.itensDescritor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<ItemDescritorModel?> getFilter(
    ItemDescritorModel itemDescritor,
  ) async {
    return service.FilterOne(
      ItemDescritorFilter(
        cod: itemDescritor.cod,
        tStamp: itemDescritor.tstamp,
        carregarImagem: true,
        carregarItensConsignados: true,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    ItemDescritorModel itemDescritor,
  ) async {
    LoadingController loading = LoadingController(context: context);

    ItemDescritorModel? item = itemDescritor;
    if (itemDescritor.cod != 0) {
      item = await getFilter(
        itemDescritor,
      );
      if (item == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Descritor de Item',
      widget: ItemDescritorPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        itemDescritor: item,
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    ItemDescritorFilter filter = context.read<ItemDescritorCubitFilter>().state;
    await bloc.getScreenData(filter);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ItemDescritorModel itemDescritor) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Descritor de Item\n${itemDescritor.cod} - ${itemDescritor.descricaoCurta}',
      onConfirm: () => confirmDelete(itemDescritor),
    );
  }

  void confirmDelete(ItemDescritorModel itemDescritor) async {
    bloc.delete(itemDescritor);
  }

  void deleted(ItemDescritorPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadItemDescritor();
  }

  void onError(ItemDescritorPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro do Item Descritor que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

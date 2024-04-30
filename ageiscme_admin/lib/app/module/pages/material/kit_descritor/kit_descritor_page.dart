import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/item_descritor/item_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/cubits/kit_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/filter/kit_descritor_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_frm/kit_descritor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_state.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitDescritorPage extends StatefulWidget {
  KitDescritorPage({super.key});

  @override
  State<KitDescritorPage> createState() => _KitDescritorPageState();
}

class _KitDescritorPageState extends State<KitDescritorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(text: 'Tamanho', field: 'tamanhoSigla'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Prontuário Obrigatório',
      field: 'exigeProntuario',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final KitDescritorPageCubit bloc;
  late final KitDescritorService service;
  late final ProcessoTipoCubit processoTipoCubit;
  late final KitDescritorCubitFilter cubitFilter;
  late final ItemDescritorCubit itemDescritorCubit;

  @override
  void initState() {
    service = KitDescritorService();
    processoTipoCubit = ProcessoTipoCubit();
    itemDescritorCubit = ItemDescritorCubit();
    bloc = KitDescritorPageCubit(service: service);
    cubitFilter = KitDescritorCubitFilter();
    bloc.getScreenData(cubitFilter.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider.value(value: cubitFilter),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const KitDescritorButtonFilterWidget(),
              const Padding(padding: EdgeInsets.only(left: 8)),
              AddButtonWidget(
                onPressed: () => {
                  openModal(
                    context,
                    KitDescritorModel.empty(),
                  ),
                },
              ),
            ],
          ),
          BlocConsumer<KitDescritorPageCubit, KitDescritorPageState>(
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
                    onEdit: (KitDescritorModel objeto) => {
                      openModal(
                        context,
                        KitDescritorModel.copy(objeto),
                      ),
                    },
                    onDelete: (KitDescritorModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.kitsDescritor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void loadProcessoTipo() {
    if (!processoTipoCubit.state.loaded) {
      processoTipoCubit.loadFilter(
        ProcessoTipoFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  void loadItemDescritor() {
    if (!itemDescritorCubit.state.loaded) {
      itemDescritorCubit.loadFilter(
        ItemDescritorFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
          carregarImagem: false,
        ),
      );
    }
  }

  Future<KitDescritorModel?> getFilter(KitDescritorModel kitDescritor) async {
    return service.FilterOne(
      KitDescritorFilter(
        cod: kitDescritor.cod,
        carregarProcessoTipo: true,
        tStamp: kitDescritor.tstamp,
      ),
    );
  }

  void openModal(BuildContext context, KitDescritorModel kitDescritor) async {
    LoadingController loading = LoadingController(context: context);
    loadProcessoTipo();
    loadItemDescritor();

    KitDescritorModel? kit = kitDescritor;
    if (kitDescritor.cod != 0) {
      kit = await getFilter(
        kitDescritor,
      );
      if (kit == null) {
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
        return KitDescritorPageFrm(
          processoTipoCubit: processoTipoCubit,
          itemDescritorCubit: itemDescritorCubit,
          kitDescritor: kit!,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    await bloc.loadKitDescritor();
  }

  void delete(BuildContext context, KitDescritorModel kitDescritor) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Descritor de Kits\n${kitDescritor.cod} - ${kitDescritor.nome}',
    );
    if (confirmacao) bloc.delete(kitDescritor);
  }

  void deleted(KitDescritorPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadKitDescritor();
  }

  void onError(KitDescritorPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Descritor de Kit que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/item_descritor/item_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_tipo/processo_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/cubits/kit_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/filter/kit_descritor_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_frm/kit_descritor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_descritor/kit_descritor_page_state.dart';
import 'package:ageiscme_data/services/instituicao/instituicao_service.dart';
import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
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

class KitDescritorPage extends StatefulWidget {
  const KitDescritorPage({super.key});

  @override
  State<KitDescritorPage> createState() => _KitDescritorPageState();
}

class _KitDescritorPageState extends State<KitDescritorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
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
    carregar();
    super.initState();
  }

  Future carregar() async {
    await bloc.getScreenData(cubitFilter.state);
  }

  Future loadData(BuildContext context) async {
    KitDescritorPageCubit kitCubit = context.read<KitDescritorPageCubit>();
    KitDescritorCubitFilter filterCubit =
        context.read<KitDescritorCubitFilter>();
    KitDescritorFilter dto = filterCubit.state;
    await kitCubit.getScreenData(dto);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider.value(value: cubitFilter),
      ],
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RefreshButtonWidget(
                    onPressed: () => loadData(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
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
                        orderDescendingFieldColumn: 'cod',
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
          );
        },
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
      ),
    );
  }

  Future openModal(
    BuildContext context,
    KitDescritorModel kitDescritor,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadProcessoTipo();
    loadItemDescritor();

    InstituicaoModel? instituicao = await InstituicaoService().findFirst();
    if (instituicao == null) {
      ErrorUtils.showOneErrorDialog(
        context,
        'É necessário ter uma instituição cadastrada para abrir o cadastro de descritor de kit',
      );
      return;
    }

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
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (kitDescritor.cod ?? 0).toString(),
      title: 'Cadastro/Edição Descritor de Kit',
      widget: KitDescritorPageFrm(
        instituicao: instituicao,
        onCancel: () => onCancel(chave),
        onSaved: (str, cod) => onSaved(str, cod, chave, context),
        processoTipoCubit: processoTipoCubit,
        itemDescritorCubit: itemDescritorCubit,
        kitDescritor: kit,
      ),
    );
  }

  Future onSaved(
    String message,
    int cod,
    int chave,
    BuildContext context,
  ) async {
    WindowsHelper.RemoverWidget(chave);
    await openModal(context, KitDescritorModel.empty().copyWith(cod: cod));
    ToastUtils.showCustomToastSucess(context, message);
    await carregar();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, KitDescritorModel kitDescritor) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Descritor de Kits\n${kitDescritor.cod} - ${kitDescritor.nome}',
      onConfirm: () => confirmDelete(kitDescritor),
    );
  }

  void confirmDelete(KitDescritorModel kitDescritor) async {
    bloc.delete(kitDescritor);
  }

  Future deleted(KitDescritorPageState state) async {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    await carregar();
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

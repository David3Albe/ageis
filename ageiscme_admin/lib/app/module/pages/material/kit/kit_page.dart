import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/cubits/kit_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/filter/kit_filter_button_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_state.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:ageiscme_models/filters/kit/kit_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_kit/kit_search_kit_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_response_dto.dart';
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
import 'package:ageiscme_models/filters/kit_cor/kit_cor_filter.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPage extends StatefulWidget {
  const KitPage({super.key});

  @override
  State<KitPage> createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {
  KitSearchResponseDTO? response;

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Código Barras',
      field: 'codBarra',
      incluirApostrofo: true,
    ),
    CustomDataColumn(
      text: 'Descrição',
      field: 'codDescritor',
      valueConverter: (value) => response?.descritores[value]?.descricao ?? '',
    ),
    CustomDataColumn(
      text: 'Cor 1',
      field: 'codCor1',
      valueConverter: (value) => response?.cores[value]?.descricao ?? '',
    ),
    CustomDataColumn(
      text: 'Cor 2',
      field: 'codCor2',
      valueConverter: (value) => response?.cores[value]?.descricao ?? '',
    ),
    CustomDataColumn(
      text: 'Cor 3',
      field: 'codCor3',
      valueConverter: (value) => response?.cores[value]?.descricao ?? '',
    ),
    CustomDataColumn(
      text: 'Cor 4',
      field: 'codCor4',
      valueConverter: (value) => response?.cores[value]?.descricao ?? '',
    ),
    CustomDataColumn(
      text: 'Situação',
      field: 'status',
      valueConverter: (dynamic value) =>
          KitSituacaoOption.getOpcaoFromId(value),
    ),
  ];

  late final KitPageCubit bloc;
  late final KitService service;
  late final KitCorCubit kitCorCubit;
  late final KitCubitFilter kitFilterCubit;

  @override
  void initState() {
    service = KitService();
    kitCorCubit = KitCorCubit();
    // kitDescritorCubit = KitDescritorCubit();
    bloc = KitPageCubit(service: service);
    kitFilterCubit = KitCubitFilter();
    bloc.searchKits(kitFilterCubit.state);
    super.initState();
  }

  Future refresh() async {
    KitPageCubit kitCubit = context.read<KitPageCubit>();
    KitCubitFilter filterCubit = context.read<KitCubitFilter>();
    KitSearchDTO dto = filterCubit.state;
    await kitCubit.searchKits(dto);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: kitFilterCubit),
        BlocProvider.value(value: bloc),
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
                    onPressed: () => refresh(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  const KitButtonFilterWidget(),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  AddButtonWidget(
                    onPressed: () => {
                      openModal(
                        context,
                        null,
                      ),
                    },
                  ),
                ],
              ),
              BlocConsumer<KitPageCubit, KitPageState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state.deleted) deleted(state);
                  if (state.error.isNotEmpty) onError(state);
                },
                builder: (context, state) {
                  response = state.response;
                  if (state.loading) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: PlutoGridWidget<KitSearchKitResponseDTO>(
                        orderDescendingFieldColumn: 'cod',
                        onEdit: (KitSearchKitResponseDTO objeto) => {
                          openModal(
                            context,
                            KitSearchKitResponseDTO.copy(objeto),
                          ),
                        },
                        onDelete: (KitSearchKitResponseDTO objeto) =>
                            {delete(context, objeto)},
                        columns: colunas,
                        items: state.response?.kits ?? [],
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

  void loadKitCorCubit() {
    if (!kitCorCubit.state.loaded) {
      kitCorCubit.loadFilter(
        KitCorFilter(
          apenasAtivos: true,
          ordernarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future<KitModel?> getFilter(KitSearchKitResponseDTO kit) async {
    return service.FilterOne(
      KitFilter(
        cod: kit.cod,
        carregarItens: true,
        carregarDescritor: true,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    KitSearchKitResponseDTO? kit,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadKitCorCubit();

    KitModel? kitModel = KitModel.empty().copyWith(status: '1', itens: []);
    if (kit != null && kit.cod != 0) {
      kitModel = await getFilter(
        kit,
      );
      if (kitModel == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (kitModel.cod ?? 0).toString(),
      title: 'Cadastro/Edição Kit',
      widget: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: kitCorCubit),
        ],
        child: KitPageFrm(
          onCancel: () => onCancel(chave),
          onSaved: (str) => onSaved(str, chave),
          kit: kitModel,
          kitCorCubit: kitCorCubit,
        ),
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    KitSearchDTO dto = kitFilterCubit.state;
    await bloc.searchKits(dto);
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, KitSearchKitResponseDTO kitBase) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Kit\n${kitBase.cod} - ${kitBase.codBarra}',
      onConfirm: () => confirmDelete(kitBase),
    );
  }

  void confirmDelete(KitSearchKitResponseDTO kitBase) async {
    KitModel kit = KitModel.empty();
    kit.cod = kitBase.cod;
    kit.tStamp = kitBase.tStamp;
    await bloc.delete(kit);
  }

  void deleted(KitPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    KitSearchDTO dto = kitFilterCubit.state;
    bloc.searchKits(dto);
  }

  void onError(KitPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Kit que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

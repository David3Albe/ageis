import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_cor/kit_cor_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit_descritor/kit_descritor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_frm/kit_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit/kit_page_state.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/filters/kit/kit_filter.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
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
import 'package:ageiscme_models/filters/kit_cor/kit_cor_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPage extends StatefulWidget {
  KitPage({super.key});

  @override
  State<KitPage> createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Cor 1',
      field: 'cor1',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(
      text: 'Cor 2',
      field: 'cor2',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(
      text: 'Cor 3',
      field: 'cor3',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(
      text: 'Cor 4',
      field: 'cor4',
      valueConverter: (value) => value != null ? value['nome'] : '',
    ),
    CustomDataColumn(text: 'Código Barras', field: 'codBarra'),
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
  late final KitDescritorCubit kitDescritorCubit;

  @override
  void initState() {
    service = KitService();
    kitCorCubit = KitCorCubit();
    kitDescritorCubit = KitDescritorCubit();
    bloc = KitPageCubit(service: service);
    bloc.loadKit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              KitModel.empty(),
            ),
          },
        ),
        BlocListener<KitPageCubit, KitPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<KitPageCubit, KitPageState>(
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
                    onEdit: (KitModel objeto) =>
                        {openModal(context, KitModel.copy(objeto))},
                    onDelete: (KitModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.kits,
                  ),
                ),
              );
            },
          ),
        ),
      ],
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

  void loadKitDescritorCubit() {
    if (!kitDescritorCubit.state.loaded) {
      kitDescritorCubit.loadFilter(
        KitDescritorFilter(
          apenasAtivos: true,
          ordernarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future<KitModel?> getFilter(KitModel kit) async {
    return service.FilterOne(
      KitFilter(
        cod: kit.cod,
        carregarItens: true,
        tStamp: kit.tStamp,
      ),
    );
  }

  Future<void> openModal(BuildContext context, KitModel kit) async {
    LoadingController loading = LoadingController(context: context);
    loadKitCorCubit();

    KitModel? kitModel = kit;
    if (kit.cod != 0) {
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

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return KitPageFrm(
          kitCorCubit: kitCorCubit,
          kit: kitModel!,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadKit();
  }

  void delete(BuildContext context, KitModel kit) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Kit\n${kit.cod} - ${kit.codBarra}',
    );
    if (confirmacao) bloc.delete(kit);
  }

  void deleted(KitPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadKit();
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

import 'package:ageiscme_admin/app/module/pages/cadastro/centro_custo/centro_custo_page_frm/centro_custo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/centro_custo/centro_custo_page_state.dart';
import 'package:ageiscme_data/services/centro_custo/centro_custo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CentroCustoPage extends StatefulWidget {
  CentroCustoPage({super.key});

  @override
  State<CentroCustoPage> createState() => _CentroCustoPageState();
}

class _CentroCustoPageState extends State<CentroCustoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number, 
    ),
    CustomDataColumn(text: 'Centro Custo', field: 'centroCusto'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final CentroCustoPageCubit bloc;

  @override
  void initState() {
    bloc = CentroCustoPageCubit(service: CentroCustoService());
    bloc.loadCentroCusto();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
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
              CentroCustoModel.empty(),
            ),
          },
        ),
        BlocListener<CentroCustoPageCubit, CentroCustoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<CentroCustoPageCubit, CentroCustoPageState>(
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
                    filterOnlyActives: true,
                    onEdit: (CentroCustoModel objeto) =>
                        {openModal(context, CentroCustoModel.copy(objeto))},
                    onDelete: (CentroCustoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.centrosCusto,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, CentroCustoModel centroCusto) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CentroCustoPageFrm(
            centroCusto: centroCusto,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadCentroCusto();
    });
  }

  void delete(BuildContext context, CentroCustoModel centroCusto) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Centro de custo\n${centroCusto.cod} - ${centroCusto.descricao}',
    );
    if (confirmacao) bloc.delete(centroCusto);
  }

  void deleted(CentroCustoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadCentroCusto();
  }

  void onError(CentroCustoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

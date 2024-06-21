import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page_frm/unidade_medida_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page_state.dart';
import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
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

class UnidadeMedidaPage extends StatefulWidget {
  UnidadeMedidaPage({super.key});

  @override
  State<UnidadeMedidaPage> createState() => _UnidadeMedidaPageState();
}

class _UnidadeMedidaPageState extends State<UnidadeMedidaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
  ];

  final UnidadeMedidaPageCubit bloc =
      UnidadeMedidaPageCubit(service: UnidadeMedidaService());

  @override
  void initState() {
    bloc.loadUnidadeMedida();
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
              UnidadeMedidaModel.empty(),
            ),
          },
        ),
        BlocListener<UnidadeMedidaPageCubit, UnidadeMedidaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<UnidadeMedidaPageCubit, UnidadeMedidaPageState>(
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
                    orderDescendingFieldColumn: 'cod',
                    onEdit: (UnidadeMedidaModel objeto) =>
                        {openModal(context, UnidadeMedidaModel.copy(objeto))},
                    onDelete: (UnidadeMedidaModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.unidadesMedida,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, UnidadeMedidaModel unidadeMedida) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: UnidadeMedidaPageFrm(
            unidadeMedida: unidadeMedida,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadUnidadeMedida();
    });
  }

  void delete(BuildContext context, UnidadeMedidaModel unidadeMedida) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da Unidade de Medida\n${unidadeMedida.cod} - ${unidadeMedida.nome}',
    );
    if (confirmacao) bloc.delete(unidadeMedida);
  }

  void deleted(UnidadeMedidaPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadUnidadeMedida();
  }

  void onError(UnidadeMedidaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

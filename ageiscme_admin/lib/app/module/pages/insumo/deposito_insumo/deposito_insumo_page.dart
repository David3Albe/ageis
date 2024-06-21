import 'package:ageiscme_admin/app/module/pages/insumo/deposito_insumo/deposito_insumo_page_frm/deposito_insumo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/deposito_insumo/deposito_insumo_page_state.dart';
import 'package:ageiscme_data/services/deposito_insumo/deposito_insumo_service.dart';
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

class DepositoInsumoPage extends StatefulWidget {
  DepositoInsumoPage({super.key});

  @override
  State<DepositoInsumoPage> createState() => _DepositoInsumoPageState();
}

class _DepositoInsumoPageState extends State<DepositoInsumoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Status',
      field: 'status',
      valueConverter: (dynamic value) =>
          DepositoInsumoStatusOption.getOpcaoFromId(value),
    ),
    CustomDataColumn(
      text: 'Local',
      field: 'local',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Cód. Barra',
      field: 'codBarra',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final DepositoInsumoPageCubit bloc =
      DepositoInsumoPageCubit(service: DepositoInsumoService());

  @override
  void initState() {
    bloc.loadDepositoInsumo();
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
              DepositoInsumoModel.empty(),
            ),
          },
        ),
        BlocListener<DepositoInsumoPageCubit, DepositoInsumoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<DepositoInsumoPageCubit, DepositoInsumoPageState>(
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
                    filterOnlyActives: true,
                    onEdit: (DepositoInsumoModel objeto) {
                      openModal(
                        context,
                        DepositoInsumoModel.copy(objeto),
                      );
                    },
                    onDelete: (DepositoInsumoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.depositosInsumo,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, DepositoInsumoModel depositoInsumo) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DepositoInsumoPageFrm(
            depositoInsumo: depositoInsumo,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadDepositoInsumo();
    });
  }

  void delete(BuildContext context, DepositoInsumoModel depositoInsumo) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Depósito de Insumo\n${depositoInsumo.cod} - ${depositoInsumo.nome}',
    );
    if (confirmacao) bloc.delete(depositoInsumo);
  }

  void deleted(DepositoInsumoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadDepositoInsumo();
  }

  void onError(DepositoInsumoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

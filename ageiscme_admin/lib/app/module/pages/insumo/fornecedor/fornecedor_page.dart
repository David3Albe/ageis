import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page_frm/fornecedor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page_state.dart';
import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
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

class FornecedorPage extends StatefulWidget {
  FornecedorPage({super.key});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Fornecedor', field: 'nome'),
  ];

  final FornecedorPageCubit bloc =
      FornecedorPageCubit(service: FornecedorService());

  @override
  void initState() {
    bloc.loadFornecedor();
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
              FornecedorModel.empty(),
            ),
          },
        ),
        BlocListener<FornecedorPageCubit, FornecedorPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<FornecedorPageCubit, FornecedorPageState>(
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
                    onEdit: (FornecedorModel objeto) =>
                        {openModal(context, FornecedorModel.copy(objeto))},
                    onDelete: (FornecedorModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.fornecedores,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, FornecedorModel fornecedor) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FornecedorPageFrm(
            fornecedor: fornecedor,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadFornecedor();
    });
  }

  void delete(BuildContext context, FornecedorModel fornecedor) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Fornecedor\n${fornecedor.cod} - ${fornecedor.nome}',
    );
    if (confirmacao) bloc.delete(fornecedor);
  }

  void deleted(FornecedorPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadFornecedor();
  }

  void onError(FornecedorPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

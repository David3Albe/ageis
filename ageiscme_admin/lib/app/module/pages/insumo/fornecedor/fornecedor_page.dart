import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page_frm/fornecedor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fornecedor/fornecedor_page_state.dart';
import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FornecedorPage extends StatefulWidget {
  const FornecedorPage({super.key});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
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
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: bloc.loadFornecedor,
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  FornecedorModel.empty(),
                ),
              },
            ),
          ],
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
                    orderDescendingFieldColumn: 'cod',
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

  Future openModal(
    BuildContext context,
    FornecedorModel fornecedor,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Fornecedor',
      widget: FornecedorPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        fornecedor: fornecedor,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadFornecedor();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, FornecedorModel fornecedor) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Fornecedor\n${fornecedor.cod} - ${fornecedor.nome}',
      onConfirm: () => confirmDelete(fornecedor),
    );
  }

  void confirmDelete(FornecedorModel fornecedor) async {
    bloc.delete(fornecedor);
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

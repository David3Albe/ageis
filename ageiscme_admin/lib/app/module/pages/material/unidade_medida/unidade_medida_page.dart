import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page_frm/unidade_medida_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/unidade_medida/unidade_medida_page_state.dart';
import 'package:ageiscme_data/services/unidade_medida/unidade_medida_service.dart';
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

class UnidadeMedidaPage extends StatefulWidget {
  const UnidadeMedidaPage({super.key});

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
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: bloc.loadUnidadeMedida,
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  UnidadeMedidaModel.empty(),
                ),
              },
            ),
          ],
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

  Future openModal(
    BuildContext context,
    UnidadeMedidaModel unidadeMedida,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Unidade Medida',
      widget: UnidadeMedidaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        unidadeMedida: unidadeMedida,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadUnidadeMedida();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, UnidadeMedidaModel unidadeMedida) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Unidade de Medida\n${unidadeMedida.cod} - ${unidadeMedida.nome}',
      onConfirm: () => confirmDelete(unidadeMedida),
    );
  }

  void confirmDelete(UnidadeMedidaModel unidadeMedida) {
    bloc.delete(unidadeMedida);
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

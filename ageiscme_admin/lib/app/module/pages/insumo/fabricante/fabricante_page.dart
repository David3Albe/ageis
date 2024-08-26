import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page_frm/fabricante_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page_state.dart';
import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
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

class FabricantePage extends StatefulWidget {
  const FabricantePage({super.key});

  @override
  State<FabricantePage> createState() => _FabricantePageState();
}

class _FabricantePageState extends State<FabricantePage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Fabricante', field: 'nome'),
  ];

  final FabricantePageCubit bloc =
      FabricantePageCubit(service: FabricanteService());

  @override
  void initState() {
    bloc.loadFabricante();
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
              onPressed: bloc.loadFabricante,
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  FabricanteModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<FabricantePageCubit, FabricantePageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<FabricantePageCubit, FabricantePageState>(
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
                    onEdit: (FabricanteModel objeto) =>
                        {openModal(context, FabricanteModel.copy(objeto))},
                    onDelete: (FabricanteModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.fabricantes,
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
    FabricanteModel fabricante,
  ) async {
    late int chave;
    int codigo = fabricante.cod ?? 0;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: codigo.toString(),
      title: 'Cadastro/Edição Fabricante',
      widget: FabricantePageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        fabricante: fabricante,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadFabricante();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, FabricanteModel fabricante) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Fabricante\n${fabricante.cod} - ${fabricante.nome}',
      onConfirm: () => confirmDelete(fabricante),
    );
  }

  void confirmDelete(FabricanteModel fabricante) async {
    bloc.delete(fabricante);
  }

  void deleted(FabricantePageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadFabricante();
  }

  void onError(FabricantePageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

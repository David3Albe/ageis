import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page_frm/fabricante_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/fabricante/fabricante_page_state.dart';
import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
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

class FabricantePage extends StatefulWidget {
  FabricantePage({super.key});

  @override
  State<FabricantePage> createState() => _FabricantePageState();
}

class _FabricantePageState extends State<FabricantePage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
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
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              FabricanteModel.empty(),
            ),
          },
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

  void openModal(BuildContext context, FabricanteModel fabricante) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FabricantePageFrm(
            fabricante: fabricante,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadFabricante();
    });
  }

  void delete(BuildContext context, FabricanteModel fabricante) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Fabricante\n${fabricante.cod} - ${fabricante.nome}',
    );
    if (confirmacao) bloc.delete(fabricante);
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

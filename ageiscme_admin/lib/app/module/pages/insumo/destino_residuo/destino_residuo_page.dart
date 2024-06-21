import 'package:ageiscme_admin/app/module/pages/insumo/destino_residuo/destino_residuo_page_frm/destino_residuo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/destino_residuo/destino_residuo_page_state.dart';
import 'package:ageiscme_data/services/destino_residuo/destino_residuo_service.dart';
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

class DestinoResiduoPage extends StatefulWidget {
  DestinoResiduoPage({super.key});

  @override
  State<DestinoResiduoPage> createState() => _DestinoResiduoPageState();
}

class _DestinoResiduoPageState extends State<DestinoResiduoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final DestinoResiduoPageCubit bloc =
      DestinoResiduoPageCubit(service: DestinoResiduoService());

  @override
  void initState() {
    bloc.loadDestinoResiduo();
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
              DestinoResiduoModel.empty(),
            ),
          },
        ),
        BlocListener<DestinoResiduoPageCubit, DestinoResiduoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<DestinoResiduoPageCubit, DestinoResiduoPageState>(
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
                    onEdit: (DestinoResiduoModel objeto) =>
                        {openModal(context, DestinoResiduoModel.copy(objeto))},
                    onDelete: (DestinoResiduoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.destinosResiduo,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, DestinoResiduoModel destinoResiduo) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DestinoResiduoPageFrm(
            destinoResiduo: destinoResiduo,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadDestinoResiduo();
    });
  }

  void delete(BuildContext context, DestinoResiduoModel destinoResiduo) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Destino de resíduo\n${destinoResiduo.cod} - ${destinoResiduo.nome}',
    );
    if (confirmacao) bloc.delete(destinoResiduo);
  }

  void deleted(DestinoResiduoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadDestinoResiduo();
  }

  void onError(DestinoResiduoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

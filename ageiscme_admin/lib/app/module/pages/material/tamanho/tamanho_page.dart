import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page_frm/tamanho_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page_state.dart';
import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
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

class TamanhoPage extends StatefulWidget {
  TamanhoPage({super.key});

  @override
  State<TamanhoPage> createState() => _TamanhoPageState();
}

class _TamanhoPageState extends State<TamanhoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Sigla', field: 'sigla'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Referencial numérico único do tamanho',
      field: 'referencial',
      type: CustomDataColumnType.Number,
    ),
  ];

  final TamanhoPageCubit bloc = TamanhoPageCubit(service: TamanhoService());

  @override
  void initState() {
    bloc.loadTamanho();
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
              TamanhoModel.empty(),
            ),
          },
        ),
        BlocListener<TamanhoPageCubit, TamanhoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<TamanhoPageCubit, TamanhoPageState>(
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
                    onEdit: (TamanhoModel objeto) =>
                        {openModal(context, TamanhoModel.copy(objeto))},
                    onDelete: (TamanhoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.tamanhos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, TamanhoModel tamanho) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TamanhoPageFrm(
            tamanho: tamanho,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadTamanho();
    });
  }

  void delete(BuildContext context, TamanhoModel tamanho) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Tamanho\n${tamanho.cod} - ${tamanho.sigla}',
    );
    if (confirmacao) bloc.delete(tamanho);
  }

  void deleted(TamanhoPageState state) {
    ToastUtils.showCustomToastSucess(context, state.message);
    bloc.loadTamanho();
  }

  void onError(TamanhoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

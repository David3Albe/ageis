import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page_frm/motivo_remover_repor_item_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page_state.dart';
import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
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

class MotivoRemoverReporItemPage extends StatefulWidget {
  MotivoRemoverReporItemPage({super.key});

  @override
  State<MotivoRemoverReporItemPage> createState() =>
      _MotivoRemoverReporItemPageState();
}

class _MotivoRemoverReporItemPageState
    extends State<MotivoRemoverReporItemPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Remover Item',
      field: 'remover',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Repor Item',
      field: 'repor',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final MotivoRemoverReporItemPageCubit bloc =
      MotivoRemoverReporItemPageCubit(service: MotivoRemoverReporItemService());

  @override
  void initState() {
    bloc.loadMotivoRemoverReporItem();
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
              MotivoRemoverReporItemModel.empty(),
            ),
          },
        ),
        BlocListener<MotivoRemoverReporItemPageCubit,
            MotivoRemoverReporItemPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<MotivoRemoverReporItemPageCubit,
              MotivoRemoverReporItemPageState>(
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
                    onEdit: (MotivoRemoverReporItemModel objeto) => {
                      openModal(
                        context,
                        MotivoRemoverReporItemModel.copy(objeto),
                      ),
                    },
                    onDelete: (MotivoRemoverReporItemModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.motivoRemoverReporItens,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(
    BuildContext context,
    MotivoRemoverReporItemModel motivoRemoverReporItem,
  ) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: MotivoRemoverReporItemPageFrm(
            motivoRemoverReporItem: motivoRemoverReporItem,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadMotivoRemoverReporItem();
    });
  }

  void delete(
    BuildContext context,
    MotivoRemoverReporItemModel motivoRemoverReporItem,
  ) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Motivo Remover / Repor Item\n${motivoRemoverReporItem.cod} - ${motivoRemoverReporItem.descricao}',
    );
    if (confirmacao) bloc.delete(motivoRemoverReporItem);
  }

  void deleted(MotivoRemoverReporItemPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadMotivoRemoverReporItem();
  }

  void onError(MotivoRemoverReporItemPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page_frm/motivo_remover_repor_item_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/motivo_remover_repor_item/motivo_remover_repor_item_page_state.dart';
import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
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

class MotivoRemoverReporItemPage extends StatefulWidget {
  const MotivoRemoverReporItemPage({super.key});

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
      width: 100,
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
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: () => bloc.loadMotivoRemoverReporItem(),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  MotivoRemoverReporItemModel.empty(),
                ),
              },
            ),
          ],
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
                    orderDescendingFieldColumn: 'cod',
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

  Future openModal(
    BuildContext context,
    MotivoRemoverReporItemModel motivoRemoverReporItem,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (motivoRemoverReporItem.cod ?? 0).toString(),
      title: 'Cadastro/Edição Motivo Remover/Repor Item',
      widget: MotivoRemoverReporItemPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        motivoRemoverReporItem: motivoRemoverReporItem,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadMotivoRemoverReporItem();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    MotivoRemoverReporItemModel motivoRemoverReporItem,
  ) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Motivo Remover / Repor Item\n${motivoRemoverReporItem.cod} - ${motivoRemoverReporItem.descricao}',
      onConfirm: () => confirmDelete(motivoRemoverReporItem),
    );
  }

  void confirmDelete(
    MotivoRemoverReporItemModel motivoRemoverReporItem,
  ) async {
    bloc.delete(motivoRemoverReporItem);
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

import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_frm/processo_motivo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_state.dart';
import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
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

class ProcessoMotivoPage extends StatefulWidget {
  const ProcessoMotivoPage({super.key});

  @override
  State<ProcessoMotivoPage> createState() => _ProcessoMotivoPageState();
}

class _ProcessoMotivoPageState extends State<ProcessoMotivoPage> {
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
      text: 'Arsenal',
      field: 'arsenal',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Preparo',
      field: 'preparo',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(
      text: 'Recepção / Expurgo',
      field: 'recepcaoExpurgo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final ProcessoMotivoPageCubit bloc =
      ProcessoMotivoPageCubit(service: ProcessoMotivoService());

  @override
  void initState() {
    bloc.loadProcessoMotivo();
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
              onPressed: bloc.loadProcessoMotivo,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  ProcessoMotivoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<ProcessoMotivoPageCubit, ProcessoMotivoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ProcessoMotivoPageCubit, ProcessoMotivoPageState>(
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
                    onEdit: (ProcessoMotivoModel objeto) =>
                        {openModal(context, ProcessoMotivoModel.copy(objeto))},
                    onDelete: (ProcessoMotivoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.processosMotivo,
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
    ProcessoMotivoModel processoMotivo,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Motivo de Processo',
      widget: ProcessoMotivoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        processoMotivo: processoMotivo,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadProcessoMotivo();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ProcessoMotivoModel processoMotivo) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Motivo de Processo\n${processoMotivo.cod} - ${processoMotivo.descricao}',
      onConfirm: () => confirmDelete(processoMotivo),
    );
  }

  void confirmDelete(ProcessoMotivoModel processoMotivo) {
    bloc.delete(processoMotivo, context);
  }

  void deleted(ProcessoMotivoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadProcessoMotivo();
  }

  void onError(ProcessoMotivoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

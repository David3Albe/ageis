import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_frm/processo_motivo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_motivo/processo_motivo_page_state.dart';
import 'package:ageiscme_data/services/processo_motivo/processo_motivo_service.dart';
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

class ProcessoMotivoPage extends StatefulWidget {
  ProcessoMotivoPage({super.key});

  @override
  State<ProcessoMotivoPage> createState() => _ProcessoMotivoPageState();
}

class _ProcessoMotivoPageState extends State<ProcessoMotivoPage> {
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
        AddButtonWidget(
          onPressed: () => {
            openModal(
              context,
              ProcessoMotivoModel.empty(),
            ),
          },
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

  void openModal(BuildContext context, ProcessoMotivoModel processoMotivo) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ProcessoMotivoPageFrm(
            processoMotivo: processoMotivo,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadProcessoMotivo();
    });
  }

  void delete(BuildContext context, ProcessoMotivoModel processoMotivo) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Motivo de Processo\n${processoMotivo.cod} - ${processoMotivo.descricao}',
    );
    if (confirmacao) bloc.delete(processoMotivo, context);
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

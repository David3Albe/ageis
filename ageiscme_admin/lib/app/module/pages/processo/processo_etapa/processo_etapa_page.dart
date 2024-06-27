import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_state.dart';
import 'package:ageiscme_data/services/processo_etapa/processo_etapa_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
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

class ProcessoEtapaPage extends StatefulWidget {
  const ProcessoEtapaPage({super.key});

  @override
  State<ProcessoEtapaPage> createState() => _ProcessoEtapaPageState();
}

class _ProcessoEtapaPageState extends State<ProcessoEtapaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Tipo Processo',
      field: 'tipoProcesso',
      valueConverter: (value) => value['nome'],
    ),
    CustomDataColumn(
      text: 'Etiqueta Preparo',
      field: 'descricaoEtiquetaPreparo',
    ),
    CustomDataColumn(
      text: 'Tempo Ciclo Processo (Minutos)',
      field: 'tempoCicloProcesso',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final ProcessoEtapaPageCubit bloc =
      ProcessoEtapaPageCubit(service: ProcessoEtapaService());

  @override
  void initState() {
    bloc.loadProcessoEtapa();
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
              ProcessoEtapaModel.empty(),
            ),
          },
        ),
        BlocListener<ProcessoEtapaPageCubit, ProcessoEtapaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) delted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ProcessoEtapaPageCubit, ProcessoEtapaPageState>(
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
                    onEdit: (ProcessoEtapaModel objeto) =>
                        {openModal(context, ProcessoEtapaModel.copy(objeto))},
                    onDelete: (ProcessoEtapaModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.processosEtapas,
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
    ProcessoEtapaModel processoEtapa,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Etapa Processo',
      widget: ProcessoEtapaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        processoEtapa: processoEtapa,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadProcessoEtapa();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ProcessoEtapaModel processoEtapa) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da Etapa Processo\n${processoEtapa.cod} - ${processoEtapa.nome}',
      onConfirm: () => confirmDelete(processoEtapa),
    );
  }

  void confirmDelete(ProcessoEtapaModel processoEtapa) async {
    bloc.delete(processoEtapa);
  }

  void delted(ProcessoEtapaPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadProcessoEtapa();
  }

  void onError(ProcessoEtapaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

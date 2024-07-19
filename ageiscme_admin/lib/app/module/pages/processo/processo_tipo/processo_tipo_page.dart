// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo/processo_tipo_page_frm/processo_tipo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo/processo_tipo_page_state.dart';
import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoTipoPage extends StatefulWidget {
  const ProcessoTipoPage({super.key});

  @override
  State<ProcessoTipoPage> createState() => _ProcessoTipoPageState();
}

class _ProcessoTipoPageState extends State<ProcessoTipoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Nível Prioridade',
      field: 'nivelPrioridade',
      valueConverter: (value) =>
          ProcessoTipoPrioriodadeOption.getOpcaoFromId(value),
    ),
    CustomDataColumn(
      text: 'Prazo Validade',
      field: 'prazoValidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Limite Vigência',
      field: 'limiteVigencia',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final ProcessoTipoPageCubit bloc;
  late final ProcessoTipoService service;
  late final ProcessoEtapaCubit processoEtapaCubit;

  @override
  void initState() {
    service = ProcessoTipoService();
    processoEtapaCubit = ProcessoEtapaCubit();
    bloc = ProcessoTipoPageCubit(service: ProcessoTipoService());
    bloc.loadProcessoTipo();
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
              onPressed: bloc.loadProcessoTipo,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  ProcessoTipoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<ProcessoTipoPageCubit, ProcessoTipoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ProcessoTipoPageCubit, ProcessoTipoPageState>(
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
                    onEdit: (ProcessoTipoModel objeto) => {
                      openModal(
                        context,
                        ProcessoTipoModel.copy(objeto),
                      ),
                    },
                    onDelete: (ProcessoTipoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.processosTipos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadEtapaCubit() {
    if (!processoEtapaCubit.state.loaded) {
      processoEtapaCubit.loadFilter(
        ProcessoEtapaFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Future openModal(
    BuildContext context,
    ProcessoTipoModel processoTipo,
  ) async {
    LoadingController loading = LoadingController(context: context);
    loadEtapaCubit();

    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Tipo de Processo',
      widget: ProcessoTipoPageFrm(
        processoEtapaCubit: processoEtapaCubit,
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        processoTipo: processoTipo,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadProcessoTipo();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, ProcessoTipoModel processoTipo) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Tipo de Processo\n${processoTipo.cod} - ${processoTipo.nome}',
      onConfirm: () => confirmDelete(processoTipo),
    );
  }

  void confirmDelete(ProcessoTipoModel processoTipo) async {
    bloc.delete(processoTipo);
  }

  void deleted(ProcessoTipoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadProcessoTipo();
  }

  void onError(ProcessoTipoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Tipo de Processo que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

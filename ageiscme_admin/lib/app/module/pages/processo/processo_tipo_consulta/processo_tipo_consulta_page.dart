// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_consulta/processo_tipo_consulta_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/processo_tipo_fluxo/presenter/processo_tipo_fluxo_page_presenter.dart';
import 'package:ageiscme_data/services/processo_tipo/processo_tipo_service.dart';
import 'package:ageiscme_models/filters/processo_tipo/processo_tipo_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoTipoConsultaPage extends StatefulWidget {
  ProcessoTipoConsultaPage({super.key});

  @override
  State<ProcessoTipoConsultaPage> createState() =>
      _ProcessoTipoConsultaPageState();
}

class _ProcessoTipoConsultaPageState extends State<ProcessoTipoConsultaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
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

  late final ProcessoTipoConsultaPageCubit bloc;
  late final ProcessoTipoService service;

  @override
  void initState() {
    service = ProcessoTipoService();
    bloc = ProcessoTipoConsultaPageCubit(service: ProcessoTipoService());
    bloc.loadProcessoTipo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<ProcessoTipoConsultaPageCubit,
            ProcessoTipoConsultaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
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
                  onOpen: (ProcessoTipoModel objeto) => {
                    openModal(
                      context,
                      ProcessoTipoModel.copy(objeto),
                    ),
                  },
                  columns: colunas,
                  items: state.processosTipos,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<bool?> _carregarFluxoEtapas(ProcessoTipoModel processoTipo) async {
    if (processoTipo.etapas != null) return true;
    ProcessoTipoModel? processoTipoFluxo =
        await ProcessoTipoService().FilterOneV2(
      ProcessoTipoFilter(
        carregarEquipamentosEtapas: true,
        carregarEtapas: true,
        carregarSequenciasEtapas: true,
        cod: processoTipo.cod,
      ),
    );

    if (processoTipoFluxo == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Tipo de processo não encontrado, revise seu procedimento, entre em contato com a cordenação!',
      );
      return false;
    }

    processoTipo.etapas = processoTipoFluxo.etapas;
    return true;
  }

  void openModal(BuildContext context, ProcessoTipoModel processoTipo) async {
    if (processoTipo.cod == 0 || processoTipo.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário que o tipo de processo esteja criado para editar o fluxo',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);

    bool? carregouEtapas = await _carregarFluxoEtapas(processoTipo);
    if (carregouEtapas != true) {
      loading.close(context, mounted);
      return;
    }
    loading.close(context, mounted);

    await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ProcessoTipoFluxoPagePresenter(
          canEdit: false,
          processoTipo: processoTipo,
        );
      },
    );
  }

  void onError(ProcessoTipoConsultaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Tipo de Processo que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe/consulta_processos_leitura_detalhe_page_state.dart';
import 'package:ageiscme_data/query_services/processos_leitura_detalhe/consulta_processos_leitura_detalhe_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe/consulta_processos_leitura_detalhe_filter.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessoLeituraDetalhePage extends StatefulWidget {
  const ConsultaProcessoLeituraDetalhePage({super.key, this.filter});

  final ConsultaProcessosLeituraDetalheFilter? filter;

  @override
  State<ConsultaProcessoLeituraDetalhePage> createState() =>
      _ConsultaProcessoLeituraDetalhePageState();
}

class _ConsultaProcessoLeituraDetalhePageState
    extends State<ConsultaProcessoLeituraDetalhePage> { 
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Entrega / Retirada', field: 'entregaRetirada'),
    CustomDataColumn(
      text: 'Cód. Usuário Entrega',
      field: 'codUsuarioEntrega',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome Usuário Entrega', field: 'nomeUsuarioEntrega'),
    CustomDataColumn(
      text: 'Cód. Usuário Retirada',
      field: 'codUsuarioRetirada',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Nome Usuário Retirada',
      field: 'nomeUsuarioRetirada',
    ),
    CustomDataColumn(
      text: 'Cód. Local Entrega',
      field: 'codLocalEntrega',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome Local Entrega', field: 'nomeLocalEntrega'),
    CustomDataColumn(
      text: 'Cód. Local Retirada',
      field: 'codLocalRetirada',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Nome Local Retirada',
      field: 'nomeLocalRetirada',
    ),
    CustomDataColumn(
      text: 'Cód. Cirurgião',
      field: 'codCirurgiao',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome Cirurgião', field: 'nomeCirurgiao'),
    CustomDataColumn(text: 'Prontuário Retirada', field: 'prontuarioRetirada'),
    CustomDataColumn(
      text: 'Conferido Visualmente',
      field: 'conferidoVisualmente',
      type: CustomDataColumnType.Checkbox,
    ),
    CustomDataColumn(text: 'Nível Prioridade', field: 'nivelPrioridade'),
    CustomDataColumn(text: 'Observação', field: 'observacao'),
  ];

  late final ConsultaProcessosLeituraDetalhePageCubit bloc;
  late final ConsultaProcessosLeituraDetalheService service;

  @override
  void initState() {
    service = ConsultaProcessosLeituraDetalheService();
    bloc = ConsultaProcessosLeituraDetalhePageCubit(service: service);
    bloc.loadProcessoLeituraDetalhe(widget.filter!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocListener<ConsultaProcessosLeituraDetalhePageCubit,
            ConsultaProcessosLeituraDetalhePageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraDetalhePageCubit,
              ConsultaProcessosLeituraDetalhePageState>(
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
                    smallRows: true,
                    columns: colunas,
                    items: state.processosLeituras,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaProcessosLeituraDetalhePageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);
}

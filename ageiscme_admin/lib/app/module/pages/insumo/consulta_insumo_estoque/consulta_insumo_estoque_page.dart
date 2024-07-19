// ignore_for_file: unused_element

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_insumo_estoque/consulta_insumo_estoque_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/insumo_estoque/consulta_insumo_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/insumo_estoque/consulta_insumo_estoque_filter.dart';
import 'package:ageiscme_models/query_models/insumo_estoque/consulta_insumo_estoque_model.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConsultaInsumoEstoquePage extends StatefulWidget {
  const ConsultaInsumoEstoquePage({super.key});

  @override
  State<ConsultaInsumoEstoquePage> createState() =>
      _ConsultaInsumoEstoquePageState();
}

class _ConsultaInsumoEstoquePageState extends State<ConsultaInsumoEstoquePage> {
  late ConsultaInsumoEstoqueModel? Function(PlutoRow) getRowObj;

  Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    ConsultaInsumoEstoqueModel? insumo = getRowObj(renderContext.row);
    Color cor = Cores.corTexto;
    double? qtdeDisponivel = insumo?.qtdeDisponivel;
    double? estoqueMinimo = insumo?.estoqueMinimo;
    if (qtdeDisponivel != null &&
        estoqueMinimo != null &&
        qtdeDisponivel < estoqueMinimo) {
      cor = Cores.corTextoVermelho;
    }

    return Text(
      renderContext.cell.value?.toString() ?? '',
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
      ),
    );
  }

  late final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Insumo',
      field: 'nomeInsumo',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Saldo',
      field: 'qtdeDisponivel',
      type: CustomDataColumnType.Number,
      customRenderer: (context) => getCustomRenderer(
        context,
        textAlign: TextAlign.end,
      ),
    ),
    CustomDataColumn(
      text: 'Unidade Medida',
      field: 'unidadeMedida',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Ponto Reposição',
      field: 'pontoReposicao',
      type: CustomDataColumnType.Number,
      customRenderer: (context) => getCustomRenderer(
        context,
        textAlign: TextAlign.end,
      ),
    ),
    CustomDataColumn(
      text: 'Estoque Minímo',
      field: 'estoqueMinimo',
      type: CustomDataColumnType.Number,
      customRenderer: (context) => getCustomRenderer(
        context,
        textAlign: TextAlign.end,
      ),
    ),
    CustomDataColumn(
      text: 'Estoque Máximo',
      field: 'estoqueMaximo',
      type: CustomDataColumnType.Number,
      customRenderer: (context) => getCustomRenderer(
        context,
        textAlign: TextAlign.end,
      ),
    ),
    CustomDataColumn(
      text: 'Prazo Entrega (Dias)',
      field: 'prazoEntregaDias',
      type: CustomDataColumnType.Number,
      customRenderer: (context) => getCustomRenderer(
        context,
        textAlign: TextAlign.end,
      ),
    ),
  ];

  late final ConsultaInsumoEstoquePageCubit bloc;
  late final DepositoInsumoCubit depositoInsumoBloc;
  late final InsumoCubit insumoBloc;
  late final ConsultaInsumoEstoqueFilter filter;

  @override
  void initState() {
    bloc = ConsultaInsumoEstoquePageCubit(
      service: ConsultaInsumoEstoqueService(),
    );
    filter = ConsultaInsumoEstoqueFilter.empty();
    depositoInsumoBloc = DepositoInsumoCubit();
    depositoInsumoBloc.loadAll();
    insumoBloc = InsumoCubit();
    insumoBloc.loadAll();

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
              onPressed: () => bloc.loadInsumoEstoque(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaInsumoEstoquePageCubit,
            ConsultaInsumoEstoquePageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaInsumoEstoquePageCubit,
              ConsultaInsumoEstoquePageState>(
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
                    getObjectByRowMethod: (context, getObjectByRowMethod) =>
                        getRowObj = getObjectByRowMethod,
                    smallRows: true,
                    columns: colunas,
                    items: state.insumosEstoques,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaInsumoEstoquePageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            BlocBuilder<DepositoInsumoCubit, DepositoInsumoState>(
              bloc: depositoInsumoBloc,
              builder: (context, depositoState) {
                if (depositoState.loading) {
                  return const LoadingWidget();
                }
                List<DepositoInsumoModel> depositos = depositoState.objs;
                DepositoInsumoModel? deposito = depositos
                    .where(
                      (element) => element.cod == filter.codDeposito,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<DepositoInsumoModel>(
                  textFunction: (deposito) => deposito.GetNomeDepositoText(),
                  initialValue: deposito,
                  sourceList: depositos,
                  onChanged: (value) => filter.codDeposito = value?.cod,
                  placeholder: 'Depósito',
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            BlocBuilder<InsumoCubit, InsumoState>(
              bloc: insumoBloc,
              builder: (context, insumoState) {
                if (insumoState.loading) {
                  return const LoadingWidget();
                }
                List<InsumoModel> insumos = insumoState.objs;
                InsumoModel? insumo = insumos
                    .where(
                      (element) => element.cod == filter.codInsumo,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<InsumoModel>(
                  textFunction: (insumo) => insumo.GetNomeInsumoText(),
                  initialValue: insumo,
                  sourceList: insumos,
                  onChanged: (value) => filter.codInsumo = value?.cod,
                  placeholder: 'Insumo',
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            CustomCheckboxWidget(
              checked: filter.estoqueAbaixoMinimo,
              onClick: (value) => filter.estoqueAbaixoMinimo = value,
              text: 'Estoque abaixo do minimo',
              align: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadInsumoEstoque(filter);
  }
}

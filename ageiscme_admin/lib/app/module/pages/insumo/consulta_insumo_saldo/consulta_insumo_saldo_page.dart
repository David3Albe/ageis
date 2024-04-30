import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_insumo_saldo/consulta_insumo_saldo_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_movimentacao_estoque/consulta_movimentacao_estoque_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/query_dialog/query_dialog_widget.dart';
import 'package:ageiscme_data/query_services/insumo_saldo/consulta_insumo_saldo_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/insumo_saldo/insumo_saldo_model.dart';
import 'package:ageiscme_models/query_filters/insumo_saldo/consulta_insumo_saldo_filter.dart';
import 'package:ageiscme_models/query_filters/movimento_estoque/consulta_movimentacao_estoque_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaInsumoSaldoPage extends StatefulWidget {
  const ConsultaInsumoSaldoPage({this.codInsumo, super.key});
  final int? codInsumo;

  @override
  State<ConsultaInsumoSaldoPage> createState() =>
      _ConsultaInsumoSaldoPageState();
}

class _ConsultaInsumoSaldoPageState extends State<ConsultaInsumoSaldoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód. Barra',
      field: 'insumo',
      valueConverter: (insumo) => insumo == null ? '' : insumo['codBarra'],
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Depósito',
      field: 'depositoInsumo',
      valueConverter: (depInsumo) => depInsumo == null ? '' : depInsumo['nome'],
      width: 125,
    ),
    CustomDataColumn(
      text: 'Insumo',
      field: 'insumo',
      calculatedField: 'insumoNome',
      valueConverter: (insumo2) => insumo2 == null ? '' : insumo2['nome'],
    ),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Saldo',
      field: 'qtdeDisponivel',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(
      text: 'Situação',
      field: 'status',
      valueConverter: (dynamic value) =>
          InsumoSaldoStatusOption.getOpcaoFromId(value),
      width: 120,
    ),
    CustomDataColumn(
      text: 'Fabricação',
      field: 'dataFabricacao',
      type: CustomDataColumnType.Date,
      width: 120,
    ),
    CustomDataColumn(
      text: 'Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.Date,
      width: 120,
    ),
    CustomDataColumn(
      text: 'Validade Pós Ativação',
      field: 'dataValidadePosAtivacao',
      type: CustomDataColumnType.Date,
      width: 175,
    ),
  ];

  late final ConsultaInsumoSaldoPageCubit bloc;
  late final DepositoInsumoCubit depositoInsumoBloc;
  late final InsumoCubit insumoBloc;
  late final ConsultaInsumoSaldoFilter filter;

  @override
  void initState() {
    bloc = ConsultaInsumoSaldoPageCubit(
      service: ConsultaInsumoSaldoService(),
    );
    filter = ConsultaInsumoSaldoFilter.empty();
    filter.codInsumo = widget.codInsumo;
    depositoInsumoBloc = DepositoInsumoCubit();
    depositoInsumoBloc.loadAll();
    insumoBloc = InsumoCubit();
    insumoBloc.loadAll();

    super.initState();
    if (filter.codInsumo != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        bloc.loadInsumoSaldo(filter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButtonWidget(
          onPressed: () => {
            openModal(context),
          },
        ),
        BlocListener<ConsultaInsumoSaldoPageCubit,
            ConsultaInsumoSaldoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaInsumoSaldoPageCubit,
              ConsultaInsumoSaldoPageState>(
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
                    items: state.insumosSaldos,
                    onDetail: (event, obj) async {
                      var isUserValid =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.InsumosSaldosConsulta,
                      );

                      if (isUserValid == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      openModalRedirect(
                        context,
                        obj.codDeposito,
                        obj.codInsumo,
                        obj.lote,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onError(ConsultaInsumoSaldoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? value = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
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
              Builder(
                builder: (context) {
                  return DropDownSearchWidget<InsumoSaldoStatusOption>(
                    sourceList: InsumoSaldoStatusOption.situacaoOptions,
                    initialValue: InsumoSaldoStatusOption.situacaoOptions
                        .where(
                          (element) => element.cod == filter.situacao,
                        )
                        .firstOrNull,
                    placeholder: 'Situação',
                    onChanged: (value) => filter.situacao = value?.cod,
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.semSaldo,
                onClick: (value) => filter.semSaldo = value,
                text: 'Sem Saldo',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    );
    if (value != true) return;
    bloc.loadInsumoSaldo(filter);
  }

  void openModalRedirect(
    BuildContext context,
    int? codDeposito,
    int? codInsumo,
    String? lote,
  ) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaMovimentacaoEstoquePage(
            filter: ConsultaMovimentacaoEstoqueFilter(
              codDeposito: codDeposito,
              codInsumo: codInsumo,
              lote: lote,
              finalDate: DateTime.now(),
              startDate: DateTime.now().add(const Duration(days: -1)),
              nroNotaFiscal: null,
            ),
          ),
        );
      },
    );
  }
}

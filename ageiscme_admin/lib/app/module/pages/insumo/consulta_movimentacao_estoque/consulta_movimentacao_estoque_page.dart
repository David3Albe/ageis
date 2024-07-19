import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/deposito_insumo/deposito_insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/consulta_movimentacao_estoque/consulta_movimentacao_estoque_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_frm/insumo_movimento_frm_page.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/movimento_estoque/consulta_movimentacao_estoque_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/insumo_movimento/insumo_movimento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/movimento_estoque/consulta_movimentacao_estoque_filter.dart';
import 'package:ageiscme_models/query_models/movimento_estoque/consulta_movimentacao_estoque_model.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ConsultaMovimentacaoEstoquePage extends StatefulWidget {
  const ConsultaMovimentacaoEstoquePage({
    super.key,
    this.filter,
  });

  final ConsultaMovimentacaoEstoqueFilter? filter;

  @override
  State<ConsultaMovimentacaoEstoquePage> createState() =>
      _ConsultaMovimentacaoEstoquePageState();
}

class _ConsultaMovimentacaoEstoquePageState
    extends State<ConsultaMovimentacaoEstoquePage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Insumo',
      field: 'insumo',
      calculatedField: 'insumoDescricao',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Movimento',
      field: 'flagEntradaSaida',
      valueConverter: (dynamic value) => value == null
          ? ''
          : EntradaSaidaOption.getEntradaSaidaOpcaoFromId(value),
    ),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'quantidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Preço de Custo',
      field: 'precoCusto3Albe',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Unidade Medida',
      field: 'insumo',
      valueConverter: (value) => value == null ? '' : value['unidadeMedida'],
    ),
    CustomDataColumn(
      text: 'Equipamento',
      field: 'equipamento',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Destino Resíduo',
      field: 'destinoResiduo',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
  ];

  late final ConsultaMovimentacaoEstoquePageCubit bloc;
  late final DepositoInsumoCubit depositoInsumoBloc;
  late final InsumoCubit insumoBloc;
  late final ConsultaMovimentacaoEstoqueFilter filter;
  late final InsumoMovimentoService service;

  late final TextFieldStringWidget txtLote = TextFieldStringWidget(
    placeholder: 'Lote',
    onChanged: (String? str) {
      filter.lote = txtLote.text;
    },
  );

  late final TextFieldStringWidget txtNroNotaFiscal = TextFieldStringWidget(
    placeholder: 'Nro. Nota Fiscal',
    onChanged: (String? str) {
      filter.nroNotaFiscal = txtNroNotaFiscal.text;
    },
  );

  @override
  void initState() {
    bloc = ConsultaMovimentacaoEstoquePageCubit(
      service: ConsultaMovimentacaoEstoqueService(),
    );

    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadMovimentacaoEstoque(filter);
    } else {
      filter = ConsultaMovimentacaoEstoqueFilter.empty();
      filter.startDate = DateTime.now().add(const Duration(days: -1));
      filter.finalDate = DateTime.now();
    }

    depositoInsumoBloc = DepositoInsumoCubit();
    depositoInsumoBloc.loadAll();
    insumoBloc = InsumoCubit();
    insumoBloc.loadAll();
    service = InsumoMovimentoService();

    setFields();
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
              onPressed: () => bloc.loadMovimentacaoEstoque(filter),
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        BlocListener<ConsultaMovimentacaoEstoquePageCubit,
            ConsultaMovimentacaoEstoquePageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaMovimentacaoEstoquePageCubit,
              ConsultaMovimentacaoEstoquePageState>(
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
                    orderDescendingFieldColumn: 'dataHora',
                    smallRows: true,
                    columns: colunas,
                    items: state.movimentacoesEstoques,
                    onDetail: (event, obj) async {
                      var isUserValidConsulta =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.InsumosMovimentosConsulta,
                      );

                      var isUserValidManutencao =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.InsumosMovimentosManutencao,
                      );

                      if (isUserValidConsulta == false &&
                          isUserValidManutencao == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await openModalRedirect(context, obj.cod!);
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

  void setFields() {
    if (filter.lote == null) {
      txtLote.text = '';
    } else {
      txtLote.text = filter.lote.toString();
    }
  }

  void onError(ConsultaMovimentacaoEstoquePageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DatePickerWidget(
                    placeholder: 'Data Inicio',
                    onDateSelected: (value) => filter.startDate = value,
                    initialValue: filter.startDate,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                ),
                Expanded(
                  child: TimePickerWidget(
                    placeholder: 'Hora Início',
                    initialValue: filter.startTime == null
                        ? null
                        : TimeOfDay(
                            hour: filter.startTime!.hour,
                            minute: filter.startTime!.minute,
                          ),
                    onTimeSelected: (selectedTime) {
                      if (selectedTime == null) {
                        filter.startTime = null;
                        return;
                      }
                      filter.startTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            Row(
              children: [
                Expanded(
                  child: DatePickerWidget(
                    placeholder: 'Data Término',
                    onDateSelected: (value) => filter.finalDate = value,
                    initialValue: filter.finalDate,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                ),
                Expanded(
                  child: TimePickerWidget(
                    placeholder: 'Hora Fim',
                    initialValue: filter.finalTime == null
                        ? null
                        : TimeOfDay(
                            hour: filter.finalTime!.hour,
                            minute: filter.finalTime!.minute,
                          ),
                    onTimeSelected: (selectedTime) {
                      if (selectedTime == null) {
                        filter.finalTime = null;
                        return;
                      }
                      filter.finalTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 2)),
            BlocBuilder<DepositoInsumoCubit, DepositoInsumoState>(
              bloc: depositoInsumoBloc,
              builder: (context, depositoState) {
                if (depositoState.loading) {
                  return const LoadingWidget();
                }
                List<DepositoInsumoModel> depositosInsumos = depositoState.objs;

                DepositoInsumoModel? depositoInsumo = depositosInsumos
                    .where(
                      (element) => element.cod == filter.codDeposito,
                    )
                    .firstOrNull;
                return DropDownSearchWidget<DepositoInsumoModel>(
                  textFunction: (kit) => kit.GetNomeDepositoText(),
                  initialValue: depositoInsumo,
                  sourceList: depositosInsumos,
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
                  textFunction: (kit) => kit.GetNomeInsumoText(),
                  initialValue: insumo,
                  sourceList: insumos,
                  onChanged: (value) => filter.codInsumo = value?.cod,
                  placeholder: 'Insumo',
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: txtLote,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: txtNroNotaFiscal,
            ),
          ],
        ),
      ),
    );
    if (confirm != true) return;
    bloc.loadMovimentacaoEstoque(filter);
  }

  Future<InsumoMovimentoModel?> getFilter(int cod) async {
    return service.FilterOne(
      InsumoMovimentoFilter(
        cod: cod,
      ),
    );
  }

  Future openModalRedirect(
    BuildContext context,
    int cod,
  ) async {
    LoadingController loading = LoadingController(context: context);

    InsumoMovimentoModel? movimento;
    movimento = await getFilter(cod);
    if (movimento == null) {
      loading.close(context, mounted);
      notFoundError();
      return;
    }
    loading.close(context, mounted);
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Movimento de Insumo',
      widget: InsumoMovimentoPageFrm(
        onCancel: () => onCancel(chave),
        insumoMovimento: movimento,
      ),
    );
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Movimentação de Insumos que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

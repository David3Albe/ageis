import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/insumo/insumo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_frm/insumo_movimento_frm_page.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo_movimento/insumo_movimento_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_models/filters/insumo_movimento/insumo_movimento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class InsumoMovimentoPage extends StatefulWidget {
  InsumoMovimentoPage({super.key});

  @override
  State<InsumoMovimentoPage> createState() => _InsumoMovimentoPageState();
}

class _InsumoMovimentoPageState extends State<InsumoMovimentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Cód. Barra', field: 'codBarra'),
    CustomDataColumn(
      text: 'Insumo',
      field: 'insumo',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'quantidade',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Lote', field: 'lote'),
    CustomDataColumn(
      text: 'Validade',
      field: 'dataValidade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Usuário',
      field: 'usuario',
      valueConverter: (value) => value == null ? '' : value['nome'],
    ),
    CustomDataColumn(
      text: 'Data Hora',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
  ];

  final InsumoMovimentoPageCubit bloc =
      InsumoMovimentoPageCubit(service: InsumoMovimentoService());
  late final InsumoMovimentoFilter filter;
  late final InsumoCubit insumoBloc;

  @override
  void initState() {
    filter = InsumoMovimentoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    bloc.loadInsumoMovimentoFilter(filter);
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
            FilterButtonWidget(
              onPressed: () => {
                openModalFilter(context),
              },
            ),
            const Padding(padding: EdgeInsets.only(right: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  InsumoMovimentoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<InsumoMovimentoPageCubit, InsumoMovimentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child:
              BlocBuilder<InsumoMovimentoPageCubit, InsumoMovimentoPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: PlutoGridWidget(
                    onEdit: (InsumoMovimentoModel objeto) =>
                        {openModal(context, InsumoMovimentoModel.copy(objeto))},
                    onDelete: (InsumoMovimentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.insumosMovimentos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModalFilter(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              DatePickerWidget(
                placeholder: 'Data Inicio',
                onDateSelected: (value) => filter.startDate = value,
                initialValue: filter.startDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                placeholder: 'Data Término',
                onDateSelected: (value) => filter.finalDate = value,
                initialValue: filter.finalDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              Builder(
                builder: (context) {
                  return DropDownWidget<TipoMovimentoOption>(
                    sourceList: TipoMovimentoOption.tipoMovimentoOption,
                    initialValue: TipoMovimentoOption.tipoMovimentoOption
                        .where(
                          (element) => element.cod == filter.codTipoMovimento,
                        )
                        .firstOrNull,
                    placeholder: 'Situação',
                    onChanged: (value) => filter.codTipoMovimento = value.cod,
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
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadInsumoMovimentoFilter(filter);
      }
    });
  }

  void openModal(BuildContext context, InsumoMovimentoModel insumoMovimento) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return InsumoMovimentoPageFrm(
          insumoMovimento: insumoMovimento,
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadInsumoMovimentoFilter(filter);
    });
  }

  void delete(
    BuildContext context,
    InsumoMovimentoModel insumoMovimento,
  ) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da movimentação de insumo\n${insumoMovimento.cod}',
    );
    if (confirmacao) bloc.delete(insumoMovimento);
  }

  void deleted(InsumoMovimentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadInsumoMovimentoFilter(filter);
  }

  void onError(InsumoMovimentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

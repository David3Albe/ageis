import 'package:ageiscme_admin/app/module/pages/insumo/insumo/insumo_page_frm/insumo_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumo/insumo_page_state.dart';
import 'package:ageiscme_data/services/insumo/insumo_service.dart';
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

class InsumoPage extends StatefulWidget {
  InsumoPage({super.key});

  @override
  State<InsumoPage> createState() => _InsumoPageState();
}

class _InsumoPageState extends State<InsumoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Cod. Barra',
      field: 'codBarra',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Unidade Medida', field: 'unidadeMedida'),
    CustomDataColumn(text: 'Embalagem', field: 'embalagem'),
    CustomDataColumn(
      text: 'Qtde',
      field: 'qtdeEmbalagem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Fabricante', field: 'fabricante'),
    CustomDataColumn(text: 'Fornecedor', field: 'fornecedor'),
    CustomDataColumn(text: 'Registro Anvisa', field: 'registroAnvisa'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final InsumoPageCubit bloc = InsumoPageCubit(service: InsumoService());

  @override
  void initState() {
    bloc.loadInsumo();
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
              InsumoModel.empty(),
            ),
          },
        ),
        BlocListener<InsumoPageCubit, InsumoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<InsumoPageCubit, InsumoPageState>(
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
                    onEdit: (InsumoModel objeto) =>
                        {openModal(context, InsumoModel.copy(objeto))},
                    onDelete: (InsumoModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.insumos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, InsumoModel insumo) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return InsumoPageFrm(
          insumo: insumo,
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadInsumo();
    });
  }

  void delete(BuildContext context, InsumoModel insumo) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Insumo\n${insumo.cod} - ${insumo.nome}',
    );
    if (confirmacao) bloc.delete(insumo);
  }

  void deleted(InsumoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadInsumo();
  }

  void onError(InsumoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

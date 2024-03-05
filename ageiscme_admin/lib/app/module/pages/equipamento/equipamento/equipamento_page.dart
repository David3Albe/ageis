import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page_frm/equipamento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page_state.dart';
import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
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

class EquipamentoPage extends StatefulWidget {
  EquipamentoPage({super.key});

  @override
  State<EquipamentoPage> createState() => _EquipamentoPageState();
}

class _EquipamentoPageState extends State<EquipamentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Cód. Barras', field: 'codBarra'),
    CustomDataColumn(text: 'Fabricante', field: 'fabricante'),
    CustomDataColumn(
      text: 'Ano Fabricação',
      field: 'anoFabricacao',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Capacidade (Litros)',
      field: 'capacidadeLitro',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Série', field: 'serie'),
    CustomDataColumn(text: 'Registro Anvisa', field: 'registroAnvisa'),
    CustomDataColumn(
      text: 'Validade Inspeção',
      field: 'validadeInspecao',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final EquipamentoPageCubit bloc =
      EquipamentoPageCubit(service: EquipamentoService());

  @override
  void initState() {
    bloc.loadEquipamento();
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
              EquipamentoModel.empty(),
            ),
          },
        ),
        BlocListener<EquipamentoPageCubit, EquipamentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<EquipamentoPageCubit, EquipamentoPageState>(
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
                    onEdit: (EquipamentoModel objeto) =>
                        {openModal(context, EquipamentoModel.copy(objeto))},
                    onDelete: (EquipamentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.equipamentos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, EquipamentoModel equipamento) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return EquipamentoPageFrm(
          equipamento: equipamento,
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadEquipamento();
    });
  }

  void delete(BuildContext context, EquipamentoModel equipamento) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Equipamento\n${equipamento.cod} - ${equipamento.nome}',
    );
    if (confirmacao) bloc.delete(equipamento);
  }

  void deleted(EquipamentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadEquipamento();
  }

  void onError(EquipamentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

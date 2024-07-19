import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page_frm/equipamento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento/equipamento_page_state.dart';
import 'package:ageiscme_data/services/equipamento/equipamento_service.dart';
import 'package:ageiscme_models/filters/equipamento/equipamento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
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

class EquipamentoPage extends StatefulWidget {
  const EquipamentoPage({super.key});

  @override
  State<EquipamentoPage> createState() => _EquipamentoPageState();
}

class _EquipamentoPageState extends State<EquipamentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
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
    load();
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
              onPressed: load,
            ),
            const Padding(padding: EdgeInsets.only(left: 5)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  EquipamentoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocConsumer<EquipamentoPageCubit, EquipamentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
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
                  orderDescendingFieldColumn: 'cod',
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
      ],
    );
  }

  void load() {
    bloc.loadFilter(
      EquipamentoFilter(
        incluirTipoServicos: true,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    EquipamentoModel equipamento,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Equipamento',
      widget: EquipamentoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        equipamento: equipamento,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    load();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, EquipamentoModel equipamento) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Equipamento\n${equipamento.cod} - ${equipamento.nome}',
      onConfirm: () => onConfirmDelete(equipamento),
    );
  }

  void onConfirmDelete(EquipamentoModel equipamento) {
    bloc.delete(equipamento);
  }

  void deleted(EquipamentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    load();
  }

  void onError(EquipamentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

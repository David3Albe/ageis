import 'package:ageiscme_admin/app/module/pages/colaborador/tipo_afastamento/tipo_afastamento_page_frm/tipo_afastamento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/tipo_afastamento/tipo_afastamento_page_state.dart';
import 'package:ageiscme_data/services/tipo_afastamento/tipo_afastamento_service.dart';
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

class TipoAfastamentoPage extends StatefulWidget {
  const TipoAfastamentoPage({super.key});

  @override
  State<TipoAfastamentoPage> createState() => _TipoAfastamentoPageState();
}

class _TipoAfastamentoPageState extends State<TipoAfastamentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Motivo', field: 'motivo'),
    CustomDataColumn(
      text: 'Dias Concedidos',
      field: 'diasConcedido',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Abertura Obrigatória do CAT',
      field: 'cat',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final TipoAfastamentoPageCubit bloc =
      TipoAfastamentoPageCubit(service: TipoAfastamentoService());

  @override
  void initState() {
    bloc.loadTipoAfastamento();
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
              onPressed: bloc.loadTipoAfastamento,
            ),
            const Padding(padding: EdgeInsets.only(left: 4)),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  TipoAfastamentoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<TipoAfastamentoPageCubit, TipoAfastamentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child:
              BlocBuilder<TipoAfastamentoPageCubit, TipoAfastamentoPageState>(
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
                    onEdit: (TipoAfastamentoModel objeto) =>
                        {openModal(context, TipoAfastamentoModel.copy(objeto))},
                    onDelete: (TipoAfastamentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.tiposAfastamento,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future openModal(
    BuildContext context,
    TipoAfastamentoModel tipoAfastamento,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Tipo de Afastamento',
      widget: TipoAfastamentoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        tipoAfastamento: tipoAfastamento,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadTipoAfastamento();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(
    BuildContext context,
    TipoAfastamentoModel tipoAfastamento,
  ) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Tipo de Afastamento\n${tipoAfastamento.cod} - ${tipoAfastamento.motivo}',
      onConfirm: () => onConfirmDelete(tipoAfastamento),
    );
  }

  void onConfirmDelete(
    TipoAfastamentoModel tipoAfastamento,
  ) async {
    bloc.delete(tipoAfastamento);
  }

  void deleted(TipoAfastamentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadTipoAfastamento();
  }

  void onError(TipoAfastamentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

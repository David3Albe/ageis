import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page_frm/tamanho_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/tamanho/tamanho_page_state.dart';
import 'package:ageiscme_data/services/tamanho/tamanho_service.dart';
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

class TamanhoPage extends StatefulWidget {
  const TamanhoPage({super.key});

  @override
  State<TamanhoPage> createState() => _TamanhoPageState();
}

class _TamanhoPageState extends State<TamanhoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Sigla', field: 'sigla'),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Referencial numérico único do tamanho',
      field: 'referencial',
      type: CustomDataColumnType.Number,
    ),
  ];

  final TamanhoPageCubit bloc = TamanhoPageCubit(service: TamanhoService());

  @override
  void initState() {
    bloc.loadTamanho();
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
              onPressed: () => bloc.loadTamanho(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  TamanhoModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<TamanhoPageCubit, TamanhoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<TamanhoPageCubit, TamanhoPageState>(
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
                    onEdit: (TamanhoModel objeto) =>
                        {openModal(context, TamanhoModel.copy(objeto))},
                    onDelete: (TamanhoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.tamanhos,
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
    TamanhoModel tamanho,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: (tamanho.cod ?? 0).toString(),
      title: 'Cadastro/Edição Tamanho',
      widget: TamanhoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        tamanho: tamanho,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadTamanho();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, TamanhoModel tamanho) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Tamanho\n${tamanho.cod} - ${tamanho.sigla}',
      onConfirm: () => confirmDelete(tamanho),
    );
  }

  void confirmDelete(TamanhoModel tamanho) async {
    bloc.delete(tamanho);
  }

  void deleted(TamanhoPageState state) {
    ToastUtils.showCustomToastSucess(context, state.message);
    bloc.loadTamanho();
  }

  void onError(TamanhoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

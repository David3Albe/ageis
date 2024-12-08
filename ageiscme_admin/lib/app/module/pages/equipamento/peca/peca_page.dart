import 'package:ageiscme_admin/app/module/pages/equipamento/peca/peca_page_frm/peca_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/peca/peca_page_state.dart';
import 'package:ageiscme_data/services/peca/peca_service.dart';
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

class PecaPage extends StatefulWidget {
  const PecaPage({super.key});

  @override
  State<PecaPage> createState() => _PecaPageState();
}

class _PecaPageState extends State<PecaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Peça', field: 'peca'),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final PecaPageCubit bloc = PecaPageCubit(service: PecaService());

  @override
  void initState() {
    bloc.loadPeca();
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
              onPressed: bloc.loadPeca,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            AddButtonWidget(
              onPressed: () => {
                openModal(
                  context,
                  PecaModel.empty(),
                ),
              },
            ),
          ],
        ),
        BlocListener<PecaPageCubit, PecaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<PecaPageCubit, PecaPageState>(
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
                    filterOnlyActives: true,
                    onEdit: (PecaModel objeto) =>
                        {openModal(context, PecaModel.copy(objeto))},
                    onDelete: (PecaModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.pecas,
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
    PecaModel peca,
  ) async {
    late int chave;
    int codigo = peca.cod ?? 0;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: codigo.toString(),
      title: 'Cadastro/Edição Peça',
      widget: PecaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        peca: peca,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadPeca();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, PecaModel peca) async {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Confirma a remoção da Peça\n${peca.cod} - ${peca.peca}',
      onConfirm: () => onConfirmDelete(peca),
    );
  }

  void onConfirmDelete(PecaModel peca) async {
    bloc.delete(peca);
  }

  void deleted(PecaPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadPeca();
  }

  void onError(PecaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

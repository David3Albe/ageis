import 'package:ageiscme_admin/app/module/pages/material/etiqueta/etiqueta_page_frm/etiqueta_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/etiqueta/etiqueta_page_state.dart';
import 'package:ageiscme_data/services/etiqueta/etiqueta_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
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

class EtiquetaPage extends StatefulWidget {
  const EtiquetaPage({super.key});

  @override
  State<EtiquetaPage> createState() => _EtiquetaPageState();
}

class _EtiquetaPageState extends State<EtiquetaPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
    CustomDataColumn(
      text: 'Limite Processos',
      field: 'limiteProcessos',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final EtiquetaPageCubit bloc = EtiquetaPageCubit(service: EtiquetaService());

  @override
  void initState() {
    bloc.loadEtiqueta();
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
              EtiquetaModel.empty(),
            ),
          },
        ),
        BlocListener<EtiquetaPageCubit, EtiquetaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<EtiquetaPageCubit, EtiquetaPageState>(
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
                    onEdit: (EtiquetaModel objeto) =>
                        {openModal(context, EtiquetaModel.copy(objeto))},
                    onDelete: (EtiquetaModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.etiquetas,
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
    EtiquetaModel etiqueta,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Etiqueta',
      widget: EtiquetaPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        etiqueta: etiqueta,
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadEtiqueta();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, EtiquetaModel etiqueta) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção da etiqueta\n${etiqueta.cod} - ${etiqueta.descricao}',
      onConfirm: () => confirmDelete(etiqueta),
    );
  }

  void confirmDelete(EtiquetaModel etiqueta) async {
    bloc.delete(etiqueta);
  }

  void deleted(EtiquetaPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadEtiqueta();
  }

  void onError(EtiquetaPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

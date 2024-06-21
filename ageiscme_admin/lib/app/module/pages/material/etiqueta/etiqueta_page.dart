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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EtiquetaPage extends StatefulWidget {
  EtiquetaPage({super.key});

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

  void openModal(BuildContext context, EtiquetaModel etiqueta) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: EtiquetaPageFrm(
            etiqueta: etiqueta,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadEtiqueta();
    });
  }

  void delete(BuildContext context, EtiquetaModel etiqueta) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da etiqueta\n${etiqueta.cod} - ${etiqueta.descricao}',
    );
    if (confirmacao) bloc.delete(etiqueta);
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

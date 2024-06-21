import 'package:ageiscme_admin/app/module/pages/material/kit_cor/kit_cor_page_frm/kit_cor_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/material/kit_cor/kit_cor_page_state.dart';
import 'package:ageiscme_data/services/kit_cor/kit_cor_service.dart';
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

class KitCorPage extends StatefulWidget {
  KitCorPage({super.key});

  @override
  State<KitCorPage> createState() => _KitCorPageState();
}

class _KitCorPageState extends State<KitCorPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 100,
    ),
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(
      text: 'Red',
      field: 'red',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Green',
      field: 'green',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Blue',
      field: 'blue',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Ativo',
      field: 'ativo',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  final KitCorPageCubit bloc = KitCorPageCubit(service: KitCorService());

  @override
  void initState() {
    bloc.loadKitCor();
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
              KitCorModel.empty(),
            ),
          },
        ),
        BlocListener<KitCorPageCubit, KitCorPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<KitCorPageCubit, KitCorPageState>(
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
                    onEdit: (KitCorModel objeto) =>
                        {openModal(context, KitCorModel.copy(objeto))},
                    onDelete: (KitCorModel objeto) => {delete(context, objeto)},
                    columns: colunas,
                    items: state.kitsCor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, KitCorModel kitCor) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: KitCorPageFrm(
            kitCor: kitCor,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadKitCor();
    });
  }

  void delete(BuildContext context, KitCorModel kitCor) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção da Cor de Kit\n${kitCor.cod} - ${kitCor.nome}',
    );
    if (confirmacao) bloc.delete(kitCor);
  }

  void deleted(KitCorPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadKitCor();
  }

  void onError(KitCorPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

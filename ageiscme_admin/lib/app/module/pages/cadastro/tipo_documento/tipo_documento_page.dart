import 'package:ageiscme_admin/app/module/pages/cadastro/tipo_documento/tipo_documento_page_frm/tipo_documento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/tipo_documento/tipo_documento_page_state.dart';
import 'package:ageiscme_data/services/tipo_documento/tipo_documento_service.dart';
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

class TipoDocumentoPage extends StatefulWidget {
  TipoDocumentoPage({super.key});

  @override
  State<TipoDocumentoPage> createState() => _TipoDocumentoPageState();
}

class _TipoDocumentoPageState extends State<TipoDocumentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Descrição', field: 'descricao'),
  ];

  final TipoDocumentoPageCubit bloc =
      TipoDocumentoPageCubit(service: TipoDocumentoService());

  @override
  void initState() {
    bloc.loadTipoDocumento();
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
              TipoDocumentoModel.empty(),
            ),
          },
        ),
        BlocListener<TipoDocumentoPageCubit, TipoDocumentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<TipoDocumentoPageCubit, TipoDocumentoPageState>(
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
                    onEdit: (TipoDocumentoModel objeto) =>
                        {openModal(context, TipoDocumentoModel.copy(objeto))},
                    onDelete: (TipoDocumentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.tiposDocumento,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void openModal(BuildContext context, TipoDocumentoModel tipoDocumento) {
    showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TipoDocumentoPageFrm(
            tipoDocumento: tipoDocumento,
          ),
        );
      },
    ).then((result) {
      if (result == null || !result.$1) return;
      ToastUtils.showCustomToastSucess(context, result.$2);
      bloc.loadTipoDocumento();
    });
  }

  void delete(BuildContext context, TipoDocumentoModel tipoDocumento) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Tipo de Documento\n${tipoDocumento.cod} - ${tipoDocumento.descricao}',
    );
    if (confirmacao) bloc.delete(tipoDocumento);
  }

  void deleted(TipoDocumentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadTipoDocumento();
  }

  void onError(TipoDocumentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }
}

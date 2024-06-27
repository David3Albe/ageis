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
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TipoDocumentoPage extends StatefulWidget {
  const TipoDocumentoPage({super.key});

  @override
  State<TipoDocumentoPage> createState() => _TipoDocumentoPageState();
}

class _TipoDocumentoPageState extends State<TipoDocumentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
      width: 110,
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
                    orderDescendingFieldColumn: 'cod',
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

  Future openModal(
    BuildContext context,
    TipoDocumentoModel tipoDocumento,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      theme: Theme.of(context),
      title: 'Cadastro/Edição Tipo de Documento',
      widget: TipoDocumentoPageFrm(
        tipoDocumento: tipoDocumento,
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
      ),
    );
  }

  void onSaved(String message, int chave) {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    bloc.loadTipoDocumento();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, TipoDocumentoModel tipoDocumento) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Tipo de Documento\n${tipoDocumento.cod} - ${tipoDocumento.descricao}',
      onConfirm: () => onConfirmDelete(tipoDocumento),
    );
  }

  void onConfirmDelete(TipoDocumentoModel tipoDocumento) {
    bloc.delete(tipoDocumento);
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

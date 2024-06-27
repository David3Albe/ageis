import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page_frm/documento_page_frm.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page_state.dart';
import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/filters/documento/documento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/add_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DocumentoPage extends StatefulWidget {
  const DocumentoPage({this.cod, super.key});
  final int? cod;

  @override
  State<DocumentoPage> createState() => _DocumentoPageState();
}

class _DocumentoPageState extends State<DocumentoPage> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Cód',
      field: 'cod',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Nome Documento', field: 'descricao'),
    CustomDataColumn(
      text: 'Tipo Documento',
      field: 'tipoDocumento',
      valueConverter: (value) => value['descricao'],
    ),
    CustomDataColumn(
      text: 'Validade',
      field: 'validade',
      type: CustomDataColumnType.Date,
    ),
    CustomDataColumn(
      text: 'Controlar Validade',
      field: 'controlarValidade',
      type: CustomDataColumnType.Checkbox,
    ),
  ];

  late final DocumentoPageCubit bloc;
  late final DocumentoService service;

  @override
  void initState() {
    service = DocumentoService();
    bloc = DocumentoPageCubit(service: service);
    bloc.loadDocumento().then((value) {
      if (widget.cod == null) return;
      DocumentoModel? documento = bloc.state.documentos
          .where((element) => element.cod == widget.cod)
          .firstOrNull;
      if (documento == null) return;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => openModal(
          context,
          documento,
        ),
      );
    });
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
              DocumentoModel.empty(),
            ),
          },
        ),
        BlocListener<DocumentoPageCubit, DocumentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.deleted) deleted(state);
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<DocumentoPageCubit, DocumentoPageState>(
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
                    onEdit: (DocumentoModel objeto) =>
                        {openModal(context, DocumentoModel.copy(objeto))},
                    onDelete: (DocumentoModel objeto) =>
                        {delete(context, objeto)},
                    columns: colunas,
                    items: state.documentos,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<DocumentoModel?> getFilter(DocumentoModel documento) async {
    return service.filterOne(
      DocumentoFilter(
        cod: documento.cod,
      ),
    );
  }

  Future openModal(
    BuildContext context,
    DocumentoModel documento,
  ) async {
    LoadingController loading = LoadingController(context: context);

    DocumentoModel? doc = documento;
    if (documento.cod != 0) {
      doc = await getFilter(
        documento,
      );
      if (doc == null) {
        loading.close(context, mounted);
        notFoundError();
        return;
      }
    }
    loading.close(context, mounted);

    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Documento',
      widget: DocumentoPageFrm(
        onCancel: () => onCancel(chave),
        onSaved: (str) => onSaved(str, chave),
        documento: doc,
      ),
    );
  }

  Future onSaved(String message, int chave) async {
    WindowsHelper.RemoverWidget(chave);
    ToastUtils.showCustomToastSucess(context, message);
    await bloc.loadDocumento();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void delete(BuildContext context, DocumentoModel documento) {
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message:
          'Confirma a remoção do Documento\n${documento.cod}  ${documento.descricao}',
      onConfirm: () => onConfirmDelete(documento),
    );
  }

  void onConfirmDelete(DocumentoModel documento) {
    bloc.delete(documento);
  }

  void deleted(DocumentoPageState state) {
    ToastUtils.showCustomToastSucess(
      context,
      state.message,
    );
    bloc.loadDocumento();
  }

  void onError(DocumentoPageState state) {
    ErrorUtils.showErrorDialog(context, [state.error]);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Documento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

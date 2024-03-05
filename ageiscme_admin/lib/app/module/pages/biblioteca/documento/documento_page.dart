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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DocumentoPage extends StatefulWidget {
  DocumentoPage({super.key});

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
    bloc.loadDocumento();
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

  Future<void> openModal(BuildContext context, DocumentoModel documento) async {
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

    (bool, String)? result = await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DocumentoPageFrm(
          documento: doc!,
        );
      },
    );
    if (result == null || !result.$1) return;
    ToastUtils.showCustomToastSucess(context, result.$2);
    bloc.loadDocumento();
  }

  void delete(BuildContext context, DocumentoModel documento) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Confirma a remoção do Documento\n${documento.cod}  ${documento.descricao}',
    );
    if (confirmacao) bloc.delete(documento);
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

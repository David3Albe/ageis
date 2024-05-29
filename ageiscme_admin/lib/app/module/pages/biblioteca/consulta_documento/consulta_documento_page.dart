import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tipo_documento/tipo_documento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/consulta_documento/consulta_documento_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page_frm/documento_page_frm.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/documento/consulta_documento_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/documento/documento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/documento/consulta_documento_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_interface.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_stub.dart'
    if (dart.library.html) 'package:compartilhados/componentes/botoes/open_doc/open_doc_helper_web.dart'
    if (dart.library.io) 'package:compartilhados/componentes/botoes/open_doc/open_doc_io_helper.dart';

class ConsultaDocumentoPage extends StatefulWidget {
  ConsultaDocumentoPage({super.key});

  @override
  State<ConsultaDocumentoPage> createState() => _ConsultaDocumentoPageState();
}

class _ConsultaDocumentoPageState extends State<ConsultaDocumentoPage> {
  static Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    final String? validadeStr = renderContext.row.cells['validade']?.value;
    if (validadeStr != null) {
      final DateTime? validadeCellValue = DateTime.tryParse(validadeStr);
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final formattedDate = validadeCellValue != null
          ? formatter.format(validadeCellValue)
          : validadeStr;

      if (validadeCellValue != null &&
          validadeCellValue.isBefore(DateTime.now())) {
        cor = Cores.corTextoVermelho;
      }

      return Center(
        child: Text(
          formattedDate,
          textAlign: TextAlign.center,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: cor,
          ),
        ),
      );
    }
    return Text(
      renderContext.cell.value.toString(),
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
      ),
    );
  }

  final List<CustomDataColumn> colunas = [
    CustomDataColumn(text: 'Nome', field: 'nome'),
    CustomDataColumn(text: 'Tipo', field: 'tipoDocumento'),
    CustomDataColumn(
      text: 'Validade',
      field: 'validade',
      customRenderer: getCustomRenderer,
    ),
  ];

  late final ConsultaDocumentoPageCubit bloc;
  late final TipoDocumentoCubit tipoDocumentoBloc;
  late final ConsultaDocumentoFilter filter;
  late final DocumentoService service;

  @override
  void initState() {
    bloc = ConsultaDocumentoPageCubit(
      service: ConsultaDocumentoService(),
    );
    filter = ConsultaDocumentoFilter.empty();
    tipoDocumentoBloc = TipoDocumentoCubit();
    tipoDocumentoBloc.loadAll();
    service = DocumentoService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButtonWidget(
          onPressed: () => {
            openModal(context),
          },
        ),
        BlocListener<ConsultaDocumentoPageCubit, ConsultaDocumentoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaDocumentoPageCubit,
              ConsultaDocumentoPageState>(
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
                    smallRows: true,
                    columns: colunas,
                    items: state.documentos,
                    onDownload: (objeto) => baixarImagem(objeto.cod),
                    onDetail: (event, obj) async {
                      var isUserValid =
                          await AccessUserService.validateUserHasRight(
                        DireitoEnum.DocumentosCadastro,
                      );

                      if (isUserValid == false) {
                        return ToastUtils.showCustomToastWarning(
                          context,
                          'O Seu usuário não tem permissão para esta tela!',
                        );
                      }

                      await getFilter(obj.cod!).then((doc) {
                        if (doc != null) {
                          openModalRedirect(context, obj.cod!);
                        }
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<DocumentoModel?> getFilter(int cod) async {
    return service.filterOne(
      DocumentoFilter(
        cod: cod,
      ),
    );
  }

  Future<void> openModalRedirect(BuildContext context, int cod) async {
    LoadingController loading = LoadingController(context: context);

    DocumentoModel? doc;
    doc = await getFilter(cod);
    if (doc == null) {
      loading.close(context, mounted);
      notFoundError();
      return;
    }
    loading.close(context, mounted);

    await showDialog<(bool, String)>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DocumentoPageFrm(
          documento: doc!,
        );
      },
    );
  }

  void onError(ConsultaDocumentoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: Column(
            children: [
              BlocBuilder<TipoDocumentoCubit, List<TipoDocumentoModel>>(
                bloc: tipoDocumentoBloc,
                builder: (context, tiposDocumentos) {
                  TipoDocumentoModel? tipoDocumento = tiposDocumentos
                      .where(
                        (element) => element.cod == filter.codTipo,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<TipoDocumentoModel>(
                    textFunction: (tipoDocumento) =>
                        tipoDocumento.GetNomeDepositoText(),
                    initialValue: tipoDocumento,
                    sourceList: tiposDocumentos,
                    onChanged: (value) => filter.codTipo = value?.cod,
                    placeholder: 'Tipo',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder: 'Nome',
                onChanged: (value) => filter.descricao = value,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomCheckboxWidget(
                checked: filter.validade,
                onClick: (value) => filter.validade = value,
                text: 'Apenas Vencidos',
                align: MainAxisAlignment.start,
              ),
            ],
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadDocumento(filter);
      }
    });
  }

  void baixarImagem(int? cod) async {
    DocumentoModel? documentoFiltro = await DocumentoService().filterOne(
      DocumentoFilter(
        cod: cod,
      ),
    );

    if (documentoFiltro == null) {
      ToastUtils.showCustomToastWarning(context, 'Documento Não encontrado');
      return;
    }
    _openDocument(
      context,
      documentoFiltro.documento!,
      documentoFiltro.nomeDocumento != null
          ? documentoFiltro.nomeDocumento!
          : 'arquivo sem nome.Webp',
    );
  }

  void _openDocument(
    BuildContext context,
    String docString,
    String docName,
  ) async {
    OpenDocInterface openDoc = getOpenDocHelper();
    openDoc.open(context, docString, docName);
  }

  void notFoundError() {
    ErrorUtils.showErrorDialog(context, [
      'O Registro de Documento que está tentando buscar não foi encontrado,' +
          'ou foi alterado/excluído por algum usuário, re-consulte e tente novamente caso continuar entre em contato com o suporte',
    ]);
  }
}

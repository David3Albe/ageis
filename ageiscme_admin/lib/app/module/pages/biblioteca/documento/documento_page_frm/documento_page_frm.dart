import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tipo_documento/tipo_documento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page_frm/documento_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_save_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DocumentoPageFrm extends StatefulWidget {
  const DocumentoPageFrm({
    Key? key,
    required this.documento,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final DocumentoModel documento;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<DocumentoPageFrm> createState() =>
      _DocumentoPageFrmState(documento: documento);
}

class _DocumentoPageFrmState extends State<DocumentoPageFrm> {
  _DocumentoPageFrmState({required this.documento});

  late final TipoDocumentoCubit tipoDocumentoCubit;
  late String titulo;
  DocumentoModel documento;

  late final DocumentoPageFrmCubit cubit = DocumentoPageFrmCubit(
    documentoModel: documento,
    service: DocumentoService(),
  );

  late final TextFieldStringWidget txtNomeDocumento = TextFieldStringWidget(
    placeholder: 'Nome do Documento *',
    onChanged: (String? str) {
      documento.descricao = txtNomeDocumento.text;
    },
  );
  late final TextFieldStringAreaWidget txtObservacao =
      TextFieldStringAreaWidget(
    placeholder: 'Observação *',
    onChanged: (String? str) {
      documento.observacao = txtObservacao.text;
    },
  );
  late final DatePickerWidget txtDataValidade = DatePickerWidget(
    placeholder: 'Validade',
    onDateSelected: (value) => documento.validade = value,
    initialValue: documento.validade!,
  );

  late bool Function() validateTipoDocumento;

  @override
  void initState() {
    tipoDocumentoCubit = TipoDocumentoCubit();
    tipoDocumentoCubit.loadAll();
    txtNomeDocumento.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 250) {
        return 'Pode ter no máximo 250 caracteres';
      }
      ;
      return '';
    });
    txtObservacao.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    txtNomeDocumento.text = documento.descricao.toString();
    txtObservacao.text = documento.observacao.toString();
    titulo = 'Cadastro de Documento';
    if (documento.cod != 0) {
      titulo = 'Edição do Documento: ${documento.cod} - ${documento.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<DocumentoPageFrmCubit, DocumentoPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: size.width * .5,
                        minHeight: size.height * .5,
                        maxHeight: size.height * .8,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtNomeDocumento,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<TipoDocumentoCubit,
                                  TipoDocumentoState>(
                                bloc: tipoDocumentoCubit,
                                builder: (context, state) {
                                  if (state.loading) {
                                    return const Center(
                                      child: LoadingWidget(),
                                    );
                                  }
                                  TipoDocumentoModel? tipoDocumento = state
                                      .tipoDocumentos
                                      .where(
                                        (element) =>
                                            element.cod == documento.codTipo,
                                      )
                                      .firstOrNull;
                                  return DropDownSearchWidget<
                                      TipoDocumentoModel>(
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    validateBuilder:
                                        (context, validateMethodBuilder) =>
                                            validateTipoDocumento =
                                                validateMethodBuilder,
                                    textFunction: (p0) => p0.GetDropDownText(),
                                    initialValue: tipoDocumento,
                                    sourceList: state.tipoDocumentos,
                                    onChanged: (value) =>
                                        documento.codTipo = value?.cod,
                                    placeholder: 'Tipo Documento *',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDataValidade,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  CustomCheckboxWidget(
                                    checked: documento.controlarValidade,
                                    onClick: (value) =>
                                        documento.controlarValidade = value,
                                    text: 'Controlar Validade',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtObservacao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: LabelStringWidget(
                                text: documento.nomeDocumento == null
                                    ? 'Documento não Anexado'
                                    : 'Documento Anexado: ${documento.nomeDocumento!}',
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 24)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomPopupMenuWidget(
                  items: [
                    CustomPopupItemFileModel.getFileItem(
                      'Anexar DOC',
                      salvarDoc,
                    ),
                    if (documento.nomeDocumento != null &&
                        documento.documento != null)
                      CustomPopupItemModel(
                        text: 'Excluir DOC',
                        onTap: excluirDoc,
                      ),
                    if (documento.nomeDocumento != null &&
                        documento.documento != null)
                      CustomPopupItemSaveFileModel.getOpenDocItem(
                        text: 'Abrir DOC',
                        context: context,
                        docName: documento.nomeDocumento,
                        docString: documento.documento,
                      ),
                    if (documento.cod != null && documento.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: documento.cod!,
                          termo: 'DOCUMENTO',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Wrap(
                  spacing: 16 * paddingHorizontalScale,
                  runSpacing: 16 * paddingHorizontalScale,
                  alignment: WrapAlignment.end,
                  children: [
                    SaveButtonWidget(
                      onPressed: () => {salvar()},
                    ),
                    CleanButtonWidget(
                      onPressed: () => {
                        setState(() {
                          documento = DocumentoModel.empty();
                        }),
                      },
                    ),
                    CancelButtonUnfilledWidget(
                      onPressed: widget.onCancel,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void salvarDoc(Future<FileObjectModel?> Function() onSelectFile) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      documento.documento = fileNew.base64;
      documento.nomeDocumento = fileNew.fileName;
    });
  }

  void excluirDoc() {
    setState(() {
      documento.documento = null;
      documento.nomeDocumento = null;
    });
  }

  void salvar() {
    bool nomeDocumentoValid = txtNomeDocumento.valid;
    bool observacaoValid = txtObservacao.valid;
    bool tipoDocumentoValid = validateTipoDocumento();
    if (!nomeDocumentoValid || !observacaoValid || !tipoDocumentoValid) return;
    cubit.save(documento, widget.onSaved);
  }
}

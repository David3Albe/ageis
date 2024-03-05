import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tipo_documento/tipo_documento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/biblioteca/documento/documento_page_frm/documento_page_frm_state.dart';
import 'package:ageiscme_data/services/documento/documento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/botoes/delete_image_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class DocumentoPageFrm extends StatefulWidget {
  const DocumentoPageFrm({
    Key? key,
    required this.documento,
  }) : super(key: key);

  final DocumentoModel documento;

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
    placeholder: 'Nome do Documento',
    onChanged: (String? str) {
      documento.descricao = txtNomeDocumento.text;
    },
  );
  late final TextFieldStringAreaWidget txtObservacao =
      TextFieldStringAreaWidget(
    placeholder: 'Observação',
    onChanged: (String? str) {
      documento.observacao = txtObservacao.text;
    },
  );
  late final DatePickerWidget txtDataValidade = DatePickerWidget(
    placeholder: 'Validade',
    onDateSelected: (value) => documento.validade = value,
    initialValue: documento.validade!,
  );

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
    return BlocListener<DocumentoPageFrmCubit, DocumentoPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<DocumentoPageFrmCubit, DocumentoPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
            insetPadding: const EdgeInsets.all(50.0),
            title: Row(
              children: [
                Expanded(
                  child: TitleWidget(
                    text: titulo,
                  ),
                ),
                const Spacer(),
                CloseButtonWidget(
                  onPressed: () => Navigator.of(context).pop((false, '')),
                ),
              ],
            ),
            content: Container(
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
                          List<TipoDocumentoModel>>(
                        bloc: tipoDocumentoCubit,
                        builder: (context, tiposDocumento) {
                          TipoDocumentoModel? tipoDocumento = tiposDocumento
                              .where(
                                (element) => element.cod == documento.codTipo,
                              )
                              .firstOrNull;
                          return DropDownWidget<TipoDocumentoModel>(
                            initialValue: tipoDocumento,
                            sourceList: tiposDocumento,
                            onChanged: (value) =>
                                documento.codTipo = value.cod!,
                            placeholder: 'Tipo Documento',
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
                        text:
                            'Documento Anexado: ${documento.nomeDocumento == null ? '' : documento.nomeDocumento}',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 16 * paddingHorizontalScale,
                            spacing: 16 * paddingHorizontalScale,
                            children: [
                              UploadButtonWidget(
                                placeholder: 'Anexar DOC',
                                imageSelected: (value1, value2) {
                                  salvarDoc(value1, value2);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir DOC',
                                onPressed: documento.documento == null
                                    ? null
                                    : () => {excluirDoc()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir DOC',
                                documentoString: documento.documento,
                                documentName: documento.nomeDocumento ??
                                    'arquivo sem nome.jpg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            ),
            actions: [
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
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvarDoc(String doc, String nomeDoc) {
    documento.documento = doc;
    documento.nomeDocumento = nomeDoc;
    setState(() {});
  }

  void excluirDoc() {
    setState(() {
      documento.documento = null;
      documento.nomeDocumento = null;
    });
  }

  void salvar() {
    if (!txtNomeDocumento.valid || !txtObservacao.valid) return;

    cubit.save(documento);
  }
}

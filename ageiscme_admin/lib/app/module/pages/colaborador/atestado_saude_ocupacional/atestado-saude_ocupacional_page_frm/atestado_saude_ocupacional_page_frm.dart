import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado-saude_ocupacional_page_frm/atestado_saude_ocupacional_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/atestado_saude_ocupacional_exame_page.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional/atestado_saude_ocupacional_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_save_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalPageFrm extends StatefulWidget {
  const AtestadoSaudeOcupacionalPageFrm({
    Key? key,
    required this.atestadoSaudeOcupacional,
    required this.usuarioCubit,
    required this.onCancel,
    required this.onSaved,
  }) : super(key: key);

  final AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional;
  final UsuarioCubit usuarioCubit;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<AtestadoSaudeOcupacionalPageFrm> createState() =>
      _AtestadoSaudeOcupacionalFrmState(
        atestadoSaudeOcupacional: atestadoSaudeOcupacional,
      );
}

class _AtestadoSaudeOcupacionalFrmState
    extends State<AtestadoSaudeOcupacionalPageFrm> {
  _AtestadoSaudeOcupacionalFrmState({required this.atestadoSaudeOcupacional});
  late String titulo;
  AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional;
  late final AtestadoSaudeOcupacionalPageFrmCubit cubit =
      AtestadoSaudeOcupacionalPageFrmCubit(
    atestadoSaudeOcupacionalModel: atestadoSaudeOcupacional,
    service: AtestadoSaudeOcupacionalService(),
  );
  late final TextFieldStringWidget txtNomeMedico = TextFieldStringWidget(
    placeholder: 'Nome do Médico *',
    onChanged: (String? str) {
      atestadoSaudeOcupacional.nomeMedico = txtNomeMedico.text;
    },
  );
  late final TextFieldNumberWidget txtCrmMedico = TextFieldNumberWidget(
    placeholder: 'CRM do Médico *',
    onChanged: (String? str) {
      atestadoSaudeOcupacional.crmMedico = int.parse(txtCrmMedico.text);
    },
  );

  late bool Function() dataEmissaoValidate;
  late final DatePickerWidget dtpDataEmissao = DatePickerWidget(
    setDateValueBuilder: (context, setDateMethod) =>
        setDataEmissao = setDateMethod,
    validator: (date) => date == null ? 'Obrigatório' : null,
    validateBuilder: (context, validateMethodBuilder) =>
        dataEmissaoValidate = validateMethodBuilder,
    placeholder: 'Data Emissão *',
    onDateSelected: (value) => atestadoSaudeOcupacional.data = value,
    initialValue: atestadoSaudeOcupacional.data,
  );
  late bool Function() dataValidadeValidate;
  late final DatePickerWidget dtpDataValidade = DatePickerWidget(
    setDateValueBuilder: (context, setDateMethod) =>
        setDataValidade = setDateMethod,
    validator: (date) => date == null ? 'Obrigatório' : null,
    validateBuilder: (context, validateMethodBuilder) =>
        dataValidadeValidate = validateMethodBuilder,
    placeholder: 'Data Validade *',
    onDateSelected: (value) => atestadoSaudeOcupacional.validade = value,
    initialValue: atestadoSaudeOcupacional.validade,
  );

  @override
  void initState() {
    txtNomeMedico.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });

    txtCrmMedico.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    if (atestadoSaudeOcupacional.nomeMedico == null) {
      txtNomeMedico.text = '';
    } else {
      txtNomeMedico.text = atestadoSaudeOcupacional.nomeMedico.toString();
    }
    if (atestadoSaudeOcupacional.crmMedico == null) {
      txtCrmMedico.text = '';
    } else {
      txtCrmMedico.text = atestadoSaudeOcupacional.crmMedico.toString();
    }
    titulo = 'Registro de Atestado de Saúde Ocupacional - ASO';
    if (atestadoSaudeOcupacional.cod != 0) {
      titulo =
          'Edição de Atestado de Saúde Ocupacional: ${atestadoSaudeOcupacional.cod}';
    }
  }

  final ScrollController scroll = ScrollController();

  late bool Function() usuarioValidate;
  late bool Function() tipoAsoValidate;
  late bool Function() conclusaoValidate;

  late void Function(UsuarioModel?) setColaborador;
  late void Function(AtestadoSaudeOcupacionalTipoAsoOption?) setTipoAso;
  late void Function(DateTime?) setDataEmissao;
  late void Function(DateTime?) setDataValidade;
  late void Function(AtestadoSaudeOcupacionalConclusaoOption?) setConclusao;

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AtestadoSaudeOcupacionalPageFrmCubit,
        AtestadoSaudeOcupacionalPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                TitleWidget(
                  text: titulo,
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height * .8,
                      width: size.width * .8,
                      constraints: const BoxConstraints(
                        minWidth: 400,
                        maxWidth: 1500,
                        minHeight: 500,
                        maxHeight: 800,
                      ),
                      child: SingleChildScrollView(
                        controller: scroll,
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: BlocBuilder<UsuarioCubit, UsuarioState>(
                                bloc: widget.usuarioCubit,
                                builder: (context, state) {
                                  if (state.loading) {
                                    return const LoadingWidget();
                                  }
                                  List<UsuarioModel> usuarios = state.usuarios;
                                  return DropDownSearchWidget<UsuarioModel>(
                                    setSelectedItemBuilder: (
                                      context,
                                      setSelectedItemMethod,
                                    ) =>
                                        setColaborador = setSelectedItemMethod,
                                    validator: (val) =>
                                        val == null ? 'Obrigatório' : null,
                                    validateBuilder: (
                                      context,
                                      validateMethodBuilder,
                                    ) =>
                                        usuarioValidate = validateMethodBuilder,
                                    initialValue:
                                        atestadoSaudeOcupacional.usuario,
                                    sourceList: usuarios
                                        .where(
                                          (element) =>
                                              element.colaborador == true,
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      atestadoSaudeOcupacional.codUsuario =
                                          value?.cod;
                                      atestadoSaudeOcupacional.usuario = value;
                                    },
                                    placeholder: 'Colaborador *',
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtNomeMedico,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtCrmMedico,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: DropDownSearchWidget<
                                        AtestadoSaudeOcupacionalTipoAsoOption>(
                                      setSelectedItemBuilder: (
                                        context,
                                        setSelectedItemMethod,
                                      ) =>
                                          setTipoAso = setSelectedItemMethod,
                                      validator: (obj) =>
                                          obj == null ? 'Obrigatório' : null,
                                      validateBuilder:
                                          (context, validateMethodBuilder) =>
                                              tipoAsoValidate =
                                                  validateMethodBuilder,
                                      initialValue:
                                          AtestadoSaudeOcupacionalTipoAsoOption
                                              .tipoAsoOptions
                                              .where(
                                                (element) =>
                                                    element.cod ==
                                                    atestadoSaudeOcupacional
                                                        .tipo,
                                              )
                                              .firstOrNull,
                                      sourceList:
                                          AtestadoSaudeOcupacionalTipoAsoOption
                                              .tipoAsoOptions,
                                      textFunction: (p0) =>
                                          p0.GetDropDownText(),
                                      onChanged: (value) =>
                                          atestadoSaudeOcupacional.tipo =
                                              value?.cod,
                                      placeholder: 'Tipo do ASO *',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: dtpDataEmissao,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: dtpDataValidade,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: DropDownSearchWidget<
                                  AtestadoSaudeOcupacionalConclusaoOption>(
                                setSelectedItemBuilder: (
                                  context,
                                  setSelectedItemMethod,
                                ) =>
                                    setConclusao = setSelectedItemMethod,
                                validator: (obj) =>
                                    obj == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    conclusaoValidate = validateMethodBuilder,
                                initialValue:
                                    AtestadoSaudeOcupacionalConclusaoOption
                                        .conclusaoOptions
                                        .where(
                                          (element) =>
                                              element.cod ==
                                              atestadoSaudeOcupacional
                                                  .conclusao,
                                        )
                                        .firstOrNull,
                                sourceList:
                                    AtestadoSaudeOcupacionalConclusaoOption
                                        .conclusaoOptions,
                                textFunction: (p0) => p0.GetDropDownText(),
                                onChanged: (value) => atestadoSaudeOcupacional
                                    .conclusao = value?.cod,
                                placeholder: 'Conclusão *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  CustomCheckboxWidget(
                                    checked: atestadoSaudeOcupacional
                                        .controlarValidade,
                                    onClick: (value) => atestadoSaudeOcupacional
                                        .controlarValidade = value,
                                    text: 'Controlar Validade',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: LabelStringWidget(
                                text: atestadoSaudeOcupacional.anexo != null
                                    ? 'ASO anexada'
                                    : '',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                height: 250,
                                child: ImageDisplayWidget(
                                  imageBase64: atestadoSaudeOcupacional.anexo,
                                ),
                              ),
                            ),
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
                    if (atestadoSaudeOcupacional.cod != null &&
                        atestadoSaudeOcupacional.cod != 0)
                      CustomPopupItemModel(
                        text: 'Exames',
                        onTap: abrirExames,
                      ),
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar ASO',
                      salvarASO,
                    ),
                    if (atestadoSaudeOcupacional.anexo != null)
                      CustomPopupItemModel(
                        text: 'Desanexar ASO',
                        onTap: excluirAso,
                      ),
                    if (atestadoSaudeOcupacional.anexo != null)
                      CustomPopupItemOpenDocModel.getOpenDocItem(
                        'Abrir ASO',
                        context,
                        atestadoSaudeOcupacional.anexo,
                        'ASO ${atestadoSaudeOcupacional.cod ?? 0}.png',
                      ),
                    CustomPopupItemFileModel.getFileItem(
                      'Anexar DOC',
                      salvarDoc,
                    ),
                    if (atestadoSaudeOcupacional.docNome != null &&
                        atestadoSaudeOcupacional.doc != null)
                      CustomPopupItemModel(
                        text: 'Excluir DOC',
                        onTap: excluirDoc,
                      ),
                    if (atestadoSaudeOcupacional.docNome != null &&
                        atestadoSaudeOcupacional.doc != null)
                      CustomPopupItemSaveFileModel.getOpenDocItem(
                        text: 'Abrir DOC',
                        context: context,
                        docName: atestadoSaudeOcupacional.docNome,
                        docString: atestadoSaudeOcupacional.doc,
                      ),
                    if (atestadoSaudeOcupacional.cod != null &&
                        atestadoSaudeOcupacional.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title:
                            'Atestado Saúde Ocupacional ${atestadoSaudeOcupacional.cod}',
                        child: HistoricoPage(
                          pk: atestadoSaudeOcupacional.cod!,
                          termo: 'ATESTADO_SAUDE_OCUPACIONAL',
                        ),
                        context: context,
                      ),
                  ],
                ),
                Expanded(
                  child: LabelStringWidget(
                    text: atestadoSaudeOcupacional.docNome != null
                        ? 'Documento: ${atestadoSaudeOcupacional.docNome}'
                        : '',
                  ),
                ),
                Wrap(
                  spacing: 16 * paddingHorizontalScale,
                  runSpacing: 16 * paddingHorizontalScale,
                  alignment: WrapAlignment.end,
                  children: [
                    SaveButtonWidget(
                      onPressed: () => {salvar()},
                    ),
                    CleanButtonWidget(
                      onPressed: limpar,
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

  void limpar() {
    setState(() {
      atestadoSaudeOcupacional = AtestadoSaudeOcupacionalModel.empty();
    });
    setColaborador(null);
    setDataEmissao(null);
    setDataValidade(null);
    setTipoAso(null);
    setConclusao(null);
  }

  void abrirExames() async {
    if (atestadoSaudeOcupacional.cod == null ||
        atestadoSaudeOcupacional.cod == 0) {
      ToastUtils.showCustomToastNotice(
        context,
        'Não é possível ver os exames de uma ASO não cadastrada',
      );
      return;
    }
    int cod = atestadoSaudeOcupacional.cod ?? 0;
    WindowsHelper.OpenDefaultWindows(
      identificador: cod.toString(),
      title: 'Exames da ASO',
      widget: AtestadoSaudeOcupacionalExamePage(
        aso: atestadoSaudeOcupacional,
      ),
    );
  }

  void salvarASO(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      atestadoSaudeOcupacional.anexo = imageNew.base64;
    });
  }

  void salvarDoc(Future<FileObjectModel?> Function() onSelectFile) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      atestadoSaudeOcupacional.doc = fileNew.base64;
      atestadoSaudeOcupacional.docNome = fileNew.fileName;
    });
  }

  void excluirAso() {
    setState(() {
      atestadoSaudeOcupacional.anexo = null;
    });
  }

  void excluirDoc() {
    setState(() {
      atestadoSaudeOcupacional.doc = null;
      atestadoSaudeOcupacional.docNome = null;
    });
  }

  void salvar() {
    bool medicoValid = txtNomeMedico.valid;
    bool crmValid = txtCrmMedico.valid;
    bool usuarioValid = usuarioValidate();
    bool tipoAsoValid = tipoAsoValidate();
    bool dataEmissaoValid = dataEmissaoValidate();
    bool conclusaoValid = conclusaoValidate();
    bool dataValidadeValid = dataValidadeValidate();

    if (!usuarioValid) {
      scroll.jumpTo(0);
    } else if (!medicoValid) {
      scroll.jumpTo(40);
    } else if (!crmValid || !tipoAsoValid) {
      scroll.jumpTo(90);
    } else if (!dataEmissaoValid || !dataValidadeValid) {
      scroll.jumpTo(140);
    } else if (!conclusaoValid) {
      scroll.jumpTo(190);
    }

    if (!medicoValid ||
        !crmValid ||
        !usuarioValid ||
        !tipoAsoValid ||
        !dataEmissaoValid ||
        !conclusaoValid ||
        !dataValidadeValid) return;

    cubit.save(atestadoSaudeOcupacional, widget.onSaved);
  }
}

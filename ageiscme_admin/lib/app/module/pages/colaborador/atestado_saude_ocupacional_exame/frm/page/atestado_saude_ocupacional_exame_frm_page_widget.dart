import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/cubits/atestado_saude_ocupacional_exame_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/states/atestado_saude_ocupacional_exame_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_models/dto/atestado_saude_ocupacional_exame/save/atestado_saude_ocupacional_exame_save_dto.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_area_controller_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
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
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalExameFrmPageWidget extends StatefulWidget {
  const AtestadoSaudeOcupacionalExameFrmPageWidget({
    required this.onSaved,
    required this.onCancel,
    required this.codExame,
    super.key,
  });
  final void Function() onSaved;
  final void Function() onCancel;
  final int codExame;

  @override
  State<AtestadoSaudeOcupacionalExameFrmPageWidget> createState() =>
      _AtestadoSaudeOcupacionalExameFrmPageWidgetState();
}

class _AtestadoSaudeOcupacionalExameFrmPageWidgetState
    extends State<AtestadoSaudeOcupacionalExameFrmPageWidget> {
  late final AtestadoSaudeOcupacionalExameSaveDTO? dto;

  @override
  void initState() {
    BlocProvider.of<AtestadoSaudeOcupacionalExameFrmCubit>(context).load(
      cod: widget.codExame,
      context: context,
    );

    super.initState();
  }

  late TextFieldStringAreaControllerWidget txtExame;
  late bool Function() dataRealizacaoValid;

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = ScrollController();
    Size size = MediaQuery.of(context).size;
    double scalePadding = size.width / 1920;
    bool loading = context.select(
      (AtestadoSaudeOcupacionalExameFrmCubit cubit) => cubit.state.loading,
    );
    if (loading == true) {
      return Container(
        constraints: BoxConstraints(
          minWidth: size.width * .5,
          minHeight: size.height * .5,
          maxHeight: size.height * .8,
        ),
        child: const Center(
          child: LoadingWidget(),
        ),
      );
    }
    AtestadoSaudeOcupacionalExameFrmState state =
        BlocProvider.of<AtestadoSaudeOcupacionalExameFrmCubit>(
      context,
      listen: true,
    ).state;
    AtestadoSaudeOcupacionalExameSaveDTO dto = state.dto!;
    AtestadoSaudeOcupacionalExameSaveDTO dtoOriginal = state.dtoOriginal!;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 500,
        maxWidth: 1500,
        minHeight: 500,
        maxHeight: 1200,
      ),
      height: size.height * .8,
      width: size.width * .5,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Builder(
                builder: (context) {
                  return TitleWidget(
                    text: dtoOriginal.cod != 0
                        ? 'Edição do exame: ${dtoOriginal.cod} ${dtoOriginal.exame ?? ''}'
                        : 'Criação de novo exame',
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scroll,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Builder(
                        builder: (context) {
                          AtestadoSaudeOcupacionalModel aso = BlocProvider.of<
                              AtestadoSaudeOcupacionalExameFrmCubit>(
                            context,
                            listen: true,
                          ).aso;
                          DateFormat format = DateFormat('dd/MM/yyyy');
                          String value =
                              '${format.format(aso.data!)} ${aso.usuario?.nome ?? ''}}';
                          return TextFieldStringWidget(
                            placeholder: 'ASO',
                            initialValue: value,
                            readOnly: true,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Builder(
                        builder: (context) {
                          txtExame = TextFieldStringAreaControllerWidget(
                            validators: [
                              (str) => str.isEmpty
                                  ? 'Obrigatório'
                                  : str.length > 400
                                      ? 'Máximo 400 Caractéres'
                                      : '',
                            ],
                            placeholder: 'Exame',
                            controller: TextEditingController(
                              text: state.dto?.exame,
                            ),
                            onChanged: (str) => dto.exame = str,
                          );
                          return txtExame;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16 * scalePadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: DatePickerWidget(
                              validator: (date) =>
                                  date == null ? 'Obrigatório' : null,
                              validateBuilder: (
                                context,
                                validateMethodBuilder,
                              ) =>
                                  dataRealizacaoValid = validateMethodBuilder,
                              onDateSelected: (value) =>
                                  dto.dataRealizacao = value,
                              placeholder: 'Data Realizacao',
                              initialValue: state.dto?.dataRealizacao,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: LabelStringWidget(
                        text: dto.imagemExame != null ? 'Imagem anexada' : '',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 250,
                        child: ImageDisplayWidget(
                          imageBase64: dto.imagemExame,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Builder(
                builder: (context) {
                  AtestadoSaudeOcupacionalExameSaveDTO? dto = context.select(
                    (AtestadoSaudeOcupacionalExameFrmCubit cubit) =>
                        cubit.state.dtoOriginal,
                  );
                  return CustomPopupMenuWidget(
                    items: [
                      CustomPopupItemImageModel.getImageItem(
                        'Anexar Imagem',
                        (obj) => salvarImagem(obj, dto!),
                      ),
                      if (dto?.imagemExame != null)
                        CustomPopupItemModel(
                          text: 'Desanexar Imagem',
                          onTap: () => excluirImagem(dto!),
                        ),
                      if (dto?.imagemExame != null)
                        CustomPopupItemOpenDocModel.getOpenDocItem(
                          'Abrir Imagem',
                          context,
                          dto?.imagemExame,
                          'exame ${dto!.exame}.png',
                        ),
                      CustomPopupItemFileModel.getFileItem(
                        'Anexar DOC',
                        (doc) => salvarDoc(doc, dto!),
                      ),
                      if (dto?.docNome != null && dto?.doc != null)
                        CustomPopupItemModel(
                          text: 'Excluir DOC',
                          onTap: () => excluirDoc(dto!),
                        ),
                      if (dto?.docNome != null && dto?.doc != null)
                        CustomPopupItemSaveFileModel.getOpenDocItem(
                          text: 'Abrir DOC',
                          context: context,
                          docName: dto?.docNome,
                          docString: dto?.doc,
                        ),
                      if (dto?.cod != null && dto?.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          title: 'Atestado Saúde Ocupacional Exame ${dto!.cod}',
                          child: HistoricoPage(
                            pk: dto.cod,
                            termo: 'ATESTADO_SAUDE_OCUPACIONAL_EXAME',
                          ),
                          context: context,
                        ),
                    ],
                  );
                },
              ),
              LabelStringWidget(
                text: dto.docNome != null ? 'Documento: ${dto.docNome}' : '',
              ),
              Expanded(
                child: Wrap(
                  runSpacing: 16 * scalePadding,
                  spacing: 16 * scalePadding,
                  alignment: WrapAlignment.end,
                  children: [
                    SaveButtonWidget(
                      onPressed: () => save(
                        context: context,
                        scroll: scroll,
                        dataRealizacaoValidate: dataRealizacaoValid,
                        txtExame: txtExame,
                        exame: dto,
                      ),
                    ),
                    CleanButtonWidget(
                      onPressed: BlocProvider.of<
                              AtestadoSaudeOcupacionalExameFrmCubit>(context)
                          .clear,
                    ),
                    CancelButtonUnfilledWidget(
                      onPressed: widget.onCancel,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void salvarImagem(
    Future<ImageObjectModel?> Function() onSelectImage,
    AtestadoSaudeOcupacionalExameSaveDTO exame,
  ) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      exame.imagemExame = imageNew.base64;
    });
  }

  void salvarDoc(
    Future<FileObjectModel?> Function() onSelectFile,
    AtestadoSaudeOcupacionalExameSaveDTO exame,
  ) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      exame.doc = fileNew.base64;
      exame.docNome = fileNew.fileName;
    });
  }

  void excluirImagem(
    AtestadoSaudeOcupacionalExameSaveDTO exame,
  ) {
    setState(() {
      exame.imagemExame = null;
    });
  }

  void excluirDoc(
    AtestadoSaudeOcupacionalExameSaveDTO exame,
  ) {
    setState(() {
      exame.doc = null;
      exame.docNome = null;
    });
  }

  void save({
    required BuildContext context,
    required ScrollController scroll,
    required TextFieldStringAreaControllerWidget txtExame,
    required bool Function() dataRealizacaoValidate,
    required AtestadoSaudeOcupacionalExameSaveDTO exame,
  }) {
    bool txtExameValid = txtExame.valid;
    bool dataRealizacaoValid = dataRealizacaoValidate();
    if (!txtExameValid) {
      scroll.jumpTo(50);
      return;
    }
    if (!dataRealizacaoValid) {
      scroll.jumpTo(100);
      return;
    }
    if (exame.imagemExame == null || exame.imagemExame!.isEmpty) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário anexar uma imagem ao exame para salvar',
      );
      return;
    }
    BlocProvider.of<AtestadoSaudeOcupacionalExameFrmCubit>(context)
        .salvar(context: context, onSaved: widget.onSaved);
  }
}

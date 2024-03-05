import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional/atestado-saude_ocupacional_page_frm/atestado_saude_ocupacional_page_frm_state.dart';
import 'package:ageiscme_data/services/atestado_saude_ocupacional/atestado_saude_ocupacional_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/delete_image_button_widget.dart';
import 'package:compartilhados/componentes/botoes/open_doc/open_doc_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/botoes/upload_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalPageFrm extends StatefulWidget {
  const AtestadoSaudeOcupacionalPageFrm({
    Key? key,
    required this.atestadoSaudeOcupacional,
    required this.usuarioCubit,
  }) : super(key: key);

  final AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional;
  final UsuarioCubit usuarioCubit;

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
    placeholder: 'Nome do Médico',
    onChanged: (String? str) {
      atestadoSaudeOcupacional.nomeMedico = txtNomeMedico.text;
    },
  );
  late final TextFieldNumberWidget txtCrmMedico = TextFieldNumberWidget(
    placeholder: 'CRM do Médico',
    onChanged: (String? str) {
      atestadoSaudeOcupacional.crmMedico = int.parse(txtCrmMedico.text);
    },
  );
  late final DatePickerWidget dtpDataEmissao = DatePickerWidget(
    placeholder: 'Data Emissão',
    onDateSelected: (value) => atestadoSaudeOcupacional.data = value,
    initialValue: atestadoSaudeOcupacional.data,
  );
  late final DatePickerWidget dtpDataValidade = DatePickerWidget(
    placeholder: 'Data Validade',
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

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<AtestadoSaudeOcupacionalPageFrmCubit,
        AtestadoSaudeOcupacionalPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<AtestadoSaudeOcupacionalPageFrmCubit,
          AtestadoSaudeOcupacionalPageFrmState>(
        bloc: cubit,
        builder: (context, state) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(8.0),
            titlePadding: const EdgeInsets.all(8.0),
            actionsPadding: const EdgeInsets.all(8.0),
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
                      child: BlocBuilder<UsuarioCubit, UsuarioState>(
                        bloc: widget.usuarioCubit,
                        builder: (context, state) {
                          if (state.loading) return const LoadingWidget();
                          List<UsuarioModel> usuarios = state.usuarios;
                          return DropDownSearchWidget<UsuarioModel>(
                            initialValue: atestadoSaudeOcupacional.usuario,
                            sourceList: usuarios
                                .where(
                                  (element) => element.colaborador == true,
                                )
                                .toList(),
                            onChanged: (value) {
                              atestadoSaudeOcupacional.codUsuario = value?.cod;
                              atestadoSaudeOcupacional.usuario = value;
                            },
                            placeholder: 'Colaborador',
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
                            child: DropDownWidget<
                                AtestadoSaudeOcupacionalTipoAsoOption>(
                              initialValue:
                                  AtestadoSaudeOcupacionalTipoAsoOption
                                      .tipoAsoOptions
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            atestadoSaudeOcupacional.tipo,
                                      )
                                      .firstOrNull,
                              sourceList: AtestadoSaudeOcupacionalTipoAsoOption
                                  .tipoAsoOptions,
                              onChanged: (value) =>
                                  atestadoSaudeOcupacional.tipo = value.cod,
                              placeholder: 'Tipo do ASO',
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
                      child: DropDownWidget<
                          AtestadoSaudeOcupacionalConclusaoOption>(
                        initialValue: AtestadoSaudeOcupacionalConclusaoOption
                            .conclusaoOptions
                            .where(
                              (element) =>
                                  element.cod ==
                                  atestadoSaudeOcupacional.conclusao,
                            )
                            .firstOrNull,
                        sourceList: AtestadoSaudeOcupacionalConclusaoOption
                            .conclusaoOptions,
                        onChanged: (value) =>
                            atestadoSaudeOcupacional.conclusao = value.cod,
                        placeholder: 'Conclusão',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: atestadoSaudeOcupacional.controlarValidade,
                            onClick: (value) => atestadoSaudeOcupacional
                                .controlarValidade = value,
                            text: 'Controlar Validade',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ImageDisplayWidget(
                        imageBase64: atestadoSaudeOcupacional.anexo,
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
                                placeholder: 'Anexar ASO',
                                imageSelected: (value1, value2) {
                                  salvarAso(value1);
                                },
                              ),
                              UploadButtonWidget(
                                placeholder: 'Anexar DOC',
                                imageSelected: (value1, value2) {
                                  salvarDoc(value1, value2);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir ASO',
                                onPressed:
                                    atestadoSaudeOcupacional.anexo == null
                                        ? null
                                        : () => {excluirAso()},
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir DOC',
                                onPressed: atestadoSaudeOcupacional.doc == null
                                    ? null
                                    : () => {excluirDoc()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir ASO',
                                documentoString: atestadoSaudeOcupacional.anexo,
                                documentName:
                                    atestadoSaudeOcupacional.docNome ??
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
                        atestadoSaudeOcupacional =
                            AtestadoSaudeOcupacionalModel.empty();
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

  void salvarAso(String Aso) {
    setState(() {
      atestadoSaudeOcupacional.anexo = Aso;
    });
  }

  void salvarDoc(String doc, String nomeDoc) {
    setState(() {
      atestadoSaudeOcupacional.doc = doc;
      atestadoSaudeOcupacional.docNome = nomeDoc;
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
    if (!txtNomeMedico.valid || !txtCrmMedico.valid) return;

    cubit.save(atestadoSaudeOcupacional);
  }
}

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fornecedor/fornecedor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_frm/epi_descritor_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_models/main.dart';
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
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EpiDescritorPageFrm extends StatefulWidget {
  const EpiDescritorPageFrm({
    Key? key,
    required this.epiDescritor,
  }) : super(key: key);

  final EpiDescritorModel epiDescritor;

  @override
  State<EpiDescritorPageFrm> createState() =>
      _EpiDescritorPageFrmState(epiDescritor: epiDescritor);
}

class _EpiDescritorPageFrmState extends State<EpiDescritorPageFrm> {
  _EpiDescritorPageFrmState({required this.epiDescritor});
  late String titulo;
  EpiDescritorModel epiDescritor;
  late final EpiDescritorPageFrmCubit cubit = EpiDescritorPageFrmCubit(
    epiDescritorModel: epiDescritor,
    service: EpiDescritorService(),
  );
  late final TextFieldStringWidget txtDescricao = TextFieldStringWidget(
    placeholder: 'Descrição',
    onChanged: (String? str) {
      epiDescritor.descricao = txtDescricao.text;
    },
  );
  late final TextFieldStringWidget txtNumeroCA = TextFieldStringWidget(
    placeholder: 'Número do CA',
    onChanged: (String? str) {
      epiDescritor.numeroCA = txtNumeroCA.text;
    },
  );
  late final DatePickerWidget dtpPrazoValidade = DatePickerWidget(
    placeholder: 'Prazo Validade',
    onDateSelected: (value) => epiDescritor.prazoValidade = value,
    initialValue: epiDescritor.prazoValidade,
  );

  late FornecedorCubit fornecedorCubit;

  @override
  void initState() {
    fornecedorCubit = FornecedorCubit();
    fornecedorCubit.loadAll();
    txtDescricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      return '';
    });

    txtNumeroCA.addValidator((String str) {
      if (str.isEmpty) {
        return 'Obrigatório';
      } else if (str.length > 50) {
        return 'Pode ter no máximo 50 caracteres';
      }
      return '';
    });
    super.initState();
  }

  void setFields() {
    if (epiDescritor.descricao == null) {
      txtDescricao.text = '';
    } else {
      txtDescricao.text = epiDescritor.descricao.toString();
    }
    txtNumeroCA.text = epiDescritor.numeroCA.toString();
    titulo = 'Cadastro de Descritor de EPIs';
    if (epiDescritor.cod != 0) {
      titulo =
          'Edição de Descritor de EPI: ${epiDescritor.cod} -  ${epiDescritor.descricao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocListener<EpiDescritorPageFrmCubit, EpiDescritorPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
      child: BlocBuilder<EpiDescritorPageFrmCubit, EpiDescritorPageFrmState>(
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
                      child: txtDescricao,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: DropDownWidget<EpiDescritorTipoEpiOption>(
                        initialValue: EpiDescritorTipoEpiOption.tipoEpiOptions
                            .where(
                              (element) => element.cod == epiDescritor.tipoEpi,
                            )
                            .firstOrNull,
                        sourceList: EpiDescritorTipoEpiOption.tipoEpiOptions,
                        onChanged: (value) => epiDescritor.tipoEpi = value.cod,
                        placeholder: 'Tipo EPI',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: txtNumeroCA,
                    ),
                    BlocBuilder<FornecedorCubit, FornecedorState>(
                      bloc: fornecedorCubit,
                      builder: (context, fornecedorState) {
                        if (fornecedorState.loading) {
                          return const LoadingWidget();
                        }
                        List<FornecedorModel> fornecedores =
                            fornecedorState.fornecedores;
                        fornecedores.sort(
                          (a, b) => a.nome!.compareTo(b.nome!),
                        );
                        FornecedorModel? fornecedor = fornecedores
                            .where(
                              (element) =>
                                  element.cod == epiDescritor.codFornecedor,
                            )
                            .firstOrNull;
                        return DropDownSearchWidget<FornecedorModel>(
                          textFunction: (fornecedor) =>
                              fornecedor.GetDropDownText(),
                          initialValue: fornecedor,
                          sourceList: fornecedores.toList(),
                          onChanged: (value) {
                            epiDescritor.codFornecedor = value?.cod;
                            epiDescritor.fornecedor = value;
                          },
                          placeholder: 'Fornecedor',
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: dtpPrazoValidade,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: epiDescritor.conferenciaVisual,
                            onClick: (value) =>
                                epiDescritor.conferenciaVisual = value,
                            text: 'Conferência Visual',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          CustomCheckboxWidget(
                            checked: epiDescritor.ativo,
                            onClick: (value) => epiDescritor.ativo = value,
                            text: 'Ativo',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ImageDisplayWidget(
                        imageBase64: epiDescritor.imagem,
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
                                placeholder: 'Anexar Imagem',
                                imageSelected: (value1, value2) {
                                  salvarImage(value1);
                                },
                              ),
                              DeleteImageButtonWidget(
                                placeholder: 'Excluir Imagem',
                                onPressed: epiDescritor.imagem == null
                                    ? null
                                    : () => {excluirImagem()},
                              ),
                              OpenDocWidget(
                                placeholder: 'Abrir Imagem',
                                documentoString: epiDescritor.imagem,
                                documentName: 'arquivo sem nome.Webp',
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
              Row(
                children: [
                  CustomPopupMenuWidget(
                    items: [
                      if (epiDescritor.cod != null && epiDescritor.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          child: HistoricoPage(
                            pk: epiDescritor.cod!,
                            termo: 'EPI_DESCRITOR',
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
                            epiDescritor = EpiDescritorModel.empty();
                          }),
                        },
                      ),
                      CancelButtonUnfilledWidget(
                        onPressed: () =>
                            {Navigator.of(context).pop((false, ''))},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void salvarImage(String image) {
    setState(() {
      epiDescritor.imagem = image;
    });
  }

  void excluirImagem() {
    setState(() {
      epiDescritor.imagem = null;
    });
  }

  void salvar() {
    if (!txtDescricao.valid || !txtNumeroCA.valid) return;

    cubit.save(epiDescritor);
  }
}

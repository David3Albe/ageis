import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/fornecedor/fornecedor_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/epi_descritor_page_frm/epi_descritor_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_descritor/perfis/epi_descritor_page_perfis_frm.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/epi_descritor/epi_descritor_service.dart';
import 'package:ageiscme_data/services/epi_perfil/epi_perfil_service.dart';
import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_models/dto/epi_perfil/find_by_epi/epi_perfil_find_by_epi_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_epi/epi_perfil_find_by_epi_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EpiDescritorPageFrm extends StatefulWidget {
  const EpiDescritorPageFrm({
    Key? key,
    required this.epiDescritor,
    required this.onSaved,
    required this.onCancel,
  }) : super(key: key);

  final void Function(String) onSaved;
  final void Function() onCancel;

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
    placeholder: 'Descrição *',
    onChanged: (String? str) {
      epiDescritor.descricao = txtDescricao.text;
    },
  );
  late final TextFieldStringWidget txtNumeroCA = TextFieldStringWidget(
    placeholder: 'Número do CA *',
    onChanged: (String? str) {
      epiDescritor.numeroCA = txtNumeroCA.text;
    },
  );
  // late bool Function() prazoValidadeValidation;
  // late final DatePickerWidget dtpPrazoValidade = DatePickerWidget(
  //   validator: (date) => date == null ? 'Obrigatório' : null,
  //   placeholder: 'Prazo Validade *',
  //   onDateSelected: (value) => epiDescritor.prazoValidade = value,
  //   initialValue: epiDescritor.prazoValidade,
  //   validateBuilder: (context, validateMethodBuilder) =>
  //       prazoValidadeValidation = validateMethodBuilder,
  // );

  late FornecedorCubit fornecedorCubit;

  @override
  void initState() {
    fornecedorCubit = FornecedorCubit();
    fornecedorCubit.loadAll();
    txtDescricao.addValidator((String str) {
      if (str.length > 400) {
        return 'Pode ter no máximo 400 caracteres';
      }
      if (str.isEmpty) {
        return 'Obrigatório';
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

  late bool Function() tipoEpiValidation;
  final ScrollController scroll = ScrollController();
  late void Function(EpiDescritorTipoEpiOption?) setTipoEpi;

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EpiDescritorPageFrmCubit, EpiDescritorPageFrmState>(
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
                        controller: scroll,
                        padding: const EdgeInsets.only(right: 14),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: txtDescricao,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: DropDownSearchWidget<
                                  EpiDescritorTipoEpiOption>(
                                setSelectedItemBuilder:
                                    (context, setSelectedItemMethod) =>
                                        setTipoEpi = setSelectedItemMethod,
                                validator: (obj) =>
                                    obj == null ? 'Obrigatório' : null,
                                validateBuilder: (
                                  context,
                                  validateMethodBuilder,
                                ) =>
                                    tipoEpiValidation = validateMethodBuilder,
                                initialValue: EpiDescritorTipoEpiOption
                                    .tipoEpiOptions
                                    .where(
                                      (element) =>
                                          element.cod == epiDescritor.tipoEpi,
                                    )
                                    .firstOrNull,
                                sourceList:
                                    EpiDescritorTipoEpiOption.tipoEpiOptions,
                                onChanged: (value) =>
                                    epiDescritor.tipoEpi = value?.cod,
                                textFunction: (p0) => p0.GetDropDownText(),
                                placeholder: 'Tipo EPI *',
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
                                          element.cod ==
                                          epiDescritor.codFornecedor,
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
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 5.0),
                            //   child: dtpPrazoValidade,
                            // ),
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
                                    onClick: (value) =>
                                        epiDescritor.ativo = value,
                                    text: 'Ativo',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: LabelStringWidget(
                                text: epiDescritor.imagem != null
                                    ? 'Imagem anexada'
                                    : '',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ImageDisplayWidget(
                                imageBase64: epiDescritor.imagem,
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
                    CustomPopupItemImageModel.getImageItem(
                      'Anexar Imagem',
                      salvarImagem,
                    ),
                    CustomPopupItemOpenDocModel.getOpenDocItem(
                      'Abrir Imagem',
                      context,
                      epiDescritor.imagem,
                      'arquivo sem nome.Webp',
                    ),
                    CustomPopupItemModel(
                      text: 'Perfis',
                      onTap: () => openPerfis(context),
                    ),
                    CustomPopupItemModel(
                      text: 'Excluir Imagem',
                      onTap: excluirImagem,
                    ),
                    if (epiDescritor.cod != null && epiDescritor.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Descritor de Epi ${epiDescritor.cod}',
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
                  spacing: 6 * paddingHorizontalScale,
                  runSpacing: 6 * paddingHorizontalScale,
                  alignment: WrapAlignment.end,
                  children: [
                    UpdateButtonWidget(
                      readonly: epiDescritor.cod == 0 || epiDescritor.cod == null,
                      onPressed: () => {alterarExistente()},
                    ),
                    InsertButtonWidget(
                      onPressed: () => {inserirNovo()},
                    ),
                    CleanButtonWidget(
                      onPressed: () {
                        setState(() {
                          epiDescritor = EpiDescritorModel.empty();
                        });
                        setTipoEpi(null);
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

  Future openPerfis(BuildContext context) async {
    if (epiDescritor.cod == 0 || epiDescritor.cod == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Não é possível vincular os perfis do EPI sem salvar o EPI',
      );
      return;
    }
    LoadingController loading = LoadingController(context: context);
    List<PerfilAcessoModel> perfisAcesso = await PerfilAcessoService().GetAll();
    (String, EpiPerfilFindByEpiResponseDTO)? result = await EpiPerfilService()
        .findByEpi(EpiPerfilFindByEpiDTO(codEpiDescritor: epiDescritor.cod!));
    loading.close(context, mounted);
    if (result == null) return;

    late int chave;
    int cod = epiDescritor.cod ?? 0;
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: cod.toString(),
      title:
          'Cadastro/Edição Perfis do EPI - ${epiDescritor.descricao ?? 'Sem Descrição'}',
      widget: EpiDescritorPagePerfisFrm(
        onClose: () {
          WindowsHelper.RemoverWidget(chave);
        },
        codDescritor: epiDescritor.cod!,
        perfisAcesso: perfisAcesso,
        perfisVinculados: result.$2.perfis,
      ),
    );
  }

  void salvarImagem(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      epiDescritor.imagem = imageNew.base64;
    });
  }

  void excluirImagem() {
    setState(() {
      epiDescritor.imagem = null;
    });
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    bool descricaoValid = txtDescricao.valid;
    bool numeroCAValid = txtNumeroCA.valid;
    bool tipoEpiValid = tipoEpiValidation();
    // bool prazoValidadeValid = prazoValidadeValidation();

    if (!descricaoValid) {
      scroll.jumpTo(0);
    } else if (!tipoEpiValid) {
      scroll.jumpTo(50);
    } else if (!numeroCAValid) {
      scroll.jumpTo(100);
    }
    // else if (!prazoValidadeValid) {
    //   scroll.jumpTo(200);
    // }
    if (!descricaoValid || !numeroCAValid || !tipoEpiValid) return;

    cubit.save(
      novo ? epiDescritor.copyWith(cod: 0, tstamp: null) : epiDescritor,
      widget.onSaved,
    );
  }
}

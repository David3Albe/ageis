import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/tipo_afastamento/tipo_afastamento_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/afastamento_page_frm/afastamento_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/afastamento/afastamento_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/afastamento/afastamento_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_image_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_open_doc_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/images/image_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/image_helper/image_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class AfastamentoPageFrm extends StatefulWidget {
  const AfastamentoPageFrm({
    Key? key,
    required this.afastamento,
    required this.onCancel,
    required this.onSaved,
  }) : super(key: key);

  final AfastamentoModel afastamento;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<AfastamentoPageFrm> createState() => _AfastamentoPageFrmState(
        afastamento: afastamento,
      );
}

class _AfastamentoPageFrmState extends State<AfastamentoPageFrm> {
  _AfastamentoPageFrmState({required this.afastamento});
  late String titulo;
  AfastamentoModel afastamento;
  late final AfastamentoPageFrmCubit cubit = AfastamentoPageFrmCubit(
    afastamento: afastamento,
    service: AfastamentoService(),
  );
  late bool Function() dataInicioValidate;
  late final DatePickerWidget dtpDataInicio = DatePickerWidget(
    validator: (date) => date == null ? 'Obrigatório' : null,
    validateBuilder: (context, validateMethodBuilder) =>
        dataInicioValidate = validateMethodBuilder,
    placeholder: 'Data Início *',
    onDateSelected: (value) => afastamento.dataInicio = value,
    initialValue: afastamento.dataInicio,
  );

  late final TextFieldNumberWidget txtDiasAfastamento = TextFieldNumberWidget(
    placeholder: 'Dias de Afastamento',
    onChanged: (String? str) {
      afastamento.diasAfastamento =
          str == null || str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldNumberWidget txtHorasAfastamento = TextFieldNumberWidget(
    placeholder: 'Horas de Afastamento',
    onChanged: (String? str) {
      afastamento.horasAfastamento =
          str == null || str.isEmpty ? null : int.parse(str);
    },
  );

  late final TextFieldStringWidget txtNumeroCat = TextFieldStringWidget(
    placeholder: 'Número da CAT',
    onChanged: (String? str) {
      afastamento.numeroCat = str;
    },
  );

  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável',
    readOnly: true,
  );

  late final DatePickerWidget dtpDataHora = DatePickerWidget(
    readOnly: true,
    initialValue: afastamento.dataRegistro,
    formato: DateFormat('dd/MM/yyyy HH:mm'),
    placeholder: 'Data e Hora',
  );

  late TipoAfastamentoCubit tipoAfastamentoCubit;

  @override
  void initState() {
    tipoAfastamentoCubit = TipoAfastamentoCubit();
    tipoAfastamentoCubit.loadAll();
    setFields(true);
    super.initState();
  }

  void setFields(bool isInit) {
    txtResponsavel.text = afastamento.usuarioRegistro?.nome ?? '';
    dtpDataHora.setValue(afastamento.dataRegistro);
    dtpDataInicio.setValue(afastamento.dataInicio);
    txtNumeroCat.text = afastamento.numeroCat ?? '';
    txtDiasAfastamento.text = afastamento.diasAfastamento?.toString() ?? '';
    txtHorasAfastamento.text = afastamento.horasAfastamento?.toString() ?? '';
    if (!isInit) {
      setarCat(
        TipoCatOption.cats
            .where((e) => e.cod == afastamento.tipoCat)
            .firstOrNull,
      );
      setarColaborador(afastamento.usuario);
      setarTipoDoAfastamento(afastamento.tipoAfastamento);
    }

    titulo = 'Registro de Afastamento';
    if (afastamento.cod != 0) {
      titulo = 'Edição de Afastamento: ${afastamento.cod}';
    }
  }

  final ScrollController scroll = ScrollController();

  late bool Function() usuarioValidate;
  late bool Function() tipoAfastamentoValidate;
  late void Function(TipoCatOption?) setarCat;
  late void Function(UsuarioDropDownSearchResponseDTO?) setarColaborador;
  late void Function(TipoAfastamentoModel?) setarTipoDoAfastamento;

  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AfastamentoPageFrmCubit, AfastamentoPageFrmState>(
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
                              child: DropDownSearchApiWidget<
                                  UsuarioDropDownSearchResponseDTO>(
                                setSelectedItemBuilder: (
                                  context,
                                  setSelectedItemMethod,
                                ) =>
                                    setarColaborador = setSelectedItemMethod,
                                validateBuilder:
                                    (context, validateMethodBuilder) =>
                                        usuarioValidate = validateMethodBuilder,
                                validator: (val) =>
                                    val == null ? 'Obrigatório' : null,
                                textFunction: (usuario) => usuario.NomeText(),
                                initialValue: afastamento.usuario,
                                search: (str) async =>
                                    (await UsuarioService().getDropDownSearch(
                                      UsuarioDropDownSearchDTO(
                                        numeroRegistros: 30,
                                        search: str,
                                        apenasAtivos: true,
                                      ),
                                    ))
                                        ?.$2 ??
                                    [],
                                onChanged: (value) {
                                  afastamento.usuario = value;
                                  afastamento.codUsuario = value?.cod;
                                },
                                placeholder: 'Colaborador *',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: BlocBuilder<TipoAfastamentoCubit,
                                        TipoAfastamentoState>(
                                      bloc: tipoAfastamentoCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<TipoAfastamentoModel>
                                            tiposAfastamento =
                                            state.tiposAfastamento;
                                        tiposAfastamento.sort(
                                          (a, b) => (a.motivo ?? '')
                                              .compareTo(b.motivo ?? ''),
                                        );
                                        afastamento.tipoAfastamento =
                                            tiposAfastamento
                                                .where(
                                                  (e) =>
                                                      e.cod ==
                                                      afastamento
                                                          .codTipoAfastamento,
                                                )
                                                .firstOrNull;
                                        return DropDownSearchWidget<
                                            TipoAfastamentoModel>(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setarTipoDoAfastamento =
                                                  setSelectedItemMethod,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          validator: (val) => val == null
                                              ? 'Obrigatório'
                                              : null,
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              tipoAfastamentoValidate =
                                                  validateMethodBuilder,
                                          initialValue:
                                              afastamento.tipoAfastamento,
                                          sourceList: tiposAfastamento,
                                          onChanged: (value) {
                                            afastamento.codTipoAfastamento =
                                                value?.cod;
                                            afastamento.tipoAfastamento = value;
                                          },
                                          placeholder: 'Tipo do Afastamento *',
                                        );
                                      },
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
                                    child: dtpDataInicio,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtDiasAfastamento,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 24),
                                  ),
                                  Expanded(
                                    child: txtHorasAfastamento,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                'CAT - Comunicação de Acidente de Trabalho',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: txtNumeroCat),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropDownSearchWidget<TipoCatOption>(
                                      setSelectedItemBuilder:
                                          (context, setSelectedItemMethod) =>
                                              setarCat = setSelectedItemMethod,
                                      initialValue: TipoCatOption.cats
                                          .where(
                                            (element) =>
                                                element.cod ==
                                                afastamento.tipoCat,
                                          )
                                          .firstOrNull,
                                      sourceList: TipoCatOption.cats,
                                      textFunction: (p0) =>
                                          p0.GetDropDownText(),
                                      onChanged: (value) => afastamento
                                          .tipoCat = value?.cod.toString(),
                                      placeholder: 'Tipo da Cat',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  CustomCheckboxWidget(
                                    checked: afastamento.catSemAfastamento,
                                    onClick: (value) =>
                                        afastamento.catSemAfastamento = value,
                                    text: 'Registrar CAT Sem Afastamento',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: LabelStringWidget(
                                text: afastamento.catAnexa != null
                                    ? 'CAT anexada'
                                    : 'CAT não anexada',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                height: 250,
                                child: ImageDisplayWidget(
                                  imageBase64: afastamento.catAnexa,
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            txtResponsavel,
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: dtpDataHora,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30)),
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
                      'Anexar CAT',
                      salvarCAT,
                    ),
                    if (afastamento.catAnexa != null)
                      CustomPopupItemModel(
                        text: 'Desanexar CAT',
                        onTap: excluirCat,
                      ),
                    if (afastamento.catAnexa != null)
                      CustomPopupItemOpenDocModel.getOpenDocItem(
                        'Abrir CAT',
                        context,
                        afastamento.catAnexa,
                        'CAT ${afastamento.usuario?.nome}.png',
                      ),
                    if (afastamento.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        child: HistoricoPage(
                          pk: afastamento.cod,
                          termo: 'AFASTAMENTO',
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

  void salvarCAT(Future<ImageObjectModel?> Function() onSelectImage) async {
    ImageObjectModel? imageNew = await onSelectImage();
    if (imageNew == null) return;
    setState(() {
      afastamento.catAnexa = imageNew.base64;
    });
  }

  Future limpar() async {
    setState(() {
      afastamento = AfastamentoModel.empty();
    });

    final AuthenticationResultDTO? authentication =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    afastamento.usuarioRegistro = UsuarioDropDownSearchResponseDTO(
      ativo: authentication?.usuario?.ativo ?? false,
      cod: authentication?.usuario?.cod ?? 0,
      codBarra: authentication?.usuario?.codBarra ?? 0,
      nome: authentication?.usuario?.nome ?? '',
    );
    afastamento.codUsuarioRegistro = authentication?.usuario?.cod ?? 0;
    afastamento.dataRegistro = DateTime.now();
    setFields(false);
  }

  void excluirCat() {
    setState(() {
      afastamento.catAnexa = null;
    });
  }

  void salvar() {
    bool usuarioValid = usuarioValidate();
    bool dataInicioValid = dataInicioValidate();
    bool tipoAfastamentoValid = tipoAfastamentoValidate();

    if (!usuarioValid) {
      scroll.jumpTo(0);
    } else if (!tipoAfastamentoValid) {
      scroll.jumpTo(50);
    } else if (!dataInicioValid) {
      scroll.jumpTo(100);
    }

    if (!usuarioValid || !dataInicioValid || !tipoAfastamentoValid) return;

    if (afastamento.tipoAfastamento?.cat == true) {
      if (afastamento.catAnexa == null) {
        ToastUtils.showCustomToastWarning(
          context,
          'O Tipo de afastamento obriga que os campos de CAT sejam preenchidos, anexo da CAT não informada',
        );
        return;
      }
      if (afastamento.numeroCat == null) {
        ToastUtils.showCustomToastWarning(
          context,
          'O Tipo de afastamento obriga que os campos de CAT sejam preenchidos, número da CAT não informada',
        );
        return;
      }
      if (afastamento.tipoCat == null) {
        ToastUtils.showCustomToastWarning(
          context,
          'O Tipo de afastamento obriga que os campos de CAT sejam preenchidos, tipo da CAT não informada',
        );
        return;
      }
    }

    cubit.save(afastamento, widget.onSaved);
  }
}

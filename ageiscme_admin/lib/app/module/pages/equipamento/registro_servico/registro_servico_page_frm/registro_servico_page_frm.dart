import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/equipamento/equipamento_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/servico_tipo/servico_tipo_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/cubits/readonly_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_service_page_frm_controller.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/registro_servico_page_frm/registro_servico_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/monitoring_print/monitoring_print_dto.dart';
import 'package:ageiscme_impressoes/prints/monitoring_printer/monitoring_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/label_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_save_file_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/functions/file_helper/file_object_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class RegistroServicoPageFrm extends StatefulWidget {
  const RegistroServicoPageFrm({
    Key? key,
    required this.registroServico,
    required this.equipamentoCubit,
    required this.itemFilter,
    required this.onSaved,
    required this.onCancel,
    this.equipamentoReadOnly,
    this.itemReadOnly,
  }) : super(key: key);

  final RegistroServicoModel registroServico;
  final EquipamentoCubit equipamentoCubit;
  final ItemFilter itemFilter;
  final bool? equipamentoReadOnly;
  final bool? itemReadOnly;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<RegistroServicoPageFrm> createState() =>
      _RegistroServicoPageFrmState(registroServico: registroServico);
}

class _RegistroServicoPageFrmState extends State<RegistroServicoPageFrm> {
  _RegistroServicoPageFrmState({required this.registroServico});
  RegistroServicoModel registroServico;

  late ReadonlyCubit readonlyCubit;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  late final RegistroServicePageFrmController controller;
  late bool Function() validateTipoServico;
  late bool Function() validateResultado;
  late void Function(EquipamentoModel?) setEquipamento;
  late void Function(ItemModel?) setItem;
  late void Function(ServicoTipoModel?) setServicoTipo;
  late void Function(DateTime?) setDataInicio;
  late void Function(DateTime?) setDataTermino;
  late void Function(UsuarioDropDownSearchResponseDTO?) setUsuarioResponsavel;
  late void Function(bool) setControlarValidade;
  late void Function(RegistroServicoResultOption?) setResultado;

  void initState() {
    readonlyCubit = ReadonlyCubit();
    readonlyCubit.setarReadonly();
    controller = RegistroServicePageFrmController(
      registroServico: registroServico,
    );
    controller.initialize();

    if (registroServico.cod == 0) {
      recuperaUsuario().then((value) {
        if (value == null ||
            value.usuario == null ||
            value.usuario!.cod == null) {
          return;
        }
        controller.txtUsuarioRegistro.text = value.usuario!.nome ?? '';
        registroServico.usuarioRegistro = value.usuario!.cod.toString();
        registroServico.codUsuario = value.usuario!.cod;
      });
    }

    super.initState();
  }

  late void Function() refreshServicosTipoMethod;
  final ScrollController scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    double paddingHorizontalScale = MediaQuery.of(context).size.width / 1920;
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: readonlyCubit),
      ],
      child:
          BlocBuilder<RegistroServicoPageFrmCubit, RegistroServicoPageFrmState>(
        bloc: controller.cubit,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TitleWidget(
                      text: controller.titulo,
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: BlocBuilder<EquipamentoCubit,
                                          EquipamentoState>(
                                        bloc: widget.equipamentoCubit,
                                        builder: (context, equipamentoState) {
                                          if (equipamentoState.loading) {
                                            return const Center(
                                              child: LoadingWidget(),
                                            );
                                          }
                                          List<EquipamentoModel> equipamentos =
                                              equipamentoState.objs;
                                          equipamentos.sort(
                                            (a, b) =>
                                                a.nome!.compareTo(b.nome!),
                                          );
                                          registroServico.equipamento =
                                              equipamentos
                                                  .where(
                                                    (element) =>
                                                        element.cod ==
                                                        registroServico
                                                            .codEquipamento,
                                                  )
                                                  .firstOrNull;
                                          return DropDownSearchWidget(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setEquipamento =
                                                    setSelectedItemMethod,
                                            readOnly: widget
                                                        .equipamentoReadOnly ==
                                                    true ||
                                                (registroServico.cod != null &&
                                                    registroServico.cod != 0),
                                            textFunction: (equipamento) =>
                                                equipamento
                                                    .EquipamentoNomeText(),
                                            initialValue:
                                                registroServico.equipamento,
                                            sourceList: equipamentos
                                                .where(
                                                  (element) =>
                                                      element.ativo == true,
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              registroServico.codEquipamento =
                                                  value?.cod!;
                                              registroServico.equipamento =
                                                  value;
                                              controller.servicoTipoCubit
                                                  .reload();
                                              refreshServicosTipoMethod.call();
                                            },
                                            placeholder: 'Equipamento',
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: controller.txtLote,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DropDownSearchApiWidget(
                                        setSelectedItemBuilder:
                                            (context, setSelectedItemMethod) =>
                                                setItem = setSelectedItemMethod,
                                        readOnly: widget.itemReadOnly == true ||
                                            (registroServico.cod != null &&
                                                registroServico.cod != 0),
                                        textFunction: (item) =>
                                            item.EtiquetaDescricaoText(),
                                        initialValue: registroServico.item,
                                        search: (str) => ItemService().Filter(
                                          widget.itemFilter.copyWith(
                                            termoPesquisa: str,
                                            numeroRegistros: 30,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          registroServico.codItem = value?.cod;
                                          registroServico.item = value;
                                        },
                                        placeholder: 'Item',
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: BlocBuilder<ServicoTipoCubit,
                                          ServicoTipoState>(
                                        bloc: controller.servicoTipoCubit,
                                        builder: (context, state) {
                                          if (state.loading == true) {
                                            return const Center(
                                              child: LoadingWidget(),
                                            );
                                          }

                                          List<ServicoTipoModel> servicosTipos =
                                              state.tiposServico;
                                          registroServico.servicoTipo =
                                              servicosTipos
                                                  .where(
                                                    (element) =>
                                                        element.cod ==
                                                        registroServico
                                                            .codServicosTipos,
                                                  )
                                                  .firstOrNull;
                                          servicosTipos.sort(
                                            (a, b) =>
                                                a.nome!.compareTo(b.nome!),
                                          );
                                          List<ServicoTipoModel> servicos =
                                              controller
                                                  .buscarServicosEquipamento(
                                            servicosTipos,
                                          );
                                          if (state.reloaded == true) {
                                            if (servicos.isNotEmpty &&
                                                !servicos
                                                    .map((e) => e.cod)
                                                    .contains(
                                                      registroServico
                                                          .codServicosTipos,
                                                    )) {
                                              registroServico.servicoTipo =
                                                  null;
                                              registroServico.codServicosTipos =
                                                  null;
                                            }
                                          }

                                          return DropDownSearchWidget<
                                              ServicoTipoModel>(
                                            setSelectedItemBuilder: (
                                              context,
                                              setSelectedItemMethod,
                                            ) =>
                                                setServicoTipo =
                                                    setSelectedItemMethod,
                                            validateBuilder: (
                                              context,
                                              validateMethodBuilder,
                                            ) =>
                                                validateTipoServico =
                                                    validateMethodBuilder,
                                            validator: (val) => val == null
                                                ? 'Obrigatório'
                                                : null,
                                            refreshSourceListBuilder: (
                                              context,
                                              refreshTipoServicoSourceList,
                                            ) =>
                                                refreshServicosTipoMethod =
                                                    refreshTipoServicoSourceList,
                                            initialValue:
                                                registroServico.servicoTipo,
                                            sourceList: servicos
                                                .where(
                                                  (element) =>
                                                      element.ativo == true &&
                                                      element.monitoramento ==
                                                          true,
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              registroServico.servicoTipo =
                                                  value;
                                              registroServico.codServicosTipos =
                                                  value?.cod;
                                              widget.equipamentoCubit.refresh();
                                            },
                                            placeholder: 'Tipo do Serviço *',
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
                                      child: controller.dtpDataInicio,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: controller.tmpHoraInicio,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: controller.dtpDataTermino,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: controller.tmpHoraTermino,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: controller.txtDescricaoServico,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Condições',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: controller.txtTemperatura,
                                            ),
                                            const SizedBox(width: 50.0),
                                            Expanded(
                                              child:
                                                  controller.txtTemperaturaMax,
                                            ),
                                            const SizedBox(width: 50.0),
                                            Expanded(
                                              child:
                                                  controller.txtTemperaturaMin,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: controller.txtUmidade,
                                              ),
                                              const SizedBox(width: 50.0),
                                              Expanded(
                                                child: controller.txtUmidadeMax,
                                              ),
                                              const SizedBox(width: 50.0),
                                              Expanded(
                                                child: controller.txtUmidadeMin,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DropDownSearchApiWidget<
                                          UsuarioDropDownSearchResponseDTO>(
                                        setSelectedItemBuilder:
                                            (context, setSelectedItemMethod) =>
                                                setUsuarioResponsavel =
                                                    setSelectedItemMethod,
                                        search: (str) async =>
                                            (await UsuarioService()
                                                    .getDropDownSearch(
                                              UsuarioDropDownSearchDTO(
                                                numeroRegistros: 30,
                                                search: str,
                                                apenasAtivos: true,
                                                apenasColaboradores: true,
                                              ),
                                            ))
                                                ?.$2 ??
                                            [],
                                        textFunction: (usuario) =>
                                            usuario.NomeText(),
                                        initialValue:
                                            registroServico.usuarioDropDown,
                                        onChanged: (value) {
                                          registroServico.usuarioDropDown =
                                              value;
                                          registroServico.tecnico =
                                              value?.cod.toString();
                                        },
                                        placeholder: 'Responsável',
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: DropDownSearchWidget<
                                          RegistroServicoResultOption>(
                                        setSelectedItemBuilder:
                                            (context, setSelectedItemMethod) =>
                                                setResultado =
                                                    setSelectedItemMethod,
                                        validator: (obj) =>
                                            obj == null ? 'Obrigatório' : null,
                                        validateBuilder:
                                            (context, validateMethodBuilder) =>
                                                validateResultado =
                                                    validateMethodBuilder,
                                        initialValue:
                                            RegistroServicoResultOption
                                                .resultOptions
                                                .where(
                                                  (element) =>
                                                      element.cod ==
                                                      registroServico.resultado,
                                                )
                                                .firstOrNull,
                                        sourceList: RegistroServicoResultOption
                                            .resultOptions,
                                        textFunction: (p0) =>
                                            p0.GetDropDownText(),
                                        onChanged: (value) => registroServico
                                            .resultado = value?.cod.toString(),
                                        placeholder: 'Resultado *',
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
                                      child: controller.dtpDataValidade,
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CustomCheckboxWidget(
                                            setValue:
                                                (context, setValueWidget) =>
                                                    setControlarValidade =
                                                        setValueWidget,
                                            checked: registroServico
                                                .controlarValidade,
                                            onClick: (value) => registroServico
                                                .controlarValidade = value,
                                            text: 'Controlar Validade',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: controller.txtUsuarioRegistro,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: controller.dtpDataRegistro,
                                    ),
                                  ],
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
                      CustomPopupItemFileModel.getFileItem(
                        'Anexar DOC',
                        salvarDoc,
                      ),
                      if (registroServico.docAnexa != null &&
                          registroServico.docAnexaNome != null)
                        CustomPopupItemModel(
                          text: 'Excluir DOC',
                          onTap: excluirDoc,
                        ),
                      if (registroServico.docAnexa != null &&
                          registroServico.docAnexaNome != null)
                        CustomPopupItemSaveFileModel.getOpenDocItem(
                          text: 'Abrir DOC',
                          context: context,
                          docName: registroServico.docAnexaNome,
                          docString: registroServico.docAnexa,
                        ),
                      if (registroServico.cod != null &&
                          registroServico.cod != 0)
                        CustomPopupItemHistoryModel.getHistoryItem(
                          title: 'Monitoramento ${registroServico.cod}',
                          child: HistoricoPage(
                            pk: registroServico.cod!,
                            termo: 'REGISTRO_SERVICO',
                          ),
                          context: context,
                        ),
                      CustomPopupItemModel(
                        text: 'Imprimir Etiqueta',
                        onTap: printTag,
                      ),
                    ],
                  ),
                  LabelStringWidget(
                    text:
                        '${registroServico.docAnexaNome == null ? '' : 'Documento: ' + registroServico.docAnexaNome.toString()}',
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 16 * paddingHorizontalScale,
                    runSpacing: 16 * paddingHorizontalScale,
                    alignment: WrapAlignment.end,
                    children: [
                      SaveButtonWidget(
                        readonly: context.select(
                          (ReadonlyCubit readonlyCubit) =>
                              readonlyCubit.state.botaoSalvarReadonly,
                        ),
                        onPressed: () {
                          salvar();
                        },
                      ),
                      CleanButtonWidget(
                        onPressed: limparCampos,
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
      ),
    );
  }

  Future limparCampos() async {
    final AuthenticationResultDTO? authentication =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    if (authentication?.usuario == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Usuário atual não identificado, entre novamente no sistema',
      );
      return;
    }
    setState(() {
      registroServico.cod = 0;
      registroServico.codEquipamento = null;
      registroServico.equipamento = null;
      setEquipamento(null);
      registroServico.item = null;
      registroServico.codItem = null;
      setItem(null);
      registroServico.lote = null;
      registroServico.codServicosTipos = null;
      registroServico.servicoTipo = null;
      setServicoTipo(null);
      registroServico.dataInicio = DateTime.now();
      registroServico.dataEnvio = null;
      registroServico.dataTermino = null;
      registroServico.dataValidade = null;
      registroServico.descricao = null;
      registroServico.temperatura = null;
      registroServico.temperaturaMax = null;
      registroServico.temperaturaMin = null;
      registroServico.umidade = null;
      registroServico.umidadeMin = null;
      registroServico.umidadeMax = null;
      registroServico.usuarioDropDown = null;
      registroServico.codUsuarioLiberado = null;
      registroServico.controlarValidade = false;
      setControlarValidade(false);
      registroServico.docAnexa = null;
      registroServico.docAnexaNome = null;
      registroServico.imagemDocAnexo = null;
      registroServico.tecnico = null;
      setUsuarioResponsavel(null);
      registroServico.usuarioRegistro = authentication!.usuario!.nome;
      registroServico.codUsuario = authentication.usuario!.cod;
      registroServico.usuario = authentication.usuario;
      registroServico.dataRegistro = DateTime.now();
      RegistroServicoResultOption liberado =
          RegistroServicoResultOption.getLiberado();
      setResultado(liberado);
      registroServico.resultado = liberado.cod.toString();
      controller.setFields(true);
    });
  }

  Future printTag() async {
    if (registroServico.cod == null || registroServico.cod == 0) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário ter o Monitoramento cadastrado para fazer a impressão da etiqueta.',
      );
      return;
    }
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();

    MonitoringPrintDTO monitoringPrintDTO = MonitoringPrintDTO(
      cod: registroServico.cod!,
      companyCod: registroServico.codInstituicao!,
      companyName: auth!.instituicao!.nome!,
      dataAtual: DateTime.now(),
      serviceTypeName: registroServico.servicoTipo!.nome!,
      userName: auth.usuario!.nome!,
      equipamentCod: registroServico.codEquipamento?.toString(),
      equipamentName: registroServico.equipamento?.nome,
      itemCod: registroServico.codItem?.toString(),
      itemName: registroServico.item?.descricao,
      userDocClasse: auth.usuario!.docClasse,
    );
    MonitoringPrinterController controller =
        MonitoringPrinterController(context: context, dto: monitoringPrintDTO);
    await controller.print();
  }

  void salvarDoc(Future<FileObjectModel?> Function() onSelectFile) async {
    FileObjectModel? fileNew = await onSelectFile();
    if (fileNew == null) return;
    setState(() {
      registroServico.docAnexa = fileNew.base64;
      registroServico.docAnexaNome = fileNew.fileName;
    });
  }

  void excluirDoc() {
    setState(() {
      registroServico.docAnexa = null;
      registroServico.docAnexaNome = null;
    });
  }

  void salvar() {
    bool descricaoValid = controller.txtDescricaoServico.valid;
    bool loteValid = controller.txtLote.valid;
    bool usuarioRegistroValid = controller.txtUsuarioRegistro.valid;
    bool tipoServicoValid = validateTipoServico();
    bool resultadoValid = validateResultado();
    if (!tipoServicoValid) {
      scroll.jumpTo(0);
    } else if (!descricaoValid) {
      scroll.jumpTo(200.0);
    } else if (!resultadoValid) {
      scroll.jumpTo(300.0);
    }
    if (!descricaoValid ||
        !loteValid ||
        !usuarioRegistroValid ||
        !tipoServicoValid ||
        !resultadoValid) {
      return;
    }

    if (registroServico.dataTermino != null &&
        registroServico.dataInicio != null) {
      if (registroServico.dataInicio!.isAfter(registroServico.dataTermino!)) {
        ToastUtils.showCustomToastWarning(
          context,
          'Data Término não pode ser antes da Data Inicial',
        );
        return;
      }
    }

    if (registroServico.codItem == null &&
        registroServico.codEquipamento == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Deve ser informado um Equipamento ou Item',
      );
      return;
    }

    if (registroServico.codItem != null &&
        registroServico.codEquipamento != null) {
      ToastUtils.showCustomToastWarning(
        context,
        'Item ou Equipamento, apenas um pode ser informado',
      );
      return;
    }
    controller.cubit.save(registroServico, widget.onSaved);
  }
}

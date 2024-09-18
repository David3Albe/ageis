import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/epi_entrega/epi_entrega_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_frm/epi_entrega_page_frm_state.dart';
import 'package:ageiscme_admin/app/module/pages/historico/historico_page.dart';
import 'package:ageiscme_data/services/epi_entrega/epi_entrega_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/epi_delivery/epi/epi_delivery_epi_print_dto.dart';
import 'package:ageiscme_impressoes/dto/epi_delivery/epi_delivery_print_dto.dart';
import 'package:ageiscme_impressoes/prints/epi_delivery/epi_delivery_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/epi_perfil/find_by_user/epis/epi_perfil_find_by_user_epi_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/insert_button_widget.dart';
import 'package:compartilhados/componentes/botoes/update_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/componentes/toasts/warning_dialog.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class EpiEntregaPageFrm extends StatefulWidget {
  const EpiEntregaPageFrm({
    Key? key,
    required this.epiEntrega,
    required this.usuarios,
    required this.episDescritores,
    required this.onSaved,
    required this.onCancel,
    required this.episNecessarios,
  }) : super(key: key);

  final EpiEntregaModel epiEntrega;
  final List<UsuarioModel> usuarios;
  final List<EpiDescritorModel> episDescritores;
  final List<EpiPerfilFindByUserEpiResponseDTO> episNecessarios;
  final void Function(String) onSaved;
  final void Function() onCancel;

  @override
  State<EpiEntregaPageFrm> createState() =>
      _EpiEntregaPageFrmState(epiEntrega: epiEntrega);
}

class _EpiEntregaPageFrmState extends State<EpiEntregaPageFrm> {
  _EpiEntregaPageFrmState({required this.epiEntrega});

  late String titulo;
  EpiEntregaModel epiEntrega;
  late final EpiEntregaCubit epiEntregaCubit;
  void Function(DateTime?)? setarDataValidade;
  void Function(DateTime?)? setarDataDescarte;
  void Function(DateTime?)? setarDataEntrega;
  void Function(bool)? setarConferenciaVisual;
  void Function(bool)? setarControlaValidade;

  late final EpiEntregaPageFrmCubit cubit = EpiEntregaPageFrmCubit(
    epiEntregaModel: epiEntrega,
    service: EpiEntregaService(),
  );

  late bool Function() limiteValidadeValidate;
  late final DatePickerWidget dtpLimiteValidade = DatePickerWidget(
    placeholder: 'Data Limite da Validade *',
    validator: (date) => date == null ? 'Obrigatório' : null,
    validateBuilder: (context, validateMethodBuilder) =>
        limiteValidadeValidate = validateMethodBuilder,
    onDateSelected: (selectedDate) =>
        epiEntrega.dataLimiteValidade = selectedDate,
    setDateValueBuilder: (context, setDateMethod) =>
        setarDataValidade = setDateMethod,
    initialValue: epiEntrega.dataLimiteValidade,
  );

  late final DatePickerWidget dtpDataDescarte = DatePickerWidget(
    placeholder: 'Data do Descarte',
    onDateSelected: (selectedDate) => epiEntrega.dataDescarte = selectedDate,
    initialValue: epiEntrega.dataDescarte,
    setDateValueBuilder: (context, setDateMethod) =>
        setarDataDescarte = setDateMethod,
  );

  late final TextFieldStringWidget txtResponsavel = TextFieldStringWidget(
    placeholder: 'Responsável',
    readOnly: true,
  );

  late final DatePickerWidget dtpDataEntrega = DatePickerWidget(
    placeholder: 'Data Entrega',
    readOnly: true,
    initialValue: epiEntrega.dataEntrega,
    setDateValueBuilder: (context, setDateMethod) =>
        setarDataEntrega = setDateMethod,
  );

  late void Function(EpiEntregaModel? epi) setSelectedEpiEntregueValidade;
  late void Function(EpiEntregaModel? epi) setSelectedEpiEntregueDescartado;
  late void Function(EpiDescritorModel? epi) setSelectedEpiDescritor;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    epiEntregaCubit = EpiEntregaCubit();
    epiEntregaCubit.loadAll();

    recuperaUsuario().then((value) {
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      txtResponsavel.text = value.usuario!.nome ?? '';
      epiEntrega.codUsuarioEntrega = value.usuario!.cod;
    });

    super.initState();
  }

  void setFields() {
    if (epiEntrega.codUsuarioEntrega == 0) {
      txtResponsavel.text = '';
    }

    titulo = 'Registro de Entrega de EPIs';
    if (epiEntrega.cod != 0) {
      titulo = 'Edição do Registro de Entrega de EPI: ${epiEntrega.cod}';
    }
  }

  void updateFields(EpiEntregaModel? selectedEpiEntrega) {
    setState(() {
      epiEntrega.cod = selectedEpiEntrega?.cod ?? 0;
      epiEntrega.tstamp = selectedEpiEntrega?.tstamp;
      epiEntrega.codDescritorEpi = selectedEpiEntrega?.codDescritorEpi;
      epiEntrega.dataLimiteValidade = selectedEpiEntrega?.dataLimiteValidade;
      setarDataValidade?.call(epiEntrega.dataLimiteValidade);
      epiEntrega.dataDescarte = selectedEpiEntrega?.dataDescarte;
      setarDataDescarte?.call(epiEntrega.dataDescarte);
      epiEntrega.dataEntrega = selectedEpiEntrega?.dataEntrega;
      setarDataEntrega?.call(epiEntrega.dataEntrega);
      epiEntrega.conferenciaVisual =
          selectedEpiEntrega?.conferenciaVisual ?? false;
      setarConferenciaVisual?.call(epiEntrega.conferenciaVisual ?? false);
      epiEntrega.controlarValidade =
          selectedEpiEntrega?.controlarValidade ?? false;
      setarControlaValidade?.call(epiEntrega.controlarValidade ?? false);

      EpiDescritorModel? epiDescritor = widget.episDescritores
          .where(
            (element) => element.cod == epiEntrega.codDescritorEpi,
          )
          .firstOrNull;
      setarEpi(epiDescritor);
    });
  }

  void updateFieldsDescritorEpi(EpiDescritorModel? epiDescritor) {
    setState(() {
      epiEntrega.cod = 0;
      epiEntrega.tstamp = null;
      epiEntrega.codDescritorEpi = epiDescritor?.cod;
      epiEntrega.dataLimiteValidade = null;
      setarDataValidade?.call(null);
      epiEntrega.dataDescarte = null;
      setarDataDescarte?.call(null);
      epiEntrega.dataEntrega = null;
      setarDataEntrega?.call(null);
      epiEntrega.conferenciaVisual = false;
      setarConferenciaVisual?.call(false);
      epiEntrega.controlarValidade = false;
      setarControlaValidade?.call(false);

      EpiDescritorModel? epiDescritorCbx = widget.episDescritores
          .where(
            (element) => element.cod == epiEntrega.codDescritorEpi,
          )
          .firstOrNull;
      setarEpi(epiDescritorCbx);
    });
  }

  late bool Function() validateEPI;
  final ScrollController scroll = ScrollController();
  late void Function(EpiDescritorModel?) setarEpi;

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EpiEntregaPageFrmCubit, EpiEntregaPageFrmState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        UsuarioModel? usuario = widget.usuarios
                                            .where(
                                              (element) =>
                                                  element.cod ==
                                                  epiEntrega.codUsuario,
                                            )
                                            .firstOrNull;

                                        widget.usuarios.sort(
                                          (a, b) => a.nome!.compareTo(b.nome!),
                                        );
                                        return DropDownSearchWidget(
                                          textFunction: (p0) => p0.NomeText(),
                                          readOnly: true,
                                          initialValue: usuario,
                                          sourceList: widget.usuarios,
                                          onChanged: (value) => epiEntrega
                                              .codUsuario = value?.cod,
                                          placeholder: 'Colaborador',
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        EpiDescritorModel? epiDescritor = widget
                                            .episDescritores
                                            .where(
                                              (element) =>
                                                  element.cod ==
                                                  epiEntrega.codDescritorEpi,
                                            )
                                            .firstOrNull;
                                        widget.episDescritores.sort(
                                          (a, b) => a.descricao!
                                              .compareTo(b.descricao!),
                                        );

                                        return DropDownSearchWidget(
                                          setSelectedItemBuilder: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setarEpi = setSelectedItemMethod,
                                          textFunction: (p0) =>
                                              p0.GetDropDownText(),
                                          validator: (obj) => obj == null
                                              ? 'Obrigatório'
                                              : null,
                                          validateBuilder: (
                                            context,
                                            validateMethodBuilder,
                                          ) =>
                                              validateEPI =
                                                  validateMethodBuilder,
                                          initialValue: epiDescritor,
                                          sourceList: widget.episDescritores,
                                          onChanged: (value) => epiEntrega
                                              .codDescritorEpi = value?.cod,
                                          placeholder: 'EPI *',
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
                                    child: dtpLimiteValidade,
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: dtpDataDescarte,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: CustomCheckboxWidget(
                                checked: epiEntrega.conferenciaVisual,
                                onClick: (value) =>
                                    epiEntrega.conferenciaVisual = value,
                                setValue: (context, setValueWidget) =>
                                    setarConferenciaVisual = setValueWidget,
                                text: 'Conferência Visual',
                                align: MainAxisAlignment.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: CustomCheckboxWidget(
                                checked: epiEntrega.controlarValidade,
                                onClick: (value) =>
                                    epiEntrega.controlarValidade = value,
                                setValue: (context, setValueWidget) =>
                                    setarControlaValidade = setValueWidget,
                                text: 'Controlar Validade',
                                align: MainAxisAlignment.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: txtResponsavel,
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: dtpDataEntrega,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'EPIs Necessários',
                                      style: Fontes.getRoboto(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: Text(
                                      'EPIs em Uso',
                                      style: Fontes.getRoboto(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: Text(
                                      'EPIs Descartados',
                                      style: Fontes.getRoboto(),
                                      textAlign: TextAlign.center,
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
                                    child: BlocBuilder<EpiEntregaCubit,
                                        EpiEntregaState>(
                                      bloc: epiEntregaCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<EpiEntregaModel> episEntregas =
                                            state.itens;
                                        List<EpiEntregaModel>
                                            epiEntreguesValidade = [];
                                        if (episEntregas.isNotEmpty) {
                                          epiEntreguesValidade =
                                              getEpisValidade().toList();
                                        }
                                        List<int> codEpisEntregueValidade =
                                            epiEntreguesValidade
                                                .where(
                                                  (element) =>
                                                      element.codDescritorEpi !=
                                                      null,
                                                )
                                                .map((e) => e.codDescritorEpi!)
                                                .toList();
                                        Iterable<
                                                EpiPerfilFindByUserEpiResponseDTO>
                                            epiNecessario =
                                            widget.episNecessarios.where(
                                          (epi) => !codEpisEntregueValidade
                                              .contains(epi.codEpiDescritor),
                                        );
                                        List<EpiDescritorModel?> epis =
                                            epiNecessario
                                                .map(
                                                  (epi) =>
                                                      widget.episDescritores
                                                          .where(
                                                            (element) =>
                                                                element.cod ==
                                                                epi.codEpiDescritor,
                                                          )
                                                          .firstOrNull,
                                                )
                                                .toList();
                                        return ListFieldWidget<
                                            EpiDescritorModel?>(
                                          setSelected: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setSelectedEpiDescritor =
                                                  setSelectedItemMethod,
                                          disableUnselect: false,
                                          sourceList: epis
                                              .where(
                                                (element) => element != null,
                                              )
                                              .toList(),
                                          removeButton: false,
                                          permitReselect: false,
                                          onItemSelected: (value) {
                                            setSelectedEpiEntregueValidade(
                                              null,
                                            );
                                            setSelectedEpiEntregueDescartado(
                                              null,
                                            );
                                            updateFieldsDescritorEpi(value);
                                          },
                                          itemText: (value) {
                                            return value?.descricao ??
                                                'Epi Descritor sem Descrição';
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: BlocBuilder<EpiEntregaCubit,
                                        EpiEntregaState>(
                                      bloc: epiEntregaCubit,
                                      builder: (context, state) {
                                        if (state.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<EpiEntregaModel> episEntregas =
                                            state.itens;
                                        List<EpiEntregaModel>
                                            epiEntreguesValidade = [];
                                        if (episEntregas.isNotEmpty) {
                                          epiEntreguesValidade =
                                              getEpisValidade().toList();
                                        }

                                        return ListFieldWidget<EpiEntregaModel>(
                                          removeListAfterPress: false,
                                          onRemove: onRemove,
                                          setSelected: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setSelectedEpiEntregueValidade =
                                                  setSelectedItemMethod,
                                          sourceList: epiEntreguesValidade,
                                          disableUnselect: false,
                                          removeButton: true,
                                          onItemSelected: (value) {
                                            setSelectedEpiEntregueDescartado(
                                              null,
                                            );
                                            setSelectedEpiDescritor(null);
                                            updateFields(value);
                                          },
                                          itemText: (value) {
                                            final episDescritores =
                                                widget.episDescritores;

                                            if (episDescritores.isEmpty) {
                                              return '';
                                            }
                                            final epiDescritor = episDescritores
                                                .where(
                                                  (epi) =>
                                                      epi.cod ==
                                                      value.codDescritorEpi,
                                                )
                                                .firstOrNull;
                                            String descricao =
                                                epiDescritor?.descricao ?? '';
                                            String data = '';
                                            if (value.dataLimiteValidade !=
                                                null) {
                                              data = DateFormat('dd/MM/yyyy')
                                                  .format(
                                                value.dataLimiteValidade!,
                                              );
                                            }
                                            if (descricao.isNotEmpty &&
                                                data.isNotEmpty) {
                                              descricao += ' - ';
                                            }
                                            descricao += data;
                                            return descricao;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Expanded(
                                    child: BlocBuilder<EpiEntregaCubit,
                                        EpiEntregaState>(
                                      bloc: epiEntregaCubit,
                                      builder: (context, entregaState) {
                                        List<EpiEntregaModel>
                                            epiEntreguesDescartados = [];
                                        if (entregaState.loading) {
                                          return const LoadingWidget();
                                        }
                                        List<EpiEntregaModel> episEntregas =
                                            entregaState.itens;

                                        if (episEntregas.isNotEmpty) {
                                          epiEntreguesDescartados =
                                              episEntregas.where((entrega) {
                                            final isDataDescarteNotNull =
                                                entrega.dataDescarte != null;
                                            final isDataLimiteValidadeNow =
                                                entrega.dataLimiteValidade ==
                                                    DateTime.now();
                                            final isDataLimiteValidadeBeforeNow =
                                                entrega.dataLimiteValidade!
                                                    .isBefore(DateTime.now());

                                            return entrega.codUsuario ==
                                                    epiEntrega.codUsuario &&
                                                (isDataDescarteNotNull ||
                                                    isDataLimiteValidadeNow ||
                                                    isDataLimiteValidadeBeforeNow);
                                          }).toList();
                                        }

                                        return ListFieldWidget<EpiEntregaModel>(
                                          removeListAfterPress: false,
                                          onRemove: onRemove,
                                          setSelected: (
                                            context,
                                            setSelectedItemMethod,
                                          ) =>
                                              setSelectedEpiEntregueDescartado =
                                                  setSelectedItemMethod,
                                          disableUnselect: false,
                                          sourceList: epiEntreguesDescartados,
                                          removeButton: true,
                                          permitReselect: false,
                                          onItemSelected: (value) {
                                            setSelectedEpiEntregueValidade(
                                              null,
                                            );
                                            setSelectedEpiDescritor(null);
                                            updateFields(value);
                                          },
                                          itemText: (value) {
                                            final episDescritores =
                                                widget.episDescritores;

                                            if (episDescritores.isEmpty) {
                                              return '';
                                            }
                                            final epiDescritor = episDescritores
                                                .where(
                                                  (epi) =>
                                                      epi.cod! ==
                                                      value.codDescritorEpi!,
                                                )
                                                .firstOrNull;
                                            String descricao =
                                                epiDescritor?.descricao ?? '';
                                            String data = '';
                                            if (value.dataLimiteValidade !=
                                                null) {
                                              data = DateFormat('dd/MM/yyyy')
                                                  .format(
                                                value.dataLimiteValidade!,
                                              );
                                            }
                                            if (descricao.isNotEmpty &&
                                                data.isNotEmpty) {
                                              descricao += ' - ';
                                            }
                                            descricao += data;
                                            return descricao;
                                          },
                                        );
                                      },
                                    ),
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
                    CustomPopupItemModel(
                      text: 'Imprimir Documento Entrega',
                      onTap: print,
                    ),
                    if (epiEntrega.cod != null && epiEntrega.cod != 0)
                      CustomPopupItemHistoryModel.getHistoryItem(
                        title: 'Entrega de Epi ${epiEntrega.cod}',
                        child: HistoricoPage(
                          pk: epiEntrega.cod!,
                          termo: 'EPI_ENTREGA',
                        ),
                        context: context,
                      ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: UpdateButtonWidget(
                    readonly: epiEntrega.cod == 0 || epiEntrega.cod == null,
                    onPressed: () => {alterarExistente()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: InsertButtonWidget(
                    onPressed: () => {inserirNovo()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: CleanButtonWidget(
                    onPressed: limpar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: CancelButtonUnfilledWidget(
                    onPressed: widget.onCancel,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void limpar() {
    setSelectedEpiEntregueDescartado(null);
    setSelectedEpiEntregueValidade(null);
    updateFields(null);
  }

  Iterable<EpiEntregaModel> getEpisValidade() {
    List<EpiEntregaModel> epis = epiEntregaCubit.state.itens;
    return epis.where((entrega) {
      return entrega.codUsuario == epiEntrega.codUsuario &&
          entrega.dataLimiteValidade != null &&
          entrega.dataDescarte == null &&
          entrega.dataLimiteValidade!.isAfter(DateTime.now());
    });
  }

  void setDescritor(EpiEntregaModel epi) =>
      epi.epiDescritor = widget.episDescritores
          .where((element) => element.cod == epi.codDescritorEpi)
          .firstOrNull;

  Future print() async {
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    int? codUsuario = epiEntrega.codUsuario;
    UsuarioModel? usuario = widget.usuarios
        .where((element) => element.cod == codUsuario)
        .firstOrNull;

    List<EpiEntregaModel> epis = getEpisValidade().toList();
    epis.forEach((element) {
      setDescritor(element);
    });

    EpiDeliveryPrintDTO dto = EpiDeliveryPrintDTO(
      instituition: auth?.instituicao?.nome ?? '',
      userName: usuario?.nome ?? '',
      userDoc: usuario?.docClasse ?? '',
      epis: epis
          .map(
            (e) => EpiDeliveryEpiPrintDTO(
              description: e.epiDescritor?.descricao ?? '',
              CANumber: e.epiDescritor?.numeroCA ?? '',
              validity: e.dataLimiteValidade,
            ),
          )
          .toList(),
    );
    await EpiDeliveryPrinterController(
      context: context,
      dto: dto,
    ).print();
  }

  void onRemove(EpiEntregaModel epi) async {
    if (epi.dataDescarte != null) {
      WarningUtils.showWarningDialog(
        context,
        'Não é possível remover um EPI Descartado',
      );
      return;
    }
    ConfirmDialogUtils.showConfirmAlertDialog(
      context: context,
      message: 'Confirma a remoção do Registro de EPI?',
      onConfirm: () => onConfirm(epi),
      onCancel: () => {},
    );
  }

  void onConfirm(EpiEntregaModel epi) async {
    LoadingController loading = LoadingController(context: context);
    (String, EpiEntregaModel)? result = await EpiEntregaService().delete(epi);
    loading.closeDefault();
    if (result == null) return;
    setSelectedEpiEntregueValidade(
      null,
    );
    setSelectedEpiDescritor(null);
    updateFields(null);
    ToastUtils.showCustomToastSucess(context, result.$1);
    epiEntregaCubit.loadAll();
  }

  void inserirNovo() {
    salvar(true);
  }

  void alterarExistente() {
    salvar(false);
  }

  void salvar(bool novo) {
    bool epiValid = validateEPI();
    bool limiteValidadeValid = limiteValidadeValidate();
    if (!epiValid) {
      scroll.jumpTo(0);
    } else if (!limiteValidadeValid) {
      scroll.jumpTo(50);
    }
    if (!epiValid || !limiteValidadeValid) {
      return;
    }
    cubit.save(
      novo ? epiEntrega.copyWith(cod: 0, tstamp: null) : epiEntrega,
      widget.onSaved,
    );
  }
}

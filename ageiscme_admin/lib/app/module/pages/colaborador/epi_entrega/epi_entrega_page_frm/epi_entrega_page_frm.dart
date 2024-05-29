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
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/clean_button_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/componentes/botoes/save_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/defaults/custom_popup_item_history_model.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
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
  }) : super(key: key);

  final EpiEntregaModel epiEntrega;
  final List<UsuarioModel> usuarios;
  final List<EpiDescritorModel> episDescritores;

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

  late final DatePickerWidget dtpLimiteValidade = DatePickerWidget(
    placeholder: 'Data Limite da Validade',
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

  void updateFields(EpiEntregaModel selectedEpiEntrega) {
    setState(() {
      epiEntrega.cod = selectedEpiEntrega.cod;
      epiEntrega.tstamp = selectedEpiEntrega.tstamp;
      epiEntrega.codDescritorEpi = selectedEpiEntrega.codDescritorEpi;
      epiEntrega.dataLimiteValidade = selectedEpiEntrega.dataLimiteValidade;
      setarDataValidade?.call(epiEntrega.dataLimiteValidade);
      epiEntrega.dataDescarte = selectedEpiEntrega.dataDescarte;
      setarDataDescarte?.call(epiEntrega.dataDescarte);
      epiEntrega.dataEntrega = selectedEpiEntrega.dataEntrega;
      setarDataEntrega?.call(epiEntrega.dataEntrega);
      epiEntrega.conferenciaVisual = selectedEpiEntrega.conferenciaVisual;
      setarConferenciaVisual?.call(epiEntrega.conferenciaVisual ?? false);
      epiEntrega.controlarValidade = selectedEpiEntrega.controlarValidade;
      setarControlaValidade?.call(epiEntrega.controlarValidade ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    setFields();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<EpiEntregaPageFrmCubit, EpiEntregaPageFrmState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.saved) {
          Navigator.of(context).pop((state.saved, state.message));
        }
      },
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
                                        element.cod == epiEntrega.codUsuario,
                                  )
                                  .firstOrNull;

                              widget.usuarios.sort(
                                (a, b) => a.nome!.compareTo(b.nome!),
                              );
                              return DropDownWidget(
                                readOnly: true,
                                initialValue: usuario,
                                sourceList: widget.usuarios,
                                onChanged: (value) =>
                                    epiEntrega.codUsuario = value.cod!,
                                placeholder: 'Colaborador',
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 50.0),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              EpiDescritorModel? epiDescritor =
                                  widget.episDescritores
                                      .where(
                                        (element) =>
                                            element.cod ==
                                            epiEntrega.codDescritorEpi,
                                      )
                                      .firstOrNull;
                              widget.episDescritores.sort(
                                (a, b) => a.descricao!.compareTo(b.descricao!),
                              );

                              return DropDownWidget(
                                initialValue: epiDescritor,
                                sourceList: widget.episDescritores,
                                onChanged: (value) =>
                                    epiEntrega.codDescritorEpi = value.cod!,
                                placeholder: 'EPI',
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
                      onClick: (value) => epiEntrega.conferenciaVisual = value,
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
                      onClick: (value) => epiEntrega.controlarValidade = value,
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
                            'EPIs Entregues na Validade',
                            style: Fontes.getRoboto(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 50.0),
                        Expanded(
                          child: Text(
                            'EPIs Entregues e Descartados',
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
                          child: BlocBuilder<EpiEntregaCubit, EpiEntregaState>(
                            bloc: epiEntregaCubit,
                            builder: (context, state) {
                              if (state.loading) {
                                return const LoadingWidget();
                              }
                              List<EpiEntregaModel> episEntregas = state.itens;
                              List<EpiEntregaModel> epiEntreguesValidade = [];
                              if (episEntregas.isNotEmpty) {
                                epiEntreguesValidade =
                                    getEpisValidade().toList();
                              }

                              return ListFieldWidget<EpiEntregaModel>(
                                sourceList: epiEntreguesValidade,
                                permitReselect: true,
                                removeButton: false,
                                onItemSelected: (value) {
                                  updateFields(value!);
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
                                            epi.cod == value.codDescritorEpi,
                                      )
                                      .firstOrNull;
                                  String descricao =
                                      epiDescritor?.descricao ?? '';
                                  String data = '';
                                  if (value.dataLimiteValidade != null) {
                                    data = DateFormat('dd/MM/yyyy')
                                        .format(value.dataLimiteValidade!);
                                  }
                                  if (descricao.isNotEmpty && data.isNotEmpty) {
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
                          child: BlocBuilder<EpiEntregaCubit, EpiEntregaState>(
                            bloc: epiEntregaCubit,
                            builder: (context, entregaState) {
                              List<EpiEntregaModel> epiEntreguesDescartados =
                                  [];
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
                                  final isDataLimiteValidadeBeforeNow = entrega
                                      .dataLimiteValidade!
                                      .isBefore(DateTime.now());

                                  return entrega.codUsuario ==
                                          epiEntrega.codUsuario &&
                                      (isDataDescarteNotNull ||
                                          isDataLimiteValidadeNow ||
                                          isDataLimiteValidadeBeforeNow);
                                }).toList();
                              }

                              return ListFieldWidget<EpiEntregaModel>(
                                sourceList: epiEntreguesDescartados,
                                removeButton: false,
                                permitReselect: true,
                                onItemSelected: (value) {
                                  updateFields(value!);
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
                                            epi.cod! == value.codDescritorEpi!,
                                      )
                                      .firstOrNull;
                                  String descricao =
                                      epiDescritor?.descricao ?? '';
                                  String data = '';
                                  if (value.dataLimiteValidade != null) {
                                    data = DateFormat('dd/MM/yyyy')
                                        .format(value.dataLimiteValidade!);
                                  }
                                  if (descricao.isNotEmpty && data.isNotEmpty) {
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
          actions: [
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
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SaveButtonWidget(
                    onPressed: () => {salvar()},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CleanButtonWidget(
                    onPressed: () => {
                      setState(() {
                        epiEntrega = EpiEntregaModel.empty();
                      }),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CancelButtonUnfilledWidget(
                    onPressed: () => {Navigator.of(context).pop((false, ''))},
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
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

  void salvar() {
    cubit.save(epiEntrega);
  }
}

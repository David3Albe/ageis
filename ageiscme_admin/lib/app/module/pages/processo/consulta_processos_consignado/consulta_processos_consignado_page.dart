import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/proprietario/proprietario_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_consignado/consulta_processos_consignado_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_consignado/item_consignado_processado_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_dialog/custom_dialog_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_consignado/consulta_processos_consignado_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/item_consignado_processado/item_consignado_processado_service.dart';
import 'package:ageiscme_data/services/item_descritor/item_descritor_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments/consignments_withdrawal_consignment_print_dto.dart';
import 'package:ageiscme_impressoes/dto/consignments_withdrawal/consignments_withdrawal_print_dto.dart';
import 'package:ageiscme_impressoes/prints/consignments_withdrawal_printer/consignments_withdrawal_printer_controller.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/item_descritor/drop_down_search/item_descritor_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_consignado/consulta_processos_consignado_filter.dart';
import 'package:ageiscme_models/query_models/processos_consignado/consulta_processos_consignado_model.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosConsignadoPage extends StatefulWidget {
  ConsultaProcessosConsignadoPage({super.key});

  @override
  State<ConsultaProcessosConsignadoPage> createState() =>
      _ConsultaProcessosConsignadoPageState();
}

class _ConsultaProcessosConsignadoPageState
    extends State<ConsultaProcessosConsignadoPage> {
  late ConsultaProcessosConsignadoModel teste;
  late final List<CustomDataColumn> colunas;

  late final ConsultaProcessosConsignadoPageCubit bloc;
  late final ItemConsignadoProcessadoPageCubit itemConsignadoProcessadoBloc =
      ItemConsignadoProcessadoPageCubit(
    service: ItemConsignadoProcessadoService(),
    itemConsignadoProcessadoModel: itemConsignadoProcessado,
  );
  late final ProprietarioCubit proprietarioBloc;
  late final UsuarioCubit usuarioCubit;
  late final ItemConsignadoProcessadoModel itemConsignadoProcessado;
  late final ConsultaProcessosConsignadoFilter filter;

  int? colaboradorEntrega;
  String? nomeColaboradorEntrega;
  int? responsavelRetirada;
  String? nomeResponsavelRetirada;
  int? medico;
  String? nomeMedico;
  int? codUsuario;
  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    bloc = ConsultaProcessosConsignadoPageCubit(
      service: ConsultaProcessosConsignadoService(),
    );
    filter = ConsultaProcessosConsignadoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    proprietarioBloc = ProprietarioCubit();
    proprietarioBloc.loadAll();
    usuarioCubit = UsuarioCubit();
    itemConsignadoProcessado = ItemConsignadoProcessadoModel.empty();

    recuperaUsuario().then((value) {
      if (value == null ||
          value.usuario == null ||
          value.usuario!.cod == null) {
        return;
      }
      codUsuario = value.usuario!.cod;
    });

    colunas = [
      CustomDataColumn(
        text: 'S',
        field: 'imprimir',
        readonly: false,
        type: CustomDataColumnType.Checkbox,
        onClick: (value, checked) => setAllSameRegisterAsEqual(value, checked),
      ),
      CustomDataColumn(
        text: 'Data',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
      ),
      CustomDataColumn(text: 'Usuário', field: 'usuario'),
      CustomDataColumn(text: 'Origem', field: 'origem'),
      CustomDataColumn(text: 'Circulante', field: 'circulante'),
      CustomDataColumn(
        text: 'Prontuário',
        field: 'prontuario',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiqueta'),
      CustomDataColumn(
        text: 'Material Consignado',
        field: 'materialConsignado',
      ),
      CustomDataColumn(
        text: 'Proprietário',
        field: 'nomeProprietario',
      ),
      CustomDataColumn(
        text: 'Cód. Item Consignado',
        field: 'codItemConsignado',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Item Consignado',
        field: 'descricaoItemConsignado',
      ),
      CustomDataColumn(
        text: 'Qtde. Padrão',
        field: 'qtdePadrao',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Recebido',
        field: 'recebido',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Preparado',
        field: 'preparado',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Consumido',
        field: 'consumido',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Reg. Processo Expurgo',
        field: 'codRegistroProcessoExpurgo',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Item',
        field: 'codItem',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'Médico', field: 'medico'),
      CustomDataColumn(text: 'Entregue Por', field: 'entreguePor'),
      CustomDataColumn(text: 'Retirado Por', field: 'retiradoPor'),
    ];

    super.initState();
  }

  late void Function() refreshMethod;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: PrintButtonWidget(
                onPressed: () => openModalImpressao(context),
              ),
            ),
          ],
        ),
        BlocListener<ConsultaProcessosConsignadoPageCubit,
            ConsultaProcessosConsignadoPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosConsignadoPageCubit,
              ConsultaProcessosConsignadoPageState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    smallRows: true,
                    columns: colunas,
                    items: state.itensConsignados,
                    refreshWidgetBuilder: (context, refreshWidget) =>
                        refreshMethod = refreshWidget,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadUserCubit() {
    if (!usuarioCubit.state.loaded) {
      usuarioCubit.loadFilter(
        UsuarioFilter(
          apenasAtivos: true,
          tipoQuery: UsuarioFilterTipoQuery.SemFoto,
          ordenarPorNomeCrescente: true,
          apenasColaboradores: true,
        ),
      );
    }
  }

  void setAllSameRegisterAsEqual(
    ConsultaProcessosConsignadoModel obj,
    bool checked,
  ) {
    for (ConsultaProcessosConsignadoModel consignado
        in bloc.state.itensConsignados) {
      if (obj.codRegistroProcessoExpurgo ==
          consignado.codRegistroProcessoExpurgo) {
        consignado.imprimir = checked;
      }
    }
    refreshMethod.call();
  }

  void openModalImpressao(BuildContext context) async {
    loadUserCubit();
    var result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<UsuarioCubit, UsuarioState>(
                bloc: usuarioCubit,
                builder: (context, usuarioState) {
                  if (usuarioState.loading) {
                    return const LoadingWidget();
                  }
                  List<UsuarioModel> usuarios = usuarioState.usuarios;
                  return DropDownSearchWidget<UsuarioModel>(
                    textFunction: (usuario) => usuario.NomeText(),
                    sourceList: usuarios,
                    onChanged: (value) {
                      colaboradorEntrega = value?.cod;
                      nomeColaboradorEntrega = value?.nome;
                    },
                    placeholder: 'Colaborador Entrega',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<UsuarioCubit, UsuarioState>(
                bloc: usuarioCubit,
                builder: (context, usuarioState) {
                  if (usuarioState.loading) {
                    return const LoadingWidget();
                  }
                  List<UsuarioModel> usuarios = usuarioState.usuarios;
                  return DropDownSearchWidget<UsuarioModel>(
                    textFunction: (usuario) => usuario.NomeText(),
                    sourceList: usuarios,
                    onChanged: (value) {
                      responsavelRetirada = value?.cod;
                      nomeResponsavelRetirada = value?.nome;
                    },
                    placeholder: 'Resposável Retirada',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<UsuarioCubit, UsuarioState>(
                bloc: usuarioCubit,
                builder: (context, usuarioState) {
                  if (usuarioState.loading) {
                    return const LoadingWidget();
                  }
                  List<UsuarioModel> usuarios = usuarioState.usuarios;
                  return DropDownSearchWidget<UsuarioModel>(
                    textFunction: (usuario) => usuario.NomeText(),
                    sourceList: usuarios,
                    onChanged: (value) {
                      medico = value?.cod;
                      nomeMedico = value?.nome;
                    },
                    placeholder: 'Médico / Equipe',
                  );
                },
              ),
            ],
          ),
        );
      },
    );

    if (result != true) {
      ToastUtils.showCustomToastWarning(
        context,
        'Impressão cancelada',
      );
      return;
    }

    Iterable<ConsultaProcessosConsignadoModel> processosMarcados =
        bloc.state.itensConsignados.where(
      (entrada) => entrada.imprimir == true,
    );

    await salvar(processosMarcados);
  }

  Future salvar(
    Iterable<ConsultaProcessosConsignadoModel> processosMarcados,
  ) async {
    if (colaboradorEntrega == null ||
        responsavelRetirada == null ||
        medico == null) {
      await ErrorUtils.showErrorDialog(
        context,
        ['Preencha todos os campos para realizar a impressão!'],
      );
      return;
    }

    LoadingController loading = LoadingController(context: context);
    Set<int> codRegistroProcessos = processosMarcados
        .where((element) => element.codRegistroProcessoExpurgo != null)
        .map(
          (e) => e.codRegistroProcessoExpurgo!,
        )
        .toSet();

    if (codRegistroProcessos.isNotEmpty) {
      for (int codRegistro in codRegistroProcessos) {
        ItemConsignadoProcessadoModel itemConsginadoProcessado =
            ItemConsignadoProcessadoModel(
          DataHora: null,
          codInstituicao: 2,
          codRegistro: codRegistro,
          medico: medico,
          responsavelRetirada: responsavelRetirada,
          responsavelEntrega: colaboradorEntrega,
          codUsuario: codUsuario,
        );
        itemConsignadoProcessadoBloc.save(itemConsginadoProcessado);
      }
    }

    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();

    ConsignmentsWithdrawalPrintDTO dto = ConsignmentsWithdrawalPrintDTO(
      deliveryResponsibleName: nomeColaboradorEntrega!,
      doctorName: nomeMedico!,
      instituitionName: authentication?.instituicao?.nome ?? '',
      withdrawalResponsibleName: nomeResponsavelRetirada!,
      items: processosMarcados.map(
        (e) => ConsignmentsWithdrawalConsignmentPrintDTO(
          tagId: e.idEtiqueta!,
          name: e.materialConsignado!,
          consignedItemId: e.codItemConsignado!,
          consignedItemDescription: e.descricaoItemConsignado!,
          received: e.recebido!,
          consumed: e.consumido!,
          prontuary: e.prontuario,
        ),
      ),
    );

    await ConsignmentsWithdrawalPrinterController(
      context: context,
      dto: dto,
    ).print();
    loading.closeDefault();

    bloc.loadProcessosConsignado(filter);
  }

  void onError(ConsultaProcessosConsignadoPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FilterDialogWidget(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DatePickerWidget(
                        placeholder: 'Data Inicio',
                        onDateSelected: (value) => filter.startDate = value,
                        initialValue: filter.startDate,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                    ),
                    Expanded(
                      child: TimePickerWidget(
                        placeholder: 'Hora Início',
                        initialValue: filter.startTime == null
                            ? null
                            : TimeOfDay(
                                hour: filter.startTime!.hour,
                                minute: filter.startTime!.minute,
                              ),
                        onTimeSelected: (selectedTime) {
                          if (selectedTime == null) {
                            filter.startTime = null;
                            return;
                          }
                          filter.startTime = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                Row(
                  children: [
                    Expanded(
                      child: DatePickerWidget(
                        placeholder: 'Data Término',
                        onDateSelected: (value) => filter.finalDate = value,
                        initialValue: filter.finalDate,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                    ),
                    Expanded(
                      child: TimePickerWidget(
                        placeholder: 'Hora Fim',
                        initialValue: filter.finalTime == null
                            ? null
                            : TimeOfDay(
                                hour: filter.finalTime!.hour,
                                minute: filter.finalTime!.minute,
                              ),
                        onTimeSelected: (selectedTime) {
                          print(selectedTime);
                          if (selectedTime == null) {
                            filter.finalTime = null;
                            return;
                          }
                          filter.finalTime = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                DropDownSearchApiWidget<ItemDescritorDropDownSearchResponseDTO>(
                  search: (str) async =>
                      (await ItemDescritorService().getDropDownSearch(
                        ItemDescritorDropDownSearchDTO(
                          numeroRegistros: 30,
                          termoPesquisa: str,
                          apenasAtivos: true,
                        ),
                      ))
                          ?.$2 ??
                      [],
                  textFunction: (itemDescritor) => itemDescritor.Nome(),
                  initialValue: filter.itemDescritor == null
                      ? null
                      : ItemDescritorDropDownSearchResponseDTO(
                          cod: filter.itemDescritor!.cod,
                          nome: filter.itemDescritor?.nome,
                        ),
                  onChanged: (value) {
                    filter.codItemDescritor = value?.cod;
                    filter.itemDescritor = value;
                  },
                  placeholder: 'Item Descritor',
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                CustomAutocompleteWidget<ItemModel>(
                  initialValue: filter.idEtiquetaContem,
                  onChange: (str) => filter.idEtiquetaContem = str,
                  onItemSelectedText: (item) => item.idEtiqueta ?? null,
                  label: 'Item',
                  title: (p0) => Text(p0.EtiquetaDescricaoText()),
                  suggestionsCallback: (str) => ItemService().Filter(
                    ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                BlocBuilder<ProprietarioCubit, ProprietarioState>(
                  bloc: proprietarioBloc,
                  builder: (context, proprietarioState) {
                    if (proprietarioState.loading) return const LoadingWidget();
                    List<ProprietarioModel> proprietarios =
                        proprietarioState.proprietarios;
                    proprietarios.sort(
                      (a, b) => a.nome!.compareTo(b.nome!),
                    );
                    ProprietarioModel? proprietario = proprietarios
                        .where(
                          (element) => element.cod == filter.codProprietario,
                        )
                        .firstOrNull;
                    return DropDownSearchWidget<ProprietarioModel>(
                      textFunction: (proprietario) =>
                          proprietario.ProprietarioText(),
                      initialValue: proprietario,
                      sourceList: proprietarios
                          .where((element) => element.ativo == true)
                          .toList(),
                      onChanged: (value) => filter.codProprietario = value?.cod,
                      placeholder: 'Proprietário',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    if (result != true) return;
    bloc.loadProcessosConsignado(filter);
  }
}

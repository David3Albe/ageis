import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_entrada_automatica/entrada_automatica_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/custom_dialog/custom_dialog_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_service.dart';
import 'package:ageiscme_data/services/entrada_automatica/entrada_automatica_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_entrada_automatica/consulta_processos_leitura_entrada_automatica_model.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/confirm_dialog_utils.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosleituraEntradaAutomaticaPage extends StatefulWidget {
  ConsultaProcessosleituraEntradaAutomaticaPage({super.key});

  @override
  State<ConsultaProcessosleituraEntradaAutomaticaPage> createState() =>
      _ConsultaProcessosLeituraEntradaAutomaticaPageState();
}

class _ConsultaProcessosLeituraEntradaAutomaticaPageState
    extends State<ConsultaProcessosleituraEntradaAutomaticaPage> {
  late final List<CustomDataColumn> colunas;

  late final ConsultaProcessosLeituraEntradaAutomaticaPageCubit bloc;
  late final EntradaAutomaticaPageCubit entradaAutomaticaBloc =
      EntradaAutomaticaPageCubit(
    service: EntradaAutomaticaService(),
    entradaAutomaticaModel: entradaAutomatica,
  );
  late final ConsultaProcessosLeituraEntradaAutomaticaFilter filter;
  late final ProcessoEtapaCubit processoEtapaBloc;
  late final EntradaAutomaticaModel entradaAutomatica;
  late final ConsultaProcessosLeituraEntradaAutomaticaModel
      consultaEntradaAutomatica;
  late final PlutoGridWidget grid;
  int? codUsuario;

  Future<AuthenticationResultDTO?> recuperaUsuario() async {
    return await Modular.get<AuthenticationStore>().GetAuthenticated();
  }

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraEntradaAutomaticaPageCubit(
      service: ConsultaProcessosLeituraEntradaAutomaticaService(),
    );
    filter = ConsultaProcessosLeituraEntradaAutomaticaFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    processoEtapaBloc = ProcessoEtapaCubit();
    processoEtapaBloc.loadAll();
    entradaAutomatica = EntradaAutomaticaModel.empty();

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
        text: 'Sel.',
        field: 'cancelar',
        readonly: false,
        type: CustomDataColumnType.Checkbox,
        onClick: (value, checked) => setAllSameRegisterAsEqual(value, checked),
      ),
      CustomDataColumn(
        text: 'Data Hora',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
      ),
      CustomDataColumn(
        text: 'Cód. Registro',
        field: 'codRegistroProcesso',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Entrada Aut.',
        field: 'codEntradaAut',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'Situação', field: 'situacao'),
      CustomDataColumn(text: 'Obs. Canc.', field: 'observacao'),
      CustomDataColumn(text: 'Cód. Kit', field: 'codBarraKit'),
      CustomDataColumn(text: 'Kit', field: 'nomeKit'),
      CustomDataColumn(text: 'Etiqueta', field: 'idEtiqueta'),
      CustomDataColumn(text: 'Item', field: 'descricaoItem'),
      CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
      CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
      CustomDataColumn(text: 'Equipamento', field: 'nomeEquipamento'),
      CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
      CustomDataColumn(text: 'Tipo Processo', field: 'nomeTipoProcesso'),
      CustomDataColumn(text: 'Prioridade', field: 'nivelPrioridade'),
      CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
      CustomDataColumn(text: 'Prontuário', field: 'prontuario'),
      CustomDataColumn(text: 'Origem', field: 'origem'),
      CustomDataColumn(text: 'Destino', field: 'destino'),
      CustomDataColumn(text: 'Circulante', field: 'circulante'),
      CustomDataColumn(text: 'Conf. Visual', field: 'confVisual'),
      CustomDataColumn(
        text: 'Resp. Lib. Kit Incomp.',
        field: 'nomeRespLibKitIncomp',
      ),
      CustomDataColumn(
        text: 'Resp. Lib. Quebra Fluxo',
        field: 'nomeRespLibQuebFluxo',
      ),
      CustomDataColumn(text: 'Lote', field: 'lote'),
      CustomDataColumn(text: 'Embalagem', field: 'embalagem'),
      CustomDataColumn(
        text: 'Cód. Item',
        field: 'codItem',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Kit 1',
        field: 'codKit2',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Etapa Processo',
        field: 'codEtapaProcesso',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(
        text: 'Cód. Leitura',
        field: 'codLeitura',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'Motivo', field: 'motivo'),
      CustomDataColumn(text: 'Motivo Quebra Fluxo', field: 'motivoQuebraFluxo'),
      CustomDataColumn(text: 'Observações', field: 'observacoes'),
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
              child: CancelButtonUnfilledWidget(
                onPressed: () => {
                  openModalCancelamento(context),
                },
              ),
            ),
          ],
        ),
        BlocListener<ConsultaProcessosLeituraEntradaAutomaticaPageCubit,
            ConsultaProcessosLeituraEnrtradaAutomaticaPageState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.error.isNotEmpty) onError(state);
          },
          child: BlocBuilder<ConsultaProcessosLeituraEntradaAutomaticaPageCubit,
              ConsultaProcessosLeituraEnrtradaAutomaticaPageState>(
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
                    items: state.entradasAutomaticas,
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

  void setAllSameRegisterAsEqual(
    ConsultaProcessosLeituraEntradaAutomaticaModel obj,
    bool checked,
  ) {
    for (ConsultaProcessosLeituraEntradaAutomaticaModel entrada
        in bloc.state.entradasAutomaticas) {
      if (obj.codRegistroProcesso == entrada.codRegistroProcesso) {
        entrada.cancelar = checked;
      }
    }
    consultaEntradaAutomatica = obj;
    refreshMethod.call();
  }

  void openModalCancelamento(BuildContext context) async {
    bool confirmacao = await ConfirmDialogUtils.showConfirmAlertDialog(
      context,
      'Apenas Registros PENDENTES poderão ser cancelado,\ndeseja prosseguir?',
    );

    if (!confirmacao) {
      return ToastUtils.showCustomToastWarning(
        context,
        'Nenhum registro foi cancelado',
      );
    }

    var result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomDialogWidget(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 2)),
              TextFieldStringWidget(
                placeholder:
                    'Insira uma Observação sobre o motivo de cancelamento',
                onChanged: (String? str) {
                  entradaAutomatica.observacao = str.toString();
                },
              ),
            ],
          ),
        );
      },
    );

    if (result == true) {
      List<ConsultaProcessosLeituraEntradaAutomaticaModel> registrosMarcados =
          bloc.state.entradasAutomaticas
              .where(
                (entrada) => entrada.cancelar == true && entrada.situacao == 0,
              )
              .toList();

      salvar(registrosMarcados);
    } else {
      return ToastUtils.showCustomToastWarning(
        context,
        'Nenhum registro foi cancelado',
      );
    }
  }

  void salvar(
    List<ConsultaProcessosLeituraEntradaAutomaticaModel> registrosMarcados,
  ) {
    String? observacao = entradaAutomatica.observacao;
    for (ConsultaProcessosLeituraEntradaAutomaticaModel registro
        in registrosMarcados) {
      EntradaAutomaticaModel entradaAutomatica = EntradaAutomaticaModel(
        codRegistroProcesso: registro.codRegistroProcesso,
        cod: 0,
        DataHora: registro.dataHora,
        codEtapa: registro.codEtapaProcesso,
        codInstituicao: 0,
        codProcessoLeitura: registro.codLeitura,
        observacao: observacao,
        codUsuario: codUsuario,
        situacao: 2,
        tstamp: '',
        ultimaAlteracao: null,
        usuario: null,
        processoEtapa: null,
        processoLeitura: null,
        processoRegistro: null,
      );

      entradaAutomaticaBloc.save(entradaAutomatica);
    }
    bloc.loadEntradaAutomatica(filter);
  }

  void onError(ConsultaProcessosLeituraEnrtradaAutomaticaPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    showDialog<bool>(
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
                CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
                  initialValue: filter.codBarraKitContem,
                  onChange: (str) => filter.codBarraKitContem = str,
                  onItemSelectedText: (kit) => kit.codBarra,
                  label: 'Kit',
                  title: (p0) => Text(p0.CodBarraDescritorText()),
                  suggestionsCallback: (str) async {
                    return (await KitService().getDropDownSearchKits(
                          KitDropDownSearchDTO(
                            search: str,
                            numeroRegistros: 30,
                          ),
                        ))
                            ?.$2 ??
                        [];
                  },
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
                BlocBuilder<ProcessoEtapaCubit, ProcessoEtapaState>(
                  bloc: processoEtapaBloc,
                  builder: (context, processoEtapaState) {
                    if (processoEtapaState.loading) {
                      return const LoadingWidget();
                    }
                    List<ProcessoEtapaModel> proessosEtapas =
                        processoEtapaState.processosEtapas;

                    proessosEtapas.sort((a, b) {
                      final descricaoA = a.descricao ?? '';
                      final descricaoB = b.descricao ?? '';
                      return descricaoA.compareTo(descricaoB);
                    });

                    ProcessoEtapaModel? processoEtapa = proessosEtapas
                        .where(
                          (element) => element.cod == filter.codEtapaProcesso,
                        )
                        .firstOrNull;
                    return DropDownSearchWidget<ProcessoEtapaModel>(
                      textFunction: (processoEtapa) =>
                          processoEtapa.GetNomeEtapaText(),
                      initialValue: processoEtapa,
                      sourceList: proessosEtapas,
                      onChanged: (value) =>
                          filter.codEtapaProcesso = value?.cod,
                      placeholder: 'Etapa do Processo',
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                TextFieldNumberWidget(
                  placeholder: 'Lote',
                  onChanged: (String? str) {
                    filter.codRegistroProcesso = int.tryParse(str!);
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                TextFieldStringWidget(
                  placeholder: 'Indicador',
                  onChanged: (String? str) {
                    filter.indicador = str;
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                TextFieldStringWidget(
                  placeholder: 'Prontuário',
                  onChanged: (String? str) {
                    filter.prontuarioRetirada = str;
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: DropDownWidget<EntradaAutomaticaSituacaoOptions>(
                    initialValue:
                        EntradaAutomaticaSituacaoOptions.situacaoOptions
                            .where(
                              (element) => element.cod == filter.codSituacao,
                            )
                            .firstOrNull,
                    sourceList:
                        EntradaAutomaticaSituacaoOptions.situacaoOptions,
                    onChanged: (value) => filter.codSituacao = value.cod,
                    placeholder: 'Situação',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        bloc.loadEntradaAutomatica(filter);
      }
    });
  }
}

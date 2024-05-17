import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe/consulta_processos_leitura_datalhe_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_page.dart';
import 'package:ageiscme_admin/app/module/services/custom_navigation_bar_service.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura/consulta_processos_leitura_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe/consulta_processos_leitura_detalhe_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura/consulta_processos_leitura_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_response_model.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/query_dialog/query_dialog_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ConsultaProcessosLeituraPage extends StatefulWidget {
  ConsultaProcessosLeituraPage({super.key, this.filter});

  final ConsultaProcessosLeituraFilter? filter;

  @override
  State<ConsultaProcessosLeituraPage> createState() =>
      _ConsultaProcessosLeituraPageState();
}

class _ConsultaProcessosLeituraPageState
    extends State<ConsultaProcessosLeituraPage> {
  ConsultaProcessosLeituraModel? Function(PlutoRow)? getObjByRow;

  static Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    if ((renderContext.row.cells['statusKit']?.value.toString() ?? '') != '1' &&
        (renderContext.row.cells['statusKit']?.value.toString() ?? '') != '') {
      cor = Cores.corTextoVermelho;
    }

    if ((renderContext.row.cells['nroItensFaltante']?.value.toString() ?? '') ==
        0) {
      renderContext.row.cells['nroItensFaltante']?.value = '';
    }

    return Text(
      renderContext.cell.value.toString(),
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
        fontSize: renderContext.stateManager.style.cellTextStyle.fontSize,
      ),
    );
  }

  List<CustomDataColumn> _getColunas(BuildContext context) {
    ConsultaProcessosLeituraPageCubit bloc =
        context.read<ConsultaProcessosLeituraPageCubit>();
    ConsultaProcessosLeituraResponseModel? response = bloc.state.response;
    return [
      CustomDataColumn(
        text: 'Data',
        field: 'data',
        type: CustomDataColumnType.Date,
        width: 110,
      ),
      CustomDataColumn(
        text: 'Hora',
        field: 'hora',
        type: CustomDataColumnType.Text,
        width: 80,
      ),
      CustomDataColumn(
        text: 'Etiqueta Kit',
        field: 'codKit',
        calculatedField: 'codBarraKit',
        customRenderer: getCustomRenderer,
        width: 160,
        valueConverter: (value) => response?.kits[value]?.codBarra ?? '',
      ),
      CustomDataColumn(
        text: 'Kit',
        field: 'codKit',
        calculatedField: 'nomeKit',
        customRenderer: getCustomRenderer,
        valueConverter: (value) => response?.kits[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Faltantes',
        field: 'nroItensFaltante',
        valueConverter: (value) => value == 0 ? '' : value,
        type: CustomDataColumnType.Number,
        width: 100,
      ),
      CustomDataColumn(
        text: 'Etiqueta',
        field: 'codItem',
        calculatedField: 'idEtiqueta',
        width: 120,
        valueConverter: (value) => response?.items[value]?.idEtiqueta ?? '',
      ),
      CustomDataColumn(
        text: 'Item',
        field: 'codItem',
        calculatedField: 'descricaoItem',
        valueConverter: (value) => response?.items[value]?.descricao ?? '',
      ),
      CustomDataColumn(
        text: 'Proprietário',
        field: 'codItem',
        calculatedField: 'nomeProprietario',
        valueConverter: (value) {
          int? codProprietario = response?.items[value]?.codProprietario;
          return response?.proprietarios[codProprietario]?.nome ?? '';
        },
      ),
      CustomDataColumn(
        text: 'Entrada/Saída',
        field: 'entradaSaida',
        width: 130,
      ),
      CustomDataColumn(
        text: 'Equipamento',
        field: 'codEtapaProcesso',
        calculatedField: 'equipamento',
        valueConverter: (value) {
          int? codEtapaProcesso = response?.etapas[value]?.codEquipamento;
          return response?.equipamentos[codEtapaProcesso]?.nome ?? '';
        },
      ),
      CustomDataColumn(
        text: 'Etapa Processo',
        field: 'codEtapaProcesso',
        calculatedField: 'nomeEtapaProcesso',
        valueConverter: (value) {
          return response?.etapas[value]?.nome ?? '';
        },
      ),
      CustomDataColumn(
        text: 'Tipo Processo',
        field: 'codEtapaProcesso',
        calculatedField: 'nomeTipoProcesso',
        valueConverter: (value) {
          int? codTipoProcesso = response?.etapas[value]?.codTipoProcesso;
          return response?.tiposProcesso[codTipoProcesso]?.nome ?? '';
        },
      ),
      CustomDataColumn(
        text: 'Prioridade',
        field: 'codPrioridade',
        width: 130,
        valueConverter: (value) {
          if(value==null) return '';
          return response?.prioridades[int.parse(value)]?.nome ?? '';
        },
      ),
      CustomDataColumn(
        text: 'Qtde. Processos',
        field: 'codItem',
        type: CustomDataColumnType.Number,
        width: 130,
        calculatedField: 'qtdeProcessos',
        valueConverter: (value) => response?.items[value]?.qtdeProcessos ?? '',
      ),
      CustomDataColumn(
        text: 'Usuário',
        field: 'codUsuario',
        calculatedField: 'nomeUsuario',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(text: 'Prontuário', field: 'prontuarioRetirada'),
      CustomDataColumn(
        text: 'Origem',
        field: 'codLocalOrigem',
        calculatedField: 'origem',
        valueConverter: (value) => response?.locais[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Destino',
        field: 'codLocalDestino',
        calculatedField: 'destino',
        valueConverter: (value) => response?.locais[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Circulante',
        field: 'codCirculante',
        calculatedField: 'circulante',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Conf. Visual',
        field: 'conferidoVisualmente',
        width: 130,
      ),
      CustomDataColumn(
        text: 'Resp. Lib. Kit. Incompleto',
        field: 'codRespKitIncomp',
        calculatedField: 'nomeRespKitIncomp',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Resp. Lib. Quebra Fluxo',
        field: 'codRespQuebFluxo',
        calculatedField: 'nomeRespQuebFluxo',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Resp. Destino Não Compatível',
        field: 'codRespDestinoNaoCompativel',
        calculatedField: 'nomeRepDestinoNaoCompativel',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Indicador',
        field: 'indicador',
        type: CustomDataColumnType.Number,
        width: 120,
      ),
      CustomDataColumn(
        text: 'Biológico',
        field: 'biologico',
        type: CustomDataColumnType.Number,
        width: 120,
      ),
      CustomDataColumn(
        text: 'Implantável',
        field: 'implantavel',
        width: 120,
      ),
      CustomDataColumn(
        text: 'Lote',
        field: 'lote',
        type: CustomDataColumnType.Number,
        width: 110,
      ),
      CustomDataColumn(text: 'Integrador Kit', field: 'integradorKit'),
      CustomDataColumn(
        text: 'Embalagem',
        field: 'codEmbalagem',
        calculatedField: 'embalagem',
        valueConverter: (value) => response?.embalagens[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Cód. Item',
        field: 'codItem',
        type: CustomDataColumnType.Number,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Cód. Kit',
        field: 'codKit',
        type: CustomDataColumnType.Number,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Cód. Etapa Processo',
        field: 'codEtapaProcesso',
        type: CustomDataColumnType.Number,
        width: 160,
      ),
      CustomDataColumn(
        text: 'Cód. Leitura',
        field: 'codLeitura',
        type: CustomDataColumnType.Number,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Motivo',
        field: 'codMotivo',
        calculatedField: 'motivo',
        valueConverter: (value) => response?.motivos[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Motivo Quebra Fluxo',
        field: 'codMotivoQuebraFluxo',
        calculatedField: 'motivoQuebraFluxo',
        valueConverter: (value) =>
            response?.motivosQuebraFluxo[value]?.nome ?? '',
      ),
      CustomDataColumn(text: 'Observação', field: 'observacao'),
      CustomDataColumn(
        text: 'Status Kit',
        field: 'statusKit',
        width: 130,
      ),
      CustomDataColumn(
        text: 'Restrição Kit',
        field: 'codKit',
        calculatedField: 'restricaoKit',
        valueConverter: (value) => response?.kits[value]?.restricao ?? '',
      ),
      CustomDataColumn(
        text: 'Kit Liberado Incompleto',
        field: 'kitLiberadoIncompleto',
        width: 160,
      ),
      CustomDataColumn(
        text: 'Cód. Registro Processo',
        field: 'codRegistroProcesso',
        type: CustomDataColumnType.Number,
        width: 170,
      ),
    ];
  }

  late final ConsultaProcessosLeituraPageCubit bloc;

  late final ProcessoEtapaCubit processoEtapaBloc;
  late final ConsultaProcessosLeituraFilter filter;
  final Map<int, Color> codRegistroProcessoColor = {};
  Color ultimaCor = Colors.grey;

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraPageCubit(
      service: ConsultaProcessosLeituraService(),
    );

    if (widget.filter != null) {
      filter = widget.filter!;
      bloc.loadProcessoLeitura(filter);
    } else {
      filter = ConsultaProcessosLeituraFilter.empty();
      filter.startDate =
          DateUtils.dateOnly(DateTime.now().add(const Duration(days: -1)));
      filter.finalDate = DateUtils.dateOnly(DateTime.now());
    }

    processoEtapaBloc = ProcessoEtapaCubit();

    super.initState();
  }

  void loadEtapaCubit() {
    if (!processoEtapaBloc.state.loaded) {
      processoEtapaBloc.loadFilter(
        ProcessoEtapaFilter(
          apenasAtivos: true,
          ordenarPorNomeCrescente: true,
        ),
      );
    }
  }

  Color rowColorCallback(PlutoRowColorContext row) {
    ConsultaProcessosLeituraModel? leitura = getObjByRow!(row.row);
    if (leitura?.cancelada == true) return Colors.red.shade400;
    int? codRegistroProcesso = row.row.cells['codRegistroProcesso']?.value;
    if (codRegistroProcesso == null) return ultimaCor;
    if (codRegistroProcessoColor.containsKey(codRegistroProcesso)) {
      return codRegistroProcessoColor[codRegistroProcesso]!;
    }
    Color cor = ultimaCor == Colors.white
        ? const Color.fromARGB(255, 192, 191, 191)
        : Colors.white;
    codRegistroProcessoColor.putIfAbsent(codRegistroProcesso, () => cor);
    ultimaCor = cor;
    return cor;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: bloc)],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterButtonWidget(
            onPressed: () => {
              openModal(context),
            },
          ),
          BlocListener<ConsultaProcessosLeituraPageCubit,
              ConsultaProcessosLeituraPageState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.error.isNotEmpty) onError(state);
            },
            child: BlocBuilder<ConsultaProcessosLeituraPageCubit,
                ConsultaProcessosLeituraPageState>(
              bloc: bloc,
              builder: (context, state) {
                if (state.loading) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                }
                List<ConsultaProcessosLeituraModel> leituras =
                    state.response?.leituras ?? [];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                    child: PlutoGridWidget(
                      getObjectByRowMethod: (context, getObjectByRowMethod) =>
                          getObjByRow = getObjectByRowMethod,
                      rowColorCallback: rowColorCallback,
                      smallRows: true,
                      columns: _getColunas(context),
                      items: leituras,
                      onDetail: (event, obj) async {
                        var isUserValid =
                            await AccessUserService.validateUserHasRight(
                          DireitoEnum.ProcessoLeituraConsulta,
                        );

                        if (isUserValid == false) {
                          return ToastUtils.showCustomToastWarning(
                            context,
                            'O Seu usuário não tem permissão para esta tela!',
                          );
                        }

                        var clickedColumnValue =
                            event.row.cells['codBarraKit']?.value;

                        if (clickedColumnValue != null &&
                            clickedColumnValue is String &&
                            clickedColumnValue.isNotEmpty) {
                          openModalRedirectDetalheKit(
                            context,
                            obj.codKit,
                            obj.codRegistroProcesso,
                            obj.nroItensFaltante,
                            obj.dataHora,
                          );
                        } else {
                          openModalRedirectDetalhe(
                            context,
                            obj.codLeitura,
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void openModalRedirectDetalhe(
    BuildContext context,
    int? codLeitura,
  ) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaProcessoLeituraDetalhePage(
            filter: ConsultaProcessosLeituraDetalheFilter(
              codLeitura: codLeitura,
            ),
          ),
        );
      },
    );
  }

  void openModalRedirectDetalheKit(
    BuildContext context,
    int? codKit,
    int? codRegistroProcesso,
    int? faltantes,
    DateTime? dataHora,
  ) {
    showDialog<bool>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return QueryDialogWidget(
          child: ConsultaProcessoLeituraDetalheKitPage(
            filter: ConsultaProcessosLeituraDetalheKitFilter(
              codKit: codKit,
              codRegistroProcesso: codRegistroProcesso,
              faltantes: faltantes,
              dataHora: dataHora,
            ),
          ),
        );
      },
    );
  }

  void onError(ConsultaProcessosLeituraPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  void openModal(BuildContext context) {
    loadEtapaCubit();
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
                  builder: (context, state) {
                    if (state.loading) return const LoadingWidget();
                    List<ProcessoEtapaModel> processosEtapas =
                        state.processosEtapas;

                    processosEtapas.sort(
                      (a, b) =>
                          a.tipoProcesso!.nome.compareTo(b.tipoProcesso!.nome),
                    );

                    return DropDownSearchWidget<ProcessoEtapaModel>(
                      maxItems: 200,
                      textFunction: (processoEtapa) =>
                          processoEtapa.GetNomeEtapaTipoText(),
                      sourceList: processosEtapas
                          .where((element) => element.ativo == true)
                          .toList(),
                      onChanged: (value) =>
                          filter.codEtapaProcesso = value?.cod,
                      placeholder: 'Etapa do Processo',
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFieldNumberWidget(
                          placeholder: 'Lote',
                          onChanged: (value) => filter.lote = int.parse(value),
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(
                        child: TextFieldStringWidget(
                          placeholder: 'Indicador',
                          onChanged: (value) => filter.indicador = value,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFieldNumberWidget(
                          placeholder: 'Biológico Implantável',
                          onChanged: (value) => filter.biologico = value,
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Expanded(
                        child: TextFieldStringWidget(
                          placeholder: 'Prontuário',
                          onChanged: (value) => filter.prontuario = value,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 2)),
                CustomCheckboxWidget(
                  checked: filter.implantavel,
                  onClick: (value) => filter.implantavel = value,
                  text: 'Apenas Implantáveis',
                  align: MainAxisAlignment.start,
                ),
              ],
            ),
          ),
        );
      },
    ).then((result) {
      if (result == true) {
        codRegistroProcessoColor.clear();
        CustomNavigationBarService.turnExpandedOff(context);
        bloc.loadProcessoLeitura(filter);
      }
    });
  }
}

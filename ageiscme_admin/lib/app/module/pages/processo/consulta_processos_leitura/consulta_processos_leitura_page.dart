import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/kit/kit_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe/consulta_processos_leitura_datalhe_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_page.dart';
import 'package:ageiscme_admin/app/module/services/custom_navigation_bar_service.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_admin/app/module/widgets/query_dialog/query_dialog_widget.dart';
import 'package:ageiscme_data/query_services/processos_leitura/consulta_processos_leitura_service.dart';
import 'package:ageiscme_data/services/access_user/access_user_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/processos_leitura/consulta_processos_leitura_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe/consulta_processos_leitura_detalhe_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
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

  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Data',
      field: 'dataHora',
      type: CustomDataColumnType.DateTime,
    ),
    CustomDataColumn(
      text: 'Cód. Kit',
      field: 'codBarraKit',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Kit',
      field: 'nomeKit',
      customRenderer: getCustomRenderer,
    ),
    CustomDataColumn(
      text: 'Faltantes',
      field: 'nroItensFaltante',
      valueConverter: (value) => value == 0 ? '' : value,
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Etiqueta', field: 'idEtiqueta'),
    CustomDataColumn(text: 'Item', field: 'descricaoItem'),
    CustomDataColumn(text: 'Proprietário', field: 'nomeProprietario'),
    CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
    CustomDataColumn(text: 'Equipamento', field: 'nomeEquipamento'),
    CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
    CustomDataColumn(text: 'Tipo Processo', field: 'nomeTipoProcesso'),
    CustomDataColumn(text: 'Prioridade', field: 'prioridade'),
    CustomDataColumn(
      text: 'Qtde. Processos',
      field: 'qtdeProcessos',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
    CustomDataColumn(text: 'Prontuário', field: 'prontuarioRetirada'),
    CustomDataColumn(text: 'Origem', field: 'origem'),
    CustomDataColumn(text: 'Destino', field: 'destino'),
    CustomDataColumn(text: 'Circulante', field: 'circulante'),
    CustomDataColumn(text: 'Conf. Visual', field: 'conferidoVisualmente'),
    CustomDataColumn(
      text: 'Resp. Lib. Kit. Incompleto',
      field: 'nomeRespKitIncomp',
    ),
    CustomDataColumn(
      text: 'Resp. Lib. Quebra Fluxo',
      field: 'nomeRespQuebFluxo',
    ),
    CustomDataColumn(
      text: 'Resp. Destino Não Compatível',
      field: 'nomeRepDestinoNaoCompativel',
    ),
    CustomDataColumn(
      text: 'Indicador',
      field: 'indicador',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Biológico',
      field: 'biologico',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Implantável', field: 'implantavel'),
    CustomDataColumn(
      text: 'Lote',
      field: 'lote',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(text: 'Integrador Kit', field: 'integradorKit'),
    CustomDataColumn(text: 'Embalagem', field: 'embalagem'),
    CustomDataColumn(
      text: 'Cód. Item',
      field: 'codItem',
      type: CustomDataColumnType.Number,
    ),
    CustomDataColumn(
      text: 'Cód. Kit',
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
    CustomDataColumn(text: 'Observação', field: 'observacao'),
    CustomDataColumn(text: 'Status Kit', field: 'statusKit'),
    CustomDataColumn(text: 'Restrição Kit', field: 'restricaoKit'),
    CustomDataColumn(
      text: 'Kit Liberado Incompleto',
      field: 'kitLiberadoIncompleto',
    ),
    CustomDataColumn(
      text: 'Cód. Registro Processo',
      field: 'codRegistroProcesso',
      type: CustomDataColumnType.Number,
    ),
  ];

  late final ConsultaProcessosLeituraPageCubit bloc;
  late final KitCubit kitBloc;

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
      filter.startDate = DateTime.now().add(const Duration(days: -1));
      filter.finalDate = DateTime.now();
    }

    kitBloc = KitCubit();
    kitBloc.loadAll();
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
    return Column(
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
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: PlutoGridWidget(
                    rowColorCallback: rowColorCallback,
                    smallRows: true,
                    columns: colunas,
                    items: state.processosLeituras,
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
                          obj.codKit2,
                          obj.codRegistroProcesso,
                          obj.nroItensFaltante,
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
          child: Column(
            children: [
              DatePickerWidget(
                placeholder: 'Data Inicio',
                onDateSelected: (value) => filter.startDate = value,
                initialValue: filter.startDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DatePickerWidget(
                placeholder: 'Data Término',
                onDateSelected: (value) => filter.finalDate = value,
                initialValue: filter.finalDate,
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              BlocBuilder<KitCubit, List<KitModel>>(
                bloc: kitBloc,
                builder: (context, kits) {
                  KitModel? kit = kits
                      .where(
                        (element) => element.cod == filter.codKit,
                      )
                      .firstOrNull;
                  return DropDownSearchWidget<KitModel>(
                    textFunction: (kit) => kit.CodBarraDescritorText(),
                    initialValue: kit,
                    sourceList: kits,
                    onChanged: (value) => filter.codKit = value?.cod,
                    placeholder: 'Kit',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              DropDownSearchApiWidget<ItemModel>(
                textFunction: (item) => item.EtiquetaDescricaoText(),
                initialValue: filter.item,
                search: (str) => ItemService().Filter(
                  ItemFilter(numeroRegistros: 30, termoPesquisa: str),
                ),
                onChanged: (value) {
                  filter.item = value;
                  filter.codItem = value?.cod;
                },
                placeholder: 'Item',
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
                    textFunction: (processoEtapa) =>
                        processoEtapa.GetNomeEtapaTipoText(),
                    sourceList: processosEtapas
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) => filter.codEtapaProcesso = value?.cod,
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

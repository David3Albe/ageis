import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/frm/anormalidade_frm_page.dart';
import 'package:ageiscme_admin/app/module/pages/processo/consulta_processos_leitura/consulta_processos_leitura_page_state.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/anormalidade/consulta_anormalidade_service.dart';
import 'package:ageiscme_data/services/anormalidade_tipo/anormalidade_tipo_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_models/dto/anormalidade_tipo/short/anormalidade_tipo_short_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/anormalidade/consulta_anormalidade_filter.dart';
import 'package:ageiscme_models/query_models/anormalidade/consulta_anormalidade_model.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_selectable_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/pluto_grid_api_widget.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/componentes/toasts/error_dialog.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';
import 'package:flutter/material.dart';

class ConsultaAnormalidadePage extends StatefulWidget {
  const ConsultaAnormalidadePage({super.key, this.filter});

  final ConsultaAnormalidadeFilter? filter;

  @override
  State<ConsultaAnormalidadePage> createState() =>
      _ConsultaAnormalidadePageState();
}

class _ConsultaAnormalidadePageState extends State<ConsultaAnormalidadePage> {
  List<CustomDataColumn> _getColunas(BuildContext context) {
    return [
      CustomDataColumn(
        text: 'Data Hora',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Tipo Anormalidade',
        field: 'tipoAnormalidadeNome',
        width: 160,
      ),
      CustomDataColumn(
        text: 'Registro Processo',
        field: 'codRegistroProcesso',
        type: CustomDataColumnType.Integer,
      ),
      CustomDataColumn(
        text: 'Anormalidade',
        field: 'cod',
        type: CustomDataColumnType.Integer,
      ),
      CustomDataColumn(
        text: 'Etapa',
        field: 'etapaProcessoNome',
      ),
      CustomDataColumn(
        text: 'IDEtiqueta',
        field: 'idEtiqueta',
      ),
      CustomDataColumn(
        text: 'Item',
        field: 'nomeItem',
      ),
      CustomDataColumn(
        text: 'Responsável',
        field: 'nomeUsuario',
      ),
      CustomDataColumn(
        text: 'Anormalidade',
        field: 'observacao',
      ),
      CustomDataColumn(
        text: 'Data Liberação',
        field: 'dataHoraLiberacao',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Observação liberação',
        field: 'observacaoLiberacao',
      ),
      CustomDataColumn(
        text: 'Responsável Liberação',
        field: 'nomeUsuarioLiberacao',
      ),
    ];
  }

  late final ProcessoEtapaCubit processoEtapaBloc;
  late final ConsultaAnormalidadeFilter filter;
  final Map<int, Color> codRegistroProcessoColor = {};
  late void Function() resetarPaginacaoGrid;

  @override
  void initState() {
    if (widget.filter != null) {
      filter = widget.filter!;
    } else {
      filter = ConsultaAnormalidadeFilter();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RefreshButtonWidget(
              onPressed: () => resetarPaginacaoGrid(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
            ),
            FilterButtonWidget(
              onPressed: () => {
                openModal(context),
              },
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGridApiWidget<ConsultaAnormalidadeModel>(
              orderDescendingFieldColumn: 'dataHora',
              onDetail: (event, objeto) {
                openModalAnormalidade(
                  context,
                  objeto.cod!,
                );
              },
              fromJson: (objectsSerialized) => objectsSerialized
                  .map((e) => ConsultaAnormalidadeModel.fromJson(e)),
              resetGridPagionationBuilder:
                  (context, resetGridPaginationBuilder) =>
                      resetarPaginacaoGrid = resetGridPaginationBuilder,
              onFetch: consultarComAlgoAlteradoGrid,
              smallRows: true,
              columns: _getColunas(context),
            ),
          ),
        ),
      ],
    );
  }

  Future openModalAnormalidade(
    BuildContext context,
    int cod,
  ) async {
    late int chave;
    chave = WindowsHelper.OpenDefaultWindows(
      title: 'Cadastro/Edição Anormalidade',
      widget: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: processoEtapaBloc,
          ),
        ],
        child: AnormalidadeFrmPage(
          onCancel: () => onCancel(chave),
          onSaved: () => onSaved(chave),
          cod: cod,
        ),
      ),
    );
  }

  void onSaved(int chave) {
    WindowsHelper.RemoverWidget(chave);
    consultar();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
  }

  void onError(ConsultaProcessosLeituraPageState state) =>
      ErrorUtils.showErrorDialog(context, [state.error]);

  Future openModal(BuildContext context) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => FilterDialogWidget(
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
                    initialValue: processosEtapas
                        .where(
                          (element) => element.cod == filter.codEtapaProcesso,
                        )
                        .firstOrNull,
                    textFunction: (processoEtapa) =>
                        processoEtapa.GetNomeEtapaTipoText(),
                    sourceList: processosEtapas
                        .where((element) => element.ativo == true)
                        .toList(),
                    onChanged: (value) {
                      filter.codEtapaProcesso = value?.cod;
                    },
                    placeholder: 'Etapa do Processo',
                  );
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
              CustomAutocompleteSelectableWidget<
                  AnormalidadeTipoShortResponseDTO>(
                initialValue: filter.anormalidadeTipo,
                onSelected: (obj) {
                  filter.anormalidadeTipo = obj;
                  filter.codAnormalidadeTipo = obj?.cod;
                },
                selectedText: (item) => item.Nome(),
                label: 'Tipo de Anormalidade',
                title: (p0) => Text(p0.Nome()),
                suggestionsCallback: (str) async =>
                    (await Modular.get<AnormalidadeTipoService>().short(
                      AnormalidadeTipoShortDTO(
                        numeroRegistros: 30,
                        termoPesquisa: str,
                      ),
                    ))
                        ?.$2 ??
                    [],
              ),
            ],
          ),
        ),
      ),
    );
    if (confirm != true) return;
    consultar();
  }

  Future<PlutoGridInfiniteScrollModel?> consultarComAlgoAlteradoGrid(
    PlutoGridApiModel gridModel,
  ) async {
    filter.gridModel = gridModel;
    (String, PlutoGridInfiniteScrollModel)? response =
        await ConsultaAnormalidadeService().filter(
      filter,
    );
    return response?.$2;
  }

  void consultar() {
    resetarPaginacaoGrid();
  }
}

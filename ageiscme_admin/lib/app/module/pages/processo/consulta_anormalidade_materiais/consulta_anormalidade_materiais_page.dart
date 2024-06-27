import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/query_services/anormalidade_materiais/consulta_anormalidade_materiais_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/drop_down_search/kit_drop_down_search_dto.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/query_filters/anormalidade_materiais/consulta_anormalidade_materiais_filter.dart';
import 'package:ageiscme_models/query_models/anormalidade/consulta_anormalidade_model.dart';
import 'package:ageiscme_models/response_dto/kit/drop_down_search/kit_drop_down_search_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/campos/custom_autocomplete/custom_autocomplete_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_date_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_time_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/pluto_grid_api_widget.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:flutter/material.dart';

class ConsultaAnormalidadeMateriaisPage extends StatefulWidget {
  const ConsultaAnormalidadeMateriaisPage({
    super.key,
    this.filter,
  });

  final ConsultaAnormalidadeMateriaisFilter? filter;

  @override
  State<ConsultaAnormalidadeMateriaisPage> createState() =>
      _ConsultaAnormalidadeMateriaisPageState();
}

class _ConsultaAnormalidadeMateriaisPageState
    extends State<ConsultaAnormalidadeMateriaisPage> {
  List<CustomDataColumn> _getColunas(BuildContext context) {
    return [
      CustomDataColumn(
        text: 'Data Hora',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Cód Kit',
        field: 'codKit',
        width: 120,
      ),
      CustomDataColumn(
        text: 'Kit',
        field: 'nomeKit',
      ),
      CustomDataColumn(
        text: 'Status Kit',
        field: 'statusKit',
      ),
      CustomDataColumn(
        text: 'Cód Item',
        field: 'codItem',
        width: 120,
      ),
      CustomDataColumn(
        text: 'ID Etiqueta',
        field: 'idEtiqueta',
      ),
      CustomDataColumn(
        text: 'Item',
        field: 'nomeItem',
      ),
      CustomDataColumn(
        text: 'Status Item',
        field: 'statusItem',
      ),
      CustomDataColumn(
        text: 'Prontuário',
        field: 'prontuario',
      ),
      CustomDataColumn(
        text: 'Destino',
        field: 'destino',
      ),
      CustomDataColumn(
        text: 'Entrada Saída',
        field: 'entradaSaida',
      ),
      CustomDataColumn(
        text: 'Etapa Processo',
        field: 'etapaProcesso',
      ),
    ];
  }

  late final ConsultaAnormalidadeMateriaisFilter filter;
  late void Function() resetarPaginacaoGrid;

  @override
  void initState() {
    if (widget.filter != null) {
      filter = widget.filter!;
    } else {
      filter = ConsultaAnormalidadeMateriaisFilter();
      filter.startDate =
          DateUtils.dateOnly(DateTime.now().add(const Duration(days: -1)));
      filter.finalDate = DateUtils.dateOnly(DateTime.now());
    }
    super.initState();
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: PlutoGridApiWidget<ConsultaAnormalidadeModel>(
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
                      placeholder: 'Hora Término',
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
              CustomAutocompleteWidget<KitDropDownSearchResponseDTO>(
                initialValue: filter.codBarraKitContem,
                onChange: (str) => filter.codBarraKitContem = str,
                onItemSelectedText: (item) => item.codBarra,
                label: 'Kit',
                title: (p0) => Text(p0.CodBarraDescritorText()),
                suggestionsCallback: (str) async =>
                    (await KitService().getDropDownSearchKits(
                      KitDropDownSearchDTO(numeroRegistros: 30, search: str),
                    ))
                        ?.$2 ??
                    [],
              ),
              const Padding(padding: EdgeInsets.only(top: 2)),
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
        await ConsultaAnormalidadeMateriaisService().filter(
      filter,
    );
    return response?.$2;
  }

  void consultar() {
    resetarPaginacaoGrid();
  }
}

import 'dart:ui';

import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_column_helper.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/enums/export_type.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/enums/pluto_grid_filter_type.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/enums/pluto_grid_order_type.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/filter/pluto_grid_api_filter_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/sort/pluto_grid_api_sort_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/request/custom_infinity_scroll_rows_request.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:compartilhados/componentes/grids/state/grid_records_cubit.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/exporters/pluto_grid_csv_export.dart';
import 'package:compartilhados/exporters/pluto_grid_pdf_export.dart';
import 'package:compartilhados/exporters/pluto_grid_xml_export.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/font_awesome_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridApiCubit extends Cubit<PlutoGridApiState> {
  PlutoGridApiCubit()
      : super(
          PlutoGridApiState(
            onlyActives: false,
          ),
        );

  void setOnlyActives(bool onlyActives) {
    emit(
      PlutoGridApiState(
        onlyActives: onlyActives,
        stateManager: state.stateManager,
      ),
    );
  }

  void changeStateManager(PlutoGridStateManager stateManager) {
    emit(
      PlutoGridApiState(
        onlyActives: state.onlyActives,
        stateManager: stateManager,
      ),
    );
  }
}

class PlutoGridApiState {
  bool onlyActives;
  PlutoGridStateManager? stateManager;
  PlutoGridApiState({
    required this.onlyActives,
    this.stateManager,
  });
}

typedef RefreshWidgetBuilder = void Function(
  BuildContext context,
  void Function() refreshWidget,
);

typedef SubmitBuilder = void Function(
  BuildContext context,
  Future Function() refreshWidget,
);

typedef GetObjectByRowBuilder<T> = void Function(
  BuildContext context,
  T? Function(PlutoRow) getObjectByRowMethod,
);

typedef ResetGridPaginationBuilder<T> = void Function(
  BuildContext context,
  void Function() resetGridPaginationBuilder,
);

class PlutoGridApiWidget<T> extends StatefulWidget {
  final bool smallRows;
  final List<CustomDataColumn> columns;
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  final void Function(T objeto)? onDownload;
  final void Function(PlutoGridOnRowDoubleTapEvent event, T objeto)? onDetail;
  final Color Function(PlutoRowColorContext rowContext)? rowColorCallback;
  final void Function()? onAddClick;
  final bool filterOnlyActives;
  late final RefreshWidgetBuilder? refreshWidgetBuilder;
  late final SubmitBuilder? submitBuilder;
  late final GetObjectByRowBuilder<T>? getObjectByRowMethod;
  final Future<PlutoGridInfiniteScrollModel?> Function(
    PlutoGridApiModel filter,
  ) onFetch;
  final Iterable<T> Function(List<dynamic> objectsSerialized) fromJson;
  final Function(PlutoGridOnChangedEvent, Map<PlutoRow, T> rowsObject)?
      onChanged;
  final ResetGridPaginationBuilder? resetGridPagionationBuilder;
  final PlutoGridMode mode;
  final void Function(T)? onSelected;
  final String? orderDescendingFieldColumn;

  PlutoGridApiWidget({
    required this.columns,
    required this.onFetch,
    required this.fromJson,
    this.resetGridPagionationBuilder,
    this.smallRows = false,
    this.onDelete,
    this.onEdit,
    this.onOpen,
    this.onDownload,
    this.filterOnlyActives = false,
    this.rowColorCallback,
    this.onDetail,
    this.refreshWidgetBuilder,
    this.submitBuilder,
    this.onChanged,
    this.onAddClick,
    this.getObjectByRowMethod,
    this.mode = PlutoGridMode.normal,
    this.onSelected,
    this.orderDescendingFieldColumn,
  });

  static double getFontSize(BuildContext context, bool smallRows) {
    Size size = MediaQuery.of(context).size;
    return _getFontSize(size, smallRows);
  }

  static double _getFontSize(Size size, bool smallRows) {
    double height = size.height;
    if (smallRows) return _getSmallFontSize(height);
    if (height > 900) {
      return 12;
    }
    if (height > 750) {
      return 11;
    }
    return 10;
  }

  static double _getSmallFontSize(double height) {
    if (height > 900) {
      return 12;
    }
    if (height > 750) {
      return 11;
    }
    return 10;
  }

  @override
  State<PlutoGridApiWidget<T>> createState() => _PlutoGridApiWidgetState<T>();
}

class _PlutoGridApiWidgetState<T> extends State<PlutoGridApiWidget<T>> {
  Color get headerColor => const Color(0xffE0E0E0);
  late final List<MapEntry<T, Map<CustomDataColumn, dynamic>>> cellsObject;
  late final List<Widget> widgetsShow;
  final List<PlutoRow> rowsRemoved = [];
  final Map<PlutoRow, T> rowsObject = Map<PlutoRow, T>();
  final PlutoGridApiCubit gridCubit = PlutoGridApiCubit();
  final List<void Function()> listeners = [];
  int page = 1;
  final GridRecordsCubit gridRecordsCubit = GridRecordsCubit();

  List<MapEntry<T, Map<CustomDataColumn, dynamic>>> getCellObjects(
    List<T> itemsSorted,
  ) {
    List<MapEntry<T, Map<CustomDataColumn, dynamic>>> rows = [];
    for (T obj in itemsSorted) {
      dynamic objJson = (obj as dynamic).toJson();

      Map<CustomDataColumn, dynamic> columnsEntrys = {};
      for (CustomDataColumn column in widget.columns) {
        dynamic columnContent = CustomDataRows.getCellContentValue(
          column,
          objJson,
        );
        final entry = MapEntry<CustomDataColumn, dynamic>(
          column,
          columnContent,
        );
        columnsEntrys.addEntries([entry]);
      }
      MapEntry<T, Map<CustomDataColumn, dynamic>> mapEntry =
          MapEntry<T, Map<CustomDataColumn, dynamic>>(obj, columnsEntrys);

      rows.add(mapEntry);
    }
    return rows;
  }

  void resetarGrid() {
    page = 1;
    PlutoGridStateManager? stateManager = gridCubit.state.stateManager;
    stateManager?.refRows.clear();
    stateManager?.removeAllRows(notify: false);
    rowsObject.clear();
    final request = PlutoInfinityScrollRowsRequest(
      lastRow: null,
      sortColumn: stateManager!.getSortedColumn,
      filterRows: stateManager.filterRows,
    );
    stateManager.setShowLoading(true);
    fetch(request).then((value) {
      stateManager.appendRows(value.rows);
      stateManager.setShowLoading(false);
    });
  }

  void refreshWidget(PlutoGridStateManager? stateManager) {
    List<PlutoRow> newRows = _getRows(cellsObject);
    stateManager?.removeAllRows();
    stateManager?.appendRows(newRows);
    gridCubit.setOnlyActives(widget.filterOnlyActives);
    PlutoColumn? column = stateManager?.getSortedColumn;
    if (column == null) return;
    if (column.sort.isAscending) stateManager!.sortAscending(column);
    if (column.sort.isDescending) stateManager!.sortDescending(column);
  }

  Future submitMethod(
    PlutoGridStateManager? stateManager,
  ) async {
    if (stateManager?.isEditing == true) stateManager?.toggleEditing();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  T? getObjectByRow(
    PlutoRow? row,
  ) {
    return rowsObject[row];
  }

  double getRowsSize(Size size) {
    double height = size.height;
    if (widget.smallRows) return getSmallRowsSize(height);
    if (height > 900) {
      return 45;
    }
    if (height > 750) {
      return 41;
    }
    if (height > 600) {
      return 36;
    }
    return 31;
  }

  double getSmallRowsSize(double height) {
    if (height > 900) {
      return 25;
    }
    if (height > 750) {
      return 23;
    }
    if (height > 600) {
      return 21;
    }
    return 19;
  }

  void onSelectedBase(PlutoGridOnSelectedEvent event) {
    if (widget.onSelected == null) return;
    T obj = rowsObject[event.row]!;
    widget.onSelected!(obj);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = PlutoGridApiWidget._getFontSize(size, widget.smallRows);
    double rowsSize = getRowsSize(size);
    return Material(
      key: GlobalKey(),
      child: BlocBuilder<PlutoGridApiCubit, PlutoGridApiState>(
        bloc: gridCubit,
        builder: (context, gridState) {
          widget.resetGridPagionationBuilder?.call(
            context,
            resetarGrid,
          );
          widget.refreshWidgetBuilder?.call(
            context,
            () => refreshWidget(gridState.stateManager),
          );
          widget.submitBuilder?.call(
            context,
            () => submitMethod(gridState.stateManager),
          );
          widget.getObjectByRowMethod?.call(
            context,
            getObjectByRow,
          );
          return ContextMenuOverlay(
            buttonStyle: const ContextMenuButtonStyle(
              textStyle: TextStyle(fontSize: 12),
            ),
            child: ContextMenuRegion(
              contextMenu: GenericContextMenu(
                buttonStyle: const ContextMenuButtonStyle(
                  textStyle: TextStyle(
                    fontSize: 14,
                  ),
                ),
                buttonConfigs: [
                  ContextMenuButtonConfig(
                    'Mostrar/Ocultar Filtros',
                    icon: const FaIcon(FontAwesomeIcons.filter),
                    onPressed: mostrarOcultarFiltros,
                  ),
                  ContextMenuButtonConfig(
                    'XML',
                    icon: const FaIcon(FontAwesomeIcons.file),
                    onPressed: () => export(
                      context: context,
                      gridState: gridState,
                      exportType: ExportType.xml,
                    ),
                  ),
                  ContextMenuButtonConfig(
                    'CSV',
                    icon: const FaIcon(FontAwesomeIcons.fileCsv),
                    onPressed: () => export(
                      context: context,
                      gridState: gridState,
                      exportType: ExportType.csv,
                    ),
                  ),
                  ContextMenuButtonConfig(
                    'PDF',
                    icon: const FaIcon(FontAwesomeIcons.filePdf),
                    onPressed: () => export(
                      context: context,
                      gridState: gridState,
                      exportType: ExportType.pdf,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PlutoGrid(
                      createFooter: (stateManager) => PlutoInfinityScrollRows(
                        initialFetch: true,
                        fetchWithSorting: true,
                        fetchWithFiltering: true,
                        fetch: fetch,
                        stateManager: stateManager,
                      ),
                      onSelected: onSelectedBase,
                      mode: widget.mode,
                      onRowDoubleTap: (event) {
                        T objeto = rowsObject[event.row]!;
                        if (widget.onDetail != null) {
                          widget.onDetail!(event, objeto);
                        }
                      },
                      onChanged: widget.onChanged != null
                          ? (event) => widget.onChanged!(event, rowsObject)
                          : null,
                      rowColorCallback: widget.rowColorCallback,
                      columns: _getColumns(
                          fontSize, context, gridState.stateManager),
                      noRowsWidget: const Center(child: Text('Sem registros')),
                      configuration: PlutoGridConfiguration(
                        scrollbar: PlutoGridScrollbarConfig(
                          scrollbarThickness: 10,
                          dragDevices: [
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                            PointerDeviceKind.trackpad,
                          ].toSet(),
                        ),
                        localeText:
                            const PlutoGridLocaleText.brazilianPortuguese(),
                        style: PlutoGridStyleConfig(
                          cellTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                          ),
                          columnTextStyle: TextStyle(fontSize: fontSize),
                          rowHeight: rowsSize,
                          rowColor: const Color(0xffF4F4F4),
                        ),
                      ),
                      rows: [],
                      onLoaded: (event) {
                        if (widget.orderDescendingFieldColumn != null) {
                          event.stateManager.sortDescending(event
                              .stateManager.columns
                              .where((element) =>
                                  element.field ==
                                  widget.orderDescendingFieldColumn)
                              .first);
                        }
                        event.stateManager.setShowColumnFilter(true);
                        event.stateManager.addListener(() {
                          gridCubit.changeStateManager(event.stateManager);
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 25,
                            maxHeight: 50,
                          ),
                          height: size.height < 700 ? 25 : 30,
                          color: Colors.grey.shade300,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: BlocBuilder<GridRecordsCubit,
                                      GridRecordsState>(
                                  bloc: gridRecordsCubit,
                                  builder: (context, state) {
                                    return Text(
                                      'Registros: ${state.records}',
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void mostrarOcultarFiltros() {
    gridCubit.state.stateManager?.setShowColumnFilter(
      !(gridCubit.state.stateManager?.showColumnFilter ?? false),
    );
  }

  PlutoGridFilterType? getFilterType(String filter) {
    if (filter == 'Contenha') {
      return PlutoGridFilterType.Contains;
    } else if (filter == 'Igual') {
      return PlutoGridFilterType.Equals;
    } else if (filter == 'Inicia com') {
      return PlutoGridFilterType.StartsWith;
    } else if (filter == 'Termina com') {
      return PlutoGridFilterType.EndsWith;
    } else if (filter == 'Maior que') {
      return PlutoGridFilterType.GreaterThan;
    } else if (filter == 'Maior ou igual que') {
      return PlutoGridFilterType.GreaterThanOrEquals;
    } else if (filter == 'Menor que') {
      return PlutoGridFilterType.LessThan;
    } else if (filter == 'Menor ou igual que') {
      return PlutoGridFilterType.LessThanOrEquals;
    }
    ToastUtils.showCustomToastWarning(context,
        'Filtro $filter não está definido para ser filtrado, verifique o tipo digitado e tente novamnte, será ignorado nessa consulta');
    return null;
  }

  PlutoGridOrderType? getOrderType(String order) {
    if (order == 'ascending') {
      return PlutoGridOrderType.Ascending;
    } else if (order == 'descending') {
      return PlutoGridOrderType.Descending;
    }
    ToastUtils.showCustomToastWarning(
      context,
      'ordem $order não está definido para ser filtrado, verifique o tipo ordenado e tente novamnte, será ignorado nessa consulta',
    );
    return null;
  }

  bool ended = false;
  Future<PlutoInfinityScrollRowsResponse> fetch(
    PlutoInfinityScrollRowsRequest request,
  ) async {
    List<PlutoGridApiFilterModel> filters = [];
    if (request.lastRow == null) {
      page = 1;
      rowsObject.clear();
      ended = false;
    }
    if (ended) {
      return PlutoInfinityScrollRowsResponse(
        isLast: false,
        rows: [],
      );
    }

    if (request.filterRows.isNotEmpty) {
      final filterMap = FilterHelper.convertRowsToMap(request.filterRows);
      for (final filter in filterMap.entries) {
        for (final type in filter.value) {
          final filterType = type.entries.first;
          PlutoGridFilterType? typeFilter = getFilterType(filterType.key);
          if (typeFilter == null) continue;
          filters.add(
            PlutoGridApiFilterModel(
              field: filter.key,
              type: typeFilter,
              value: filterType.value,
            ),
          );
        }
      }
    }

    PlutoGridApiSortModel? sort;
    if (request.sortColumn != null && !request.sortColumn!.sort.isNone) {
      PlutoGridOrderType? orderType =
          getOrderType(request.sortColumn!.sort.name);
      if (orderType != null) {
        sort = PlutoGridApiSortModel(
          field: request.sortColumn!.field,
          name: orderType,
        );
      }
    }
    bool loadRemaining = false;
    if (request is CustomPlutoInfinityScrollRowsRequest) {
      loadRemaining = request.loadRemaining;
    }
    PlutoGridApiModel gridModel = PlutoGridApiModel(
      filters: filters,
      page: page,
      sort: sort,
      loadRemaining: loadRemaining,
    );

    final PlutoGridInfiniteScrollModel? rows = await widget.onFetch(gridModel);
    if (rows == null) {
      ToastUtils.showCustomToastError(context, 'Falha ao carregar mais linhas');
      return PlutoInfinityScrollRowsResponse(
        isLast: false,
        rows: [],
      );
    }
    List<T> items = widget.fromJson(rows.data).toList();
    List<MapEntry<T, Map<CustomDataColumn, dynamic>>> objects =
        getCellObjects(items);
    List<PlutoRow> newRows = _getRows(objects);

    final bool isLast = rows.lastRow;
    gridRecordsCubit.setRecords(rows.records);

    page++;
    if (loadRemaining) {
      ended = true;
    }
    if (ended) {
      page--;
    }
    if (!ended && isLast && rows.records > 0) {
      ended = true;
      BuildContext? context = ToastUtils.routerOutletContext;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Última linha encontrada!')),
        );
      }
    }

    return PlutoInfinityScrollRowsResponse(
      isLast: false,
      rows: newRows,
    );
  }

  void exportXml({
    required BuildContext context,
    required PlutoGridApiState gridState,
  }) {
    List<String> columnsToIgnore = widget.columns
        .where((element) => element.actionColumn == true)
        .map((e) => e.field)
        .toList();
    columnsToIgnore.add('');
    PlutoGridXmlExport xmlExport = PlutoGridXmlExport(
      context: context,
      stateManager: gridState.stateManager!,
      columnsToIgnore: columnsToIgnore,
    );
    xmlExport.export();
  }

  void exportCSV({
    required BuildContext context,
    required PlutoGridApiState gridState,
  }) {
    PlutoGridCsvExport csvExport = PlutoGridCsvExport(
      context: context,
      stateManager: gridState.stateManager!,
    );
    csvExport.export();
  }

  Future exportPDF({
    required BuildContext context,
    required PlutoGridApiState gridState,
  }) async {
    PlutoGridPdfExport pdfExport = PlutoGridPdfExport(
      context: context,
      stateManager: gridState.stateManager!,
    );
    await pdfExport.export();
  }

  Future export({
    required BuildContext context,
    required PlutoGridApiState gridState,
    required ExportType exportType,
  }) async {
    if (gridRecordsCubit.state.records > 1000 && exportType == ExportType.pdf) {
      ToastUtils.showCustomToastNotice(
        context,
        'Não é possível realizar a exportação de dados que contém mais de 1000 linhas para um PDF, faça alguns filtros para reduzir a busca e tente novamente',
      );
      return;
    }
    if (gridRecordsCubit.state.records > 1000000) {
      ToastUtils.showCustomToastNotice(
        context,
        'Não é possível realizar a exportação de dados que contém mais de 1M linhas, faça alguns filtros para reduzir a busca e tente novamente',
      );
      return;
    }

    gridState.stateManager!.setShowLoading(true);
    final request = CustomPlutoInfinityScrollRowsRequest(
      lastRow: gridState.stateManager!.refRows.last,
      sortColumn: gridState.stateManager!.getSortedColumn,
      filterRows: gridState.stateManager!.filterRows,
      loadRemaining: true,
    );
    PlutoInfinityScrollRowsResponse value = await fetch(request);
    gridState.stateManager!.appendRows(value.rows);

    switch (exportType) {
      case ExportType.csv:
        exportCSV(context: context, gridState: gridState);
        break;
      case ExportType.pdf:
        await exportPDF(context: context, gridState: gridState);
        break;
      case ExportType.xml:
        exportXml(context: context, gridState: gridState);
        break;
    }
    gridState.stateManager!.setShowLoading(false);
  }

  List<PlutoColumn> _getColumns(
    double fontSize,
    BuildContext? context,
    PlutoGridStateManager? stateManager,
  ) {
    List<PlutoColumn> colunas = [];
    PlutoGridColumnHelper columnHelper = PlutoGridColumnHelper<T>(
      onDelete: widget.onDelete,
      onEdit: widget.onEdit,
      onOpen: widget.onOpen,
      onDownload: widget.onDownload,
      rowsObject: rowsObject,
    );
    _addActionColumns(colunas, columnHelper, fontSize);
    listeners.clear();
    for (CustomDataColumn column in widget.columns) {
      colunas.add(
        columnHelper.GetColumnByCustomDataColumnType(
          fontSize: fontSize,
          column,
          listeners: listeners,
        ),
      );
    }
    return colunas;
  }

  void _addActionColumns(
    List<PlutoColumn> colunas,
    PlutoGridColumnHelper columnHelper,
    double fontSize,
  ) {
    if (widget.onEdit == null &&
        widget.onDelete == null &&
        widget.onOpen == null &&
        widget.onDownload == null) return;
    CustomDataColumn? actionColumn =
        CustomDataColumn(text: '', actionColumn: true, field: '');
    colunas.add(
      columnHelper.GetColumnByCustomDataColumnType(
        actionColumn,
        fontSize: fontSize,
      ),
    );
  }

  List<PlutoRow> _getRows(
    List<MapEntry<T, Map<CustomDataColumn, dynamic>>> rowsBase,
  ) {
    List<PlutoRow> rows = [];
    for (MapEntry<T, Map<CustomDataColumn, dynamic>> rowBase in rowsBase) {
      Map<String, PlutoCell> cells = {};
      addActionCell(cells);
      for (MapEntry<CustomDataColumn, dynamic> cell in rowBase.value.entries) {
        cells.addEntries(
          [
            MapEntry<String, PlutoCell>(
              cell.key.calculatedField ?? cell.key.field,
              PlutoCell(value: cell.value),
            ),
          ],
        );
      }
      PlutoRow row = PlutoRow(cells: cells);
      rows.add(row);
      rowsObject.addEntries(
        [
          MapEntry<PlutoRow, T>(row, rowBase.key),
        ],
      );
    }
    return rows;
  }

  void addActionCell(Map<String, PlutoCell> cells) {
    if (widget.onDelete == null &&
        widget.onEdit == null &&
        widget.onOpen == null &&
        widget.onDownload == null) return;
    cells.addEntries([
      MapEntry<String, PlutoCell>(
        '',
        PlutoCell(),
      ),
    ]);
  }
}

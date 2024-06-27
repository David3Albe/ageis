import 'dart:ui';

import 'package:compartilhados/componentes/botoes/rows_add_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_column_helper.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:compartilhados/exporters/pluto_grid_csv_export.dart';
import 'package:compartilhados/exporters/pluto_grid_pdf_export.dart';
import 'package:compartilhados/exporters/pluto_grid_xml_export.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/font_awesome_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridCubit extends Cubit<PlutoGridState> {
  PlutoGridCubit()
      : super(
          PlutoGridState(
            onlyActives: false,
          ),
        );

  void setOnlyActives(bool onlyActives) {
    emit(
      PlutoGridState(
        onlyActives: onlyActives,
        stateManager: state.stateManager,
      ),
    );
  }

  void changeStateManager(PlutoGridStateManager stateManager) {
    emit(
      PlutoGridState(
        onlyActives: state.onlyActives,
        stateManager: stateManager,
      ),
    );
  }
}

class PlutoGridState {
  bool onlyActives;
  PlutoGridStateManager? stateManager;
  PlutoGridState({
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

class PlutoGridWidget<T> extends StatelessWidget {
  Color get headerColor => const Color(0xffE0E0E0);
  final List<T> items;
  final bool smallRows;
  final List<CustomDataColumn> columns;
  late final List<MapEntry<T, Map<CustomDataColumn, dynamic>>> cellsObject;
  late final List<Widget> widgetsShow;
  late final List<PlutoRow> rows;
  final List<PlutoRow> rowsRemoved = [];
  final Map<PlutoRow, T> rowsObject = Map<PlutoRow, T>();
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  // final void Function(T objeto)? onDetail;
  final void Function(T objeto)? onDownload;
  final void Function(PlutoGridOnRowDoubleTapEvent event, T objeto)? onDetail;
  final Color Function(PlutoRowColorContext rowContext)? rowColorCallback;
  final void Function()? onAddClick;
  late final PlutoGridCubit gridCubit;
  final bool filterOnlyActives;
  late final RefreshWidgetBuilder? refreshWidgetBuilder;
  late final SubmitBuilder? submitBuilder;
  late final GetObjectByRowBuilder<T>? getObjectByRowMethod;
  final Function(PlutoGridOnChangedEvent, Map<PlutoRow, T> rowsObject)?
      onChanged;
  final List<void Function()> listeners = [];
  final PlutoGridMode mode;
  final void Function(T)? onSelected;
  final bool showFilters;
  final String? orderDescendingFieldColumn;
  final String? orderAscendingFieldColumn;
  PlutoGridWidget({
    required this.items,
    required this.columns,
    this.smallRows = false,
    this.showFilters = true,
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
    this.orderAscendingFieldColumn,
  }) {
    cellsObject = getCellObjects(items);
    this.rows = _getRows(cellsObject);
    this.gridCubit = PlutoGridCubit();
    this.gridCubit.setOnlyActives(this.filterOnlyActives);
  }

  List<MapEntry<T, Map<CustomDataColumn, dynamic>>> getCellObjects(
    List<T> itemsSorted,
  ) {
    List<MapEntry<T, Map<CustomDataColumn, dynamic>>> rows = [];
    for (T obj in itemsSorted) {
      dynamic objJson = (obj as dynamic).toJson();

      Map<CustomDataColumn, dynamic> columnsEntrys = {};
      for (CustomDataColumn column in this.columns) {
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

  void refreshWidget(PlutoGridStateManager? stateManager) {
    List<PlutoRow> newRows = _getRows(cellsObject);
    stateManager?.removeAllRows();
    stateManager?.appendRows(newRows);
    this.gridCubit.setOnlyActives(this.filterOnlyActives);
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

  double getRowsSize(Size size) {
    double height = size.height;
    if (smallRows) return getSmallRowsSize(height);
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
    if (onSelected == null) return;
    T obj = rowsObject[event.row]!;
    this.onSelected!(obj);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = _getFontSize(size, smallRows);
    double rowsSize = getRowsSize(size);
    return Material(
      key: GlobalKey(),
      child: BlocBuilder<PlutoGridCubit, PlutoGridState>(
        bloc: this.gridCubit,
        builder: (context, gridState) {
          refreshWidgetBuilder?.call(
            context,
            () => refreshWidget(gridState.stateManager),
          );
          submitBuilder?.call(
            context,
            () => submitMethod(gridState.stateManager),
          );
          getObjectByRowMethod?.call(
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
                    onPressed: () => exportXml(
                      context: context,
                      gridState: gridState,
                    ),
                  ),
                  ContextMenuButtonConfig(
                    'CSV',
                    icon: const FaIcon(FontAwesomeIcons.fileCsv),
                    onPressed: () => exportCSV(
                      context: context,
                      gridState: gridState,
                    ),
                  ),
                  ContextMenuButtonConfig(
                    'PDF',
                    icon: const FaIcon(FontAwesomeIcons.filePdf),
                    onPressed: () => exportPDF(
                      context: context,
                      gridState: gridState,
                    ),
                  ),
                ],
              ),
              child: PlutoGrid(
                onSelected: onSelectedBase,
                mode: mode,
                onRowDoubleTap: (event) {
                  T objeto = rowsObject[event.row]!;
                  if (onDetail != null) {
                    onDetail!(event, objeto);
                  }
                },
                onChanged: onChanged != null
                    ? (event) => onChanged!(event, rowsObject)
                    : null,
                rowColorCallback: rowColorCallback,
                columns: _getColumns(fontSize, context, gridState.stateManager),
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
                  localeText: const PlutoGridLocaleText.brazilianPortuguese(),
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
                rows: this.rows,
                onLoaded: (event) {
                  if (orderDescendingFieldColumn != null) {
                    event.stateManager.sortDescending(event.stateManager.columns
                        .where((element) =>
                            element.field == orderDescendingFieldColumn)
                        .first);
                  }
                  if (orderAscendingFieldColumn != null) {
                    event.stateManager.sortAscending(event.stateManager.columns
                        .where((element) =>
                            element.field == orderAscendingFieldColumn)
                        .first);
                  }
                  if (showFilters) event.stateManager.setShowColumnFilter(true);
                  this.setRows(
                    this.filterOnlyActives,
                    event.stateManager,
                  );
                  event.stateManager.addListener(() {
                    gridCubit.changeStateManager(event.stateManager);
                  });
                },
                createFooter: (PlutoGridStateManager state) => _getFooter(
                  state,
                  filterOnlyActives,
                  gridState.onlyActives,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void exportXml({
    required BuildContext context,
    required PlutoGridState gridState,
  }) {
    List<String> columnsToIgnore = columns
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
    required PlutoGridState gridState,
  }) {
    PlutoGridCsvExport csvExport = PlutoGridCsvExport(
      context: context,
      stateManager: gridState.stateManager!,
    );
    csvExport.export();
  }

  void exportPDF({
    required BuildContext context,
    required PlutoGridState gridState,
  }) {
    PlutoGridPdfExport pdfExport = PlutoGridPdfExport(
      context: context,
      stateManager: gridState.stateManager!,
    );
    pdfExport.export();
  }

  void mostrarOcultarFiltros() {
    gridCubit.state.stateManager?.setShowColumnFilter(
      !(gridCubit.state.stateManager?.showColumnFilter ?? false),
    );
  }

  void setRows(
    bool onlyActives,
    PlutoGridStateManager state,
  ) {
    if (!onlyActives) {
      state.appendRows(rowsRemoved);
      gridCubit.changeStateManager(state);
      return;
    }
    List<PlutoRow> rowsFiltered = this
        .rows
        .where((row) => (rowsObject[row] as dynamic).ativo == false)
        .toList();
    rowsRemoved.clear();
    rowsRemoved.addAll(rowsFiltered);
    state.removeRows(rowsFiltered);
    gridCubit.changeStateManager(state);
  }

  Widget _getFilterActiveOnly(
    PlutoGridStateManager state,
    bool hasFilterActiveOnly,
    bool onlyActives,
  ) {
    if (!hasFilterActiveOnly) return const SizedBox();
    return CustomCheckboxWidget(
      checked: onlyActives,
      text: 'Ativos Apenas',
      onClick: (bool? checked) {
        setRows(checked!, state);
      },
    );
  }

  Widget _getButtonRowAdd(
    PlutoGridStateManager state,
  ) {
    if (onAddClick == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: RowsAddButtonWidget(onPressed: onAddClick),
    );
  }

  Widget _getFooter(
    PlutoGridStateManager stateManager,
    bool hasFilterActivesOnly,
    bool onlyActives,
  ) {
    return BlocBuilder<PlutoGridCubit, PlutoGridState>(
      bloc: gridCubit,
      builder: (context, state) {
        int rowsLength = stateManager.rows.length;
        return Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
            top: 2.0,
            bottom: 2.0,
            right: 4.0,
          ),
          child: Row(
            children: [
              Text(
                '${rowsLength.toString()} Registro${rowsLength > 1 ? 's' : ''}',
              ),
              const Spacer(),
              _getButtonRowAdd(stateManager),
              _getFilterActiveOnly(
                stateManager,
                hasFilterActivesOnly,
                onlyActives,
              ),
            ],
          ),
        );
      },
    );
  }

  List<PlutoColumn> _getColumns(
    double fontSize,
    BuildContext? context,
    PlutoGridStateManager? stateManager,
  ) {
    List<PlutoColumn> colunas = [];
    PlutoGridColumnHelper columnHelper = PlutoGridColumnHelper<T>(
      onDelete: onDelete,
      onEdit: onEdit,
      onOpen: onOpen,
      onDownload: onDownload,
      rowsObject: rowsObject,
    );
    _addActionColumns(colunas, columnHelper, fontSize);
    listeners.clear();
    for (CustomDataColumn column in columns) {
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
    if (onEdit == null &&
        onDelete == null &&
        onOpen == null &&
        onDownload == null) return;
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
    rowsObject.clear();
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
    if (onDelete == null &&
        onEdit == null &&
        onOpen == null &&
        onDownload == null) return;
    cells.addEntries([
      MapEntry<String, PlutoCell>(
        '',
        PlutoCell(),
      ),
    ]);
  }
}

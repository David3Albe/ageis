import 'package:pluto_grid/pluto_grid.dart';

abstract class CustomAbstractTextExport<T> {
  const CustomAbstractTextExport();

  T export(PlutoGridStateManager state);

  Map<PlutoColumn, String> getColumnTitles(PlutoGridStateManager state) {
    Iterable<PlutoColumn> columns = visibleColumns(state);
    Map<PlutoColumn, String> map = {};
    for (PlutoColumn column in columns) {
      String title = column.title;
      map.addAll({column: title});
    }
    return map;
  }

  List<Map<PlutoCell?, String?>> mapStateToListOfRows(
    PlutoGridStateManager state,
  ) {
    List<Map<PlutoCell?, String?>> outputRows = [];

    List<PlutoRow> rowsToExport;

    rowsToExport = state.refRows.filteredList.isNotEmpty
        ? state.refRows.filteredList
        : state.iterateRowAndGroup.toList();

    for (var plutoRow in rowsToExport) {
      outputRows.add(
        mapPlutoRowToList(
          state,
          plutoRow
        ),
      );
    }

    return outputRows;
  }

  Map<PlutoCell?, String?> mapPlutoRowToList(
    PlutoGridStateManager state,
    PlutoRow plutoRow, {
    List<String>? columnsToIgnore,
  }) {
    Map<PlutoCell?, String?> serializedRow = {};

    for (PlutoColumn column in visibleColumns(state)) {
      dynamic value = plutoRow.cells[column.field]?.value;
      if (value is bool) {
        serializedRow.addAll(
            {plutoRow.cells[column.field]: value == true ? 'Sim' : 'Não'});
        continue;
      }
      String str = column.formattedValueForDisplay(value);
      if (str == 'null') {
        serializedRow.addAll({plutoRow.cells[column.field]: ''});
        continue;
      }
      serializedRow.addAll({plutoRow.cells[column.field]: str});
    }

    return serializedRow;
  }

  List<PlutoColumn> visibleColumns(PlutoGridStateManager state) => state.columns
      .where((element) => !element.hide && element.title != '')
      .toList();
}

import 'package:pluto_grid/pluto_grid.dart';

abstract class CustomAbstractTextExport<T> {
  const CustomAbstractTextExport();

  T export(PlutoGridStateManager state);

  List<String> getColumnTitles(PlutoGridStateManager state) =>
      visibleColumns(state).map((e) => e.title).toList();

  List<List<String?>> mapStateToListOfRows(PlutoGridStateManager state) {
    List<List<String?>> outputRows = [];

    List<PlutoRow> rowsToExport;

    rowsToExport = state.refRows.filteredList.isNotEmpty
        ? state.refRows.filteredList
        : state.refRows.originalList;

    for (var plutoRow in rowsToExport) {
      outputRows.add(mapPlutoRowToList(state, plutoRow));
    }

    return outputRows;
  }

  List<String?> mapPlutoRowToList(
    PlutoGridStateManager state,
    PlutoRow plutoRow,
  ) {
    List<String?> serializedRow = [];

    for (PlutoColumn column in visibleColumns(state)) {
      dynamic value = plutoRow.cells[column.field]?.value;
      if (value is bool) {
        serializedRow.add(value == true ? 'Sim' : 'Não');
        continue;
      }
      String str = column.formattedValueForDisplay(value);
      if (str == 'null') continue;
      serializedRow.add(str);
    }

    return serializedRow;
  }

  List<PlutoColumn> visibleColumns(PlutoGridStateManager state) => state.columns
      .where((element) => !element.hide && element.title != '')
      .toList();
}

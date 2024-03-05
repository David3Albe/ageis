import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:dependencias_comuns/main.dart';

class PlutoGridRowHelper<T> {
  PlutoGridRowHelper({
    required this.columns,
    required this.rowsObject,
  });
  final List<CustomDataColumn> columns;
  Map<PlutoRow, T> rowsObject;

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

  Map<PlutoRow, T> GetRowsObject() => this.rowsObject;

  List<PlutoRow> GetRows(
    List<MapEntry<T, Map<CustomDataColumn, dynamic>>> rowsBase,
  ) {
    List<PlutoRow> rows = [];
    this.rowsObject = Map<PlutoRow, T>();
    for (MapEntry<T, Map<CustomDataColumn, dynamic>> rowBase in rowsBase) {
      Map<String, PlutoCell> cells = {};
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
}

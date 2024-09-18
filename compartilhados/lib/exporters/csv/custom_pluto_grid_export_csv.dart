import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/exporters/csv/custom_pluto_grid_default_csv_export.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGridExportCsv {
  static String exportCSV(
    PlutoGridStateManager state, {
    required List<CustomDataColumn> columns,
    String? fieldDelimiter,
    String? textDelimiter,
    String? textEndDelimiter,
    String? eol,
  }) {
    var plutoGridCsvExport = CustomPlutoGridDefaultCsvExport(
      columns: columns,
      fieldDelimiter: fieldDelimiter,
      textDelimiter: textDelimiter,
      textEndDelimiter: textEndDelimiter,
      eol: eol,
    );

    return plutoGridCsvExport.export(state);
  }
}

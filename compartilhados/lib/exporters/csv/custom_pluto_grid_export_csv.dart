import 'package:compartilhados/exporters/csv/custom_pluto_grid_default_csv_export.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGridExportCsv {
  static String exportCSV(
    PlutoGridStateManager state, {
    String? fieldDelimiter,
    String? textDelimiter,
    String? textEndDelimiter,
    String? eol,
  }) {
    var plutoGridCsvExport = CustomPlutoGridDefaultCsvExport(
      fieldDelimiter: fieldDelimiter,
      textDelimiter: textDelimiter,
      textEndDelimiter: textEndDelimiter,
      eol: eol,
    );

    return plutoGridCsvExport.export(state);
  }
}

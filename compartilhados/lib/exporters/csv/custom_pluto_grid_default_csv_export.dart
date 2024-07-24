import 'package:compartilhados/exporters/custom_abstract_text_export.dart';
import 'package:csv/csv.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGridDefaultCsvExport extends CustomAbstractTextExport<String> {
  const CustomPlutoGridDefaultCsvExport({
    this.fieldDelimiter,
    this.textDelimiter,
    this.textEndDelimiter,
    this.eol,
  }) : super();

  final String? fieldDelimiter;
  final String? textDelimiter;
  final String? textEndDelimiter;
  final String? eol;

  @override
  String export(PlutoGridStateManager state) {
    String toCsv = const ListToCsvConverter().convert(
      [
        getColumnTitles(state).values.toList(),
        ...mapStateToListOfRows(state)
            .map((e) => e.values.map((k) => k?.toString()).toList())
            .toList(),
      ],
      fieldDelimiter: fieldDelimiter,
      textDelimiter: textDelimiter,
      textEndDelimiter: textEndDelimiter,
      delimitAllFields: true,
      eol: eol,
    );

    return toCsv;
  }
}

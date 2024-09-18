import 'dart:typed_data';

import 'package:compartilhados/exporters/pdf/generic_pdf_controller.dart';
import 'package:compartilhados/exporters/custom_abstract_text_export.dart'
    as custom_abstract;
import 'package:dependencias_comuns/pluto_grid_data_export.dart' as pluto;
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGridDefaultPdfExport
    extends custom_abstract.CustomAbstractTextExport {
  CustomPlutoGridDefaultPdfExport({
    required this.title,
    this.creator,
    this.format,
    this.themeData,
    this.logoEsquerda,
    this.logoDireita,
    this.colorByData,
    this.fontsFallback = const [],
    this.colorByColumn,
    this.getHeaderWidgetByColumn,
    this.margin,
    final String Function(PlutoColumn)? customTitleByColumn,
    this.columnsToIgnore,
    this.customRow,
    this.getWidthByColumn,
  }) : super();

  final String title;
  final String? creator;
  pluto.PdfPageFormat? format;
  pluto.ThemeData? themeData;
  pluto.Widget? logoEsquerda;
  pluto.Widget? logoDireita;
  final pluto.PdfColor? Function(dynamic data)? colorByData;
  final pluto.PdfColor? Function(PlutoColumn data)? colorByColumn;
  final List<pluto.Font> fontsFallback;
  final pluto.EdgeInsets? margin;
  final pluto.Widget? Function(PlutoColumn, pluto.TextStyle?)?
      getHeaderWidgetByColumn;
  final List<String>? columnsToIgnore;
  final List<pluto.Widget>? Function(Map<PlutoCell?, dynamic>)? customRow;
  final double? Function(PlutoColumn)? getWidthByColumn;

  @override
  Future<Uint8List> export(PlutoGridStateManager state) async {
    return GenericPdfController(
      getHeaderWidgetByColumn: getHeaderWidgetByColumn,
      margin: margin,
      fontsFallback: fontsFallback,
      title: title,
      colorByData: colorByData,
      colorByColumn: colorByColumn,
      logoEsquerda: logoEsquerda,
      logoDireita: logoDireita,
      creator: creator ?? 'https://pub.dev/packages/pluto_grid',
      format: format ?? pluto.PdfPageFormat.a4.landscape,
      columns: getColumnTitles(state),
      rows: mapStateToListOfRows(state, false).take(500).toList(),
      themeData: themeData,
      customRow: customRow,
      columnsToIgnore: columnsToIgnore,
      getWidthByColumn: getWidthByColumn,
    ).generatePdf();
  }

  String getFilename() {
    return 'Consulta.pdf';
  }
}

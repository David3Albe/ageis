import 'dart:typed_data';

import 'package:compartilhados/exporters/pdf/custom_table_from_text_array.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:dependencias_comuns/pluto_grid_data_export.dart';
import 'package:flutter/services.dart';

class GenericPdfController extends PdfController {
  static const PdfColor borderColor = PdfColors.black;
  static const PdfColor headerBackground = PdfColors.teal100;
  static const PdfColor oddRowColor = PdfColors.grey100;
  static const PdfColor baseTextColor = PdfColors.black;
  static const PdfColor baseCellColor = PdfColors.white;

  GenericPdfController({
    required this.title,
    required this.creator,
    required this.format,
    required this.columns,
    required this.rows,
    this.colorByColumn,
    this.getHeaderWidgetByColumn,
    this.margin,
    this.groups,
    this.themeData,
    this.logoEsquerda,
    this.logoDireita,
    this.colorByData,
    this.fontsFallback = const [],
  });

  final String title;
  final String creator;
  final PdfPageFormat format;
  final Map<PlutoColumn, String> columns;
  final List<Map<dynamic, String?>> rows;
  final List<PlutoColumnGroup>? groups;
  final ThemeData? themeData;
  final Widget? logoEsquerda;
  final Widget? logoDireita;
  final PdfColor? Function(dynamic data)? colorByData;
  final PdfColor? Function(PlutoColumn column)? colorByColumn;
  final List<Font> fontsFallback;
  final EdgeInsets? margin;
  final Widget? Function(PlutoColumn, TextStyle?)? getHeaderWidgetByColumn;

  @override
  PageOrientation getPageOrientation() {
    return PageOrientation.landscape;
  }

  @override
  String getDocumentCreator() {
    return creator;
  }

  @override
  String getDocumentTitle() {
    return title;
  }

  @override
  PdfPageFormat getPageFormat() {
    return format;
  }

  @override
  Widget getHeader(Context context) {
    String title = getDocumentTitle();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logoEsquerda != null) ...{logoEsquerda!},
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (logoDireita != null) ...{logoDireita!},
        ],
      ),
    );
  }

  @override
  List<Widget> exportInternal(Context context) {
    return [
      _table(columns, rows, groups),
    ];
  }

  Widget _table(Map<PlutoColumn, String> columns,
      List<Map<dynamic, String?>> rows, List<PlutoColumnGroup>? groups) {
    return CustomTableHelper.fromTextArray(
      getHeaderWidgetByColumn: getHeaderWidgetByColumn,
      getColorByColumn: colorByColumn,
      border: null,
      cellAlignment: Alignment.center,
      headerCellDecoration: BoxDecoration(
        color: headerBackground,
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      headerDecoration: BoxDecoration(
        color: headerBackground,
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      headerHeight: 25,
      cellHeight: 15,
      headerStyle: TextStyle(
        color: baseTextColor,
        fontSize: 7,
        fontWeight: FontWeight.bold,
      ),
      headerAlignment: Alignment.center,
      cellPadding: const EdgeInsets.all(1),
      cellStyle: TextStyle(
        color: baseTextColor,
        fontFallback: fontsFallback,
        fontSize: 7.5,
      ),
      oddRowDecoration: const BoxDecoration(color: oddRowColor),
      cellDecoration: (index, data, rowNum) => BoxDecoration(
        color: colorByData != null ? colorByData!(data.key) : null,
        border: Border.all(
          color: borderColor,
          width: .5,
        ),
      ),
      headers: columns,
      data: rows,
    );
  }

  @override
  Widget getFooter(Context context) {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${context.pageNumber}/${context.pagesCount}',
          ),
          Text(
            format.format(DateTime.now()),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> generatePdf() async {
    final doc = Document(
      creator: getDocumentCreator(),
      title: getDocumentTitle(),
      theme: getThemeData(),
    );

    doc.addPage(
      MultiPage(
        margin: margin,
        maxPages: 50,
        pageFormat: getPageFormat(),
        orientation: getPageOrientation(),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        header: getHeader,
        footer: getFooter,
        build: exportInternal,
      ),
    );
    return doc.save();
  }

  @override
  ThemeData getThemeData() {
    if (themeData != null) {
      return themeData!;
    }

    return ThemeData.base();
  }
}

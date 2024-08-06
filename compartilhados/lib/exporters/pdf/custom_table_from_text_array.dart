/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:dependencias_comuns/main.dart' as pluto;
import 'package:dependencias_comuns/pluto_grid_data_export.dart';

mixin CustomTableHelper {
  static const PdfColor borderColor = PdfColors.black;
  static TextAlign _textAlign(Alignment align) {
    if (align.x == 0) {
      return TextAlign.center;
    } else if (align.x < 0) {
      return TextAlign.left;
    } else {
      return TextAlign.right;
    }
  }

  static Table fromTextArray({
    Context? context,
    required List<Map<pluto.PlutoCell?, dynamic>> data,
    EdgeInsetsGeometry cellPadding = const EdgeInsets.all(5),
    double cellHeight = 0,
    AlignmentGeometry cellAlignment = Alignment.topLeft,
    Map<int, AlignmentGeometry>? cellAlignments,
    TextStyle? cellStyle,
    TextStyle? oddCellStyle,
    OnCellFormat? cellFormat,
    OnCellDecoration? cellDecoration,
    int headerCount = 1,
    Map<pluto.PlutoColumn, dynamic>? headers,
    List<pluto.PlutoColumnGroup>? groups,
    EdgeInsetsGeometry? headerPadding,
    double? headerHeight,
    AlignmentGeometry headerAlignment = Alignment.center,
    Map<int, AlignmentGeometry>? headerAlignments,
    TextStyle? headerStyle,
    OnCellFormat? headerFormat,
    Widget? Function(pluto.PlutoColumn, TextStyle?)? getHeaderWidgetByColumn,
    TableBorder? border = const TableBorder(
      left: BorderSide(),
      right: BorderSide(),
      top: BorderSide(),
      bottom: BorderSide(),
      horizontalInside: BorderSide(),
      verticalInside: BorderSide(),
    ),
    Map<int, TableColumnWidth>? columnWidths,
    TableColumnWidth defaultColumnWidth = const IntrinsicColumnWidth(),
    TableWidth tableWidth = TableWidth.max,
    BoxDecoration? headerDecoration,
    BoxDecoration? headerCellDecoration,
    BoxDecoration? rowDecoration,
    BoxDecoration? oddRowDecoration,
    TextDirection? headerDirection,
    TextDirection? tableDirection,
    final PdfColor? Function(pluto.PlutoColumn)? getColorByColumn,
    final double? Function(pluto.PlutoColumn)? getWidthByColumn,
    final List<String>? columnsToIgnore,
    final List<Widget>? Function(Map<pluto.PlutoCell?, dynamic>)? customRow,
  }) {
    assert(headerCount >= 0);

    if (context != null) {
      final theme = Theme.of(context);
      headerStyle ??= theme.tableHeader;
      cellStyle ??= theme.tableCell;
    }

    headerPadding ??= cellPadding;
    headerHeight ??= cellHeight;
    oddRowDecoration ??= rowDecoration;
    oddCellStyle ??= cellStyle;
    cellAlignments ??= const <int, Alignment>{};
    headerAlignments ??= cellAlignments;

    final rows = <TableRow>[];

    var rowNum = 0;
    if (headers != null) {
      final tableRow = <Widget>[];
      for (final MapEntry<pluto.PlutoColumn, dynamic> cell in headers.entries) {
        double? width;
        if (getWidthByColumn != null) {
          width = getWidthByColumn(cell.key);
        }
        if (columnsToIgnore != null &&
            columnsToIgnore.contains(cell.key.field)) {
          continue;
        }
        PdfColor? colorByColumn;
        if (getColorByColumn != null) {
          colorByColumn = getColorByColumn(cell.key);
        }
        Widget? headerWidget;
        if (getHeaderWidgetByColumn != null) {
          headerWidget = getHeaderWidgetByColumn(cell.key, headerStyle);
        }
        tableRow.add(
          Container(
            width: width,
            alignment: headerAlignments[tableRow.length] ?? headerAlignment,
            padding: headerPadding,
            decoration: colorByColumn != null
                ? BoxDecoration(
                    color: colorByColumn,
                    border: Border.all(
                      color: borderColor,
                      width: 0.5,
                    ),
                  )
                : headerCellDecoration,
            constraints: BoxConstraints(minHeight: headerHeight),
            child: headerWidget != null
                ? headerWidget
                : cell.value is Widget
                    ? cell.value
                    : Text(
                        headerFormat == null
                            ? cell.value.toString()
                            : headerFormat(tableRow.length, cell.value),
                        style: headerStyle,
                        textDirection: headerDirection,
                      ),
          ),
        );
      }
      rows.add(TableRow(
        children: tableRow,
        repeat: true,
        decoration: headerDecoration,
      ));
      rowNum++;
    }

    final textDirection =
        context == null ? TextDirection.ltr : Directionality.of(context);
    for (final row in data) {
      List<Widget> tableRow = <Widget>[];
      List<Widget>? customs;
      if (customRow != null) {
        customs = customRow(row);
        if (customs != null) {
          tableRow = customs;
        }
      }
      final isOdd = (rowNum - headerCount) % 2 != 0;
      if (customs == null) {
        if (rowNum < headerCount) {
          for (final MapEntry<pluto.PlutoCell?, dynamic> cell in row.entries) {
            double? width;
            if (getWidthByColumn != null && cell.key != null) {
              width = getWidthByColumn(cell.key!.column);
            }
            if (columnsToIgnore != null &&
                columnsToIgnore.contains(cell.key?.column.field)) {
              continue;
            }
            final align = headerAlignments[tableRow.length] ?? headerAlignment;
            final textAlign = _textAlign(align.resolve(textDirection));

            tableRow.add(
              Container(
                width: width,
                alignment: align,
                padding: headerPadding,
                constraints: BoxConstraints(minHeight: headerHeight),
                child: cell.value is Widget
                    ? cell.value
                    : Text(
                        headerFormat == null
                            ? cell.value.toString()
                            : headerFormat(tableRow.length, cell.value),
                        style: headerStyle,
                        textAlign: textAlign,
                        textDirection: headerDirection,
                      ),
              ),
            );
          }
        } else {
          for (final MapEntry<pluto.PlutoCell?, dynamic> cell in row.entries) {
            if (columnsToIgnore != null &&
                columnsToIgnore.contains(cell.key?.column.field)) {
              continue;
            }
            double? width;
            if (getWidthByColumn != null && cell.key != null) {
              width = getWidthByColumn(cell.key!.column);
            }
            final align = cellAlignments[tableRow.length] ?? cellAlignment;
            tableRow.add(
              Container(
                width: width,
                alignment: align,
                padding: cellPadding,
                constraints: BoxConstraints(minHeight: cellHeight),
                decoration: cellDecoration == null
                    ? null
                    : cellDecoration(tableRow.length, cell, rowNum),
                child: cell.value is Widget
                    ? cell.value
                    : Text(
                        cellFormat == null
                            ? cell.value.toString()
                            : cellFormat(tableRow.length, cell.value),
                        style: isOdd ? oddCellStyle : cellStyle,
                        textAlign: _textAlign(align.resolve(textDirection)),
                        textDirection: tableDirection,
                      ),
              ),
            );
          }
        }
      }

      var decoration = isOdd ? oddRowDecoration : rowDecoration;
      if (rowNum < headerCount) {
        decoration = headerDecoration;
      }

      rows.add(TableRow(
        children: tableRow,
        repeat: rowNum < headerCount,
        decoration: decoration,
      ));
      rowNum++;
    }
    return Table(
      border: border,
      tableWidth: tableWidth,
      children: rows,
      columnWidths: columnWidths,
      defaultColumnWidth: defaultColumnWidth,
      defaultVerticalAlignment: TableCellVerticalAlignment.full,
    );
  }
}

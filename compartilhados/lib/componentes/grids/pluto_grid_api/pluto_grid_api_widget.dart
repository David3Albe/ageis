import 'dart:ui';

import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridWidget<T> extends StatelessWidget {
  Color get headerColor => const Color(0xffE0E0E0);
  final bool smallRows;
  final List<PlutoColumn> columns;
  final Color Function(PlutoRowColorContext rowContext)? rowColorCallback;
  PlutoGridWidget({
    required this.columns,
    this.smallRows = false,
    this.rowColorCallback,
  });

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

  final List<PlutoRow> rows = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = _getFontSize(size, smallRows);
    double rowsSize = getRowsSize(size);
    return Material(
      key: GlobalKey(),
      child: ContextMenuOverlay(
        buttonStyle: const ContextMenuButtonStyle(
          textStyle: TextStyle(fontSize: 12),
        ),
        child: ContextMenuRegion(
          contextMenu: const GenericContextMenu(
            buttonStyle: const ContextMenuButtonStyle(
              textStyle: TextStyle(
                fontSize: 14,
              ),
            ),
            buttonConfigs: [
              // ContextMenuButtonConfig(
              //   'XML',
              //   icon: const FaIcon(FontAwesomeIcons.file),
              //   onPressed: () => exportXml(
              //     context: context,
              //     // gridState: gridState,
              //   ),
              // ),
            ],
          ),
          child: PlutoGrid(
            createFooter: (stateManager) => PlutoInfinityScrollRows(
              initialFetch: false,
              fetchWithSorting: true,
              fetchWithFiltering: true,
              fetch: fetch,
              stateManager: stateManager,
            ),
            rows: rows,
            rowColorCallback: rowColorCallback,
            columns: columns,
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
          ),
        ),
      ),
    );
  }

  Future<PlutoInfinityScrollRowsResponse> fetch(
    PlutoInfinityScrollRowsRequest request,
  ) async {
    Map<String, dynamic> filter = {};

    if (request.lastRow != null) {
      filter.addAll({'lastId': request.lastRow!.cells['id']});
    }

  //   if (request.filterRows.isNotEmpty) {
  //     final filterMap = FilterHelper.convertRowsToMap(request.filterRows);
  //     for (final filter in filterMap.entries) {
  //       for (final type in filter.value) {
  //         queryString += '&filter[${filter.key}]';
  //         final filterType = type.entries.first;
  //         queryString += '[${filterType.key}][]=${filterType.value}';
  //       }
  //     }
  //   }

  //   if (request.sortColumn != null && !request.sortColumn!.sort.isNone) {
  //     queryString +=
  //         '&sort=${request.sortColumn!.field},${request.sortColumn!.sort.name}';
  //   }

  //   print(queryString);
  //   final dataFromServer = await Future.value("""
  // {
  //   "isLast": false,
  //   "data": [
  //     {
  //       "id": 1,
  //       "name": "mike"
  //     },
  //     {
  //       "id": 2,
  //       "name": "jessi"
  //     }
  //   ]
  // }
  // """);

  //   final parsedData = jsonDecode(dataFromServer);

  //   final bool isLast = parsedData['isLast'];

  //   final rows = parsedData.data.map<PlutoRow>((rowData) {
  //     return PlutoRow.fromJson(rowData);
  //   });

    return PlutoInfinityScrollRowsResponse(
      isLast: false,
      rows: rows.toList(),
    );
  }

  // Future exportXml({
  //   required BuildContext context,
  //   required PlutoGridState gridState,
  // }) async {
  //   List<String> columnsToIgnore = columns
  //       .where((element) => element.actionColumn == true)
  //       .map((e) => e.field)
  //       .toList();
  //   columnsToIgnore.add('');
  //   PlutoGridXmlExport xmlExport = PlutoGridXmlExport(
  //     context: context,
  //     stateManager: gridState.stateManager!,
  //     columnsToIgnore: columnsToIgnore,
  //   );
  //   await xmlExport.export();
  // }
}

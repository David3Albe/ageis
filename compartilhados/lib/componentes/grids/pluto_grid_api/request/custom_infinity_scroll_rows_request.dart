import 'package:dependencias_comuns/main.dart';

class CustomPlutoInfinityScrollRowsRequest
    extends PlutoInfinityScrollRowsRequest {
  final PlutoRow? lastRow;
  final PlutoColumn? sortColumn;
  final List<PlutoRow> filterRows;
  final bool loadRemaining;

  CustomPlutoInfinityScrollRowsRequest({
    this.lastRow,
    this.sortColumn,
    this.filterRows = const <PlutoRow>[],
    this.loadRemaining = false,
  });
}

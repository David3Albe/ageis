import 'package:dependencias_comuns/main.dart';

class EscalaPageGridState {
  List<PlutoColumn> columns;
  List<PlutoRow> rows;
  PlutoGridStateManager? stateManager;
  EscalaPageGridState({
    required this.columns,
    required this.rows,
    required this.stateManager,
  });
}

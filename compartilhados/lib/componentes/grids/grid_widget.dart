// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class GridWidget<T> extends StatefulWidget {
  final List<CustomDataColumn> colunas;
  final List<T> objects;
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  const GridWidget({
    Key? key,
    required this.colunas,
    required this.objects,
    this.onDelete,
    this.onEdit,
    this.onOpen,
  }) : super(key: key);

  @override
  State<GridWidget<T>> createState() => _GridWidgetState<T>(
        colunas: colunas,
        objects: objects,
      );
}

class _GridWidgetState<T> extends State<GridWidget<T>> {
  _GridWidgetState({required this.colunas, required this.objects});
  final List<T> objects;
  final List<CustomDataColumn> colunas;
  void OnSort() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onEdit != null ||
        widget.onDelete != null ||
        widget.onOpen != null) {
      if (widget.colunas.where((element) => element.actionColumn).firstOrNull ==
          null) {
        widget.colunas
            .insert(0, CustomDataColumn(text: '', actionColumn: true));
      }
    }
    return Theme(
      data: ThemeData(
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: MaterialStatePropertyAll(Cores.corScrollBar),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Cores.corTextSelection,
          selectionColor: Cores.corTextSelection,
        ),
      ),
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Cores.corFundoGrid),
          columns: colunas
              .asMap()
              .map(
                (index, customColumn) => MapEntry(
                  index,
                  customColumn.toDataColumn(
                    context,
                    OnSort,
                  ),
                ),
              )
              .values
              .toList(),
          rows: CustomDataRows.CreateRows<T>(
            objetos: objects,
            colunasMapear: colunas,
            onDelete: widget.onDelete,
            onEdit: widget.onEdit,
            onOpen: widget.onOpen,
          ),
        ),
      ),
    );
  }
}

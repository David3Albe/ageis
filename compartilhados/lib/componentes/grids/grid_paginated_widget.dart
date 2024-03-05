// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/default_scroll_behavior.dart';
import 'package:compartilhados/componentes/rows/custom_data_source.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';

class GridPaginatedWidget<T> extends StatefulWidget {
  final List<T> objects;
  final List<CustomDataColumn> colunas;
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  final bool smallRows;
  GridPaginatedWidget({
    Key? key,
    required this.colunas,
    required this.objects,
    this.onDelete,
    this.onEdit,
    this.onOpen,
    this.smallRows = false,
  }) : super(key: key);

  @override
  State<GridPaginatedWidget<T>> createState() => _GridPaginatedWidgetState<T>();
}

class _GridPaginatedWidgetState<T> extends State<GridPaginatedWidget<T>> {
  final ScrollController _scroll = ScrollController();
  int rowsPerPage = 25;
  late CustomDataSource source;

  void OnSort() {
    setState(() {
      source = createDataSource();
    });
  }

  @override
  void initState() {
    source = createDataSource();
    super.initState();
  }

  CustomDataSource<T> createDataSource() {
    return CustomDataSource<T>(
      data: widget.objects,
      colunasMapear: widget.colunas,
      onEdit: widget.onEdit,
      onDelete: widget.onDelete,
      onOpen: widget.onOpen,
    );
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
        dataTableTheme: DataTableThemeData(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Cores.corFundoGrid),
          dataRowColor: MaterialStateColor.resolveWith(
            (states) => Cores.corFundoBranco,
          ),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ScrollConfiguration(
          behavior: DefaultScrollBehavior(),
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            interactive: true,
            controller: _scroll,
            child: PaginatedDataTable(
              primary: false,
              availableRowsPerPage: [25, 50, 100, 200, 500],
              onRowsPerPageChanged: (int? value) {
                setState(() {
                  this.rowsPerPage = value ?? 25;
                });
              },
              rowsPerPage: this.rowsPerPage,
              controller: _scroll,
              dataRowMinHeight: widget.smallRows == true ? 30 : null,
              dataRowMaxHeight: widget.smallRows == true ? 30 : null,
              source: source,
              columns: widget.colunas
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
            ),
          ),
        ),
      ),
    );
  }
}

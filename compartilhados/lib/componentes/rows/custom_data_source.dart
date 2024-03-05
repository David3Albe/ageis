import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:flutter/material.dart';

class CustomDataSource<T> extends DataTableSource {
  CustomDataSource({
    required List<T> data,
    required this.colunasMapear,
    required this.onEdit,
    required this.onDelete,
    this.onOpen,
    this.onDownload,
  }) {
    List<T> items = CustomDataRows.Sort(this.colunasMapear, data) as List<T>;
    this.dataCells = items
        .map((e) => MapEntry(e, (e as dynamic).toJson()))
        .map((e) => MapEntry(e.key, _getItemCells(e)))
        .toList();
  }

  late final List<MapEntry<T, List<DataCell>>> dataCells;
  final List<CustomDataColumn> colunasMapear;
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  final void Function(T objeto)? onDownload;

  List<DataCell> _getItemCells(MapEntry<T, dynamic> data) =>
      CustomDataRows.getDataCells(
        data.value,
        data.key,
        colunasMapear,
        onEdit,
        onDelete,
        onOpen,
        onDownload,
      );

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: dataCells[index].value,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataCells.length;

  @override
  int get selectedRowCount => 0;
}

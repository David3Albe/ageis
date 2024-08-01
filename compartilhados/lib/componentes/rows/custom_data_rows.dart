import 'package:compartilhados/componentes/botoes/download_button_widget.dart';
import 'package:compartilhados/componentes/botoes/edit_button_widget.dart';
import 'package:compartilhados/componentes/botoes/link_button_widget.dart';
import 'package:compartilhados/componentes/botoes/remove_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/columns/sorted_column.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

abstract class CustomDataRows {
  static List<DataRow> CreateRows<T>({
    required List<dynamic> objetos,
    required List<CustomDataColumn> colunasMapear,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
    int? sortColumnIndex,
    bool? isAscending,
  }) {
    List<DataRow> rows = [];
    List<dynamic> sortedObjects = Sort(colunasMapear, objetos);
    for (T objeto in sortedObjects) {
      rows.add(CreateRow(colunasMapear: colunasMapear, objeto: objeto));
    }
    return rows;
  }

  static TableRow createTableRow<T>({
    required List<CustomDataColumn> colunasMapear,
    required T objeto,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
    int? sortColumnIndex,
    bool? isAscending,
  }) {
    dynamic objetoJson = (objeto as dynamic).toJson();
    return getTableRow(
      objetoJson,
      objeto,
      colunasMapear,
      onEdit,
      onDelete,
      onOpen,
      onDownload,
    );
  }

  static TableRow getTableRow<T>(
    dynamic objetoJson,
    T objeto,
    List<CustomDataColumn> colunasMapear,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
  ) {
    return TableRow(
      children: getTableCells(
        objetoJson,
        objeto,
        colunasMapear,
        onEdit,
        onDelete,
        onOpen,
        onDownload,
      ),
    );
  }

  static List<TableCell> getTableCells<T>(
    dynamic objetoJson,
    T objeto,
    List<CustomDataColumn> colunasMapear,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
  ) {
    List<TableCell> cells = [];
    for (CustomDataColumn coluna in colunasMapear) {
      if (coluna.actionColumn) {
        cells.add(
          TableCell(
            child: getActionCell(onEdit, onDelete, onOpen, onDownload, objeto),
          ),
        );
      } else {
        cells.add(
          TableCell(child: getCellWidget(coluna, objetoJson)),
        );
      }
    }
    return cells;
  }

  static DataRow CreateRow<T>({
    required List<CustomDataColumn> colunasMapear,
    required T objeto,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
    int? sortColumnIndex,
    bool? isAscending,
  }) {
    dynamic objetoJson = (objeto as dynamic).toJson();
    return getDataRow(
      objetoJson,
      objeto,
      colunasMapear,
      onEdit,
      onDelete,
      onOpen,
      onDownload,
    );
  }

  static DataRow getDataRow<T>(
    dynamic objetoJson,
    T objeto,
    List<CustomDataColumn> colunasMapear,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
  ) {
    return DataRow(
      cells: getDataCells(
        objetoJson,
        objeto,
        colunasMapear,
        onEdit,
        onDelete,
        onOpen,
        onDownload,
      ),
    );
  }

  static List<DataCell> getDataCells<T>(
    dynamic objetoJson,
    T objeto,
    List<CustomDataColumn> colunasMapear,
    final void Function(T objeto)? onEdit,
    final void Function(T objeto)? onDelete,
    final void Function(T objeto)? onOpen,
    final void Function(T objeto)? onDownload,
  ) {
    List<DataCell> cells = [];
    for (CustomDataColumn coluna in colunasMapear) {
      if (coluna.actionColumn) {
        cells.add(
          DataCell(
            getActionCell(onEdit, onDelete, onOpen, onDownload, objeto),
          ),
        );
      } else {
        cells.add(
          DataCell(getCellWidget(coluna, objetoJson)),
        );
      }
    }
    return cells;
  }

  static Widget getCellWidget(CustomDataColumn coluna, dynamic objetoJson) {
    return SelectionArea(
      child: getDataCellContent(
        coluna,
        objetoJson[coluna.field],
      ),
    );
  }

  static dynamic getCellValue(CustomDataColumn coluna, dynamic objetoJson) {
    return getDataCellValue(
      coluna,
      objetoJson[coluna.field],
    );
  }

  static dynamic getCellContentValue(
    CustomDataColumn coluna,
    dynamic objetoJson,
  ) {
    return getDataCellContentValue(
      coluna,
      objetoJson[coluna.field],
    );
  }

  static List<dynamic> Sort(
    List<CustomDataColumn> colunas,
    List<dynamic> objects,
  ) {
    if (colunas.where((element) => !element.sort.sorted).firstOrNull == null) {
      return objects;
    }
    List<CustomDataColumn> colunasSorteadas =
        colunas.where((element) => element.sort.sorted).toList();
    objects.sort((a, b) {
      int finalResult = 0;
      for (CustomDataColumn coluna in colunasSorteadas) {
        if (finalResult != 0) break;
        dynamic valorA = a.toJson()[coluna.field];
        dynamic valorB = b.toJson()[coluna.field];
        if (valorA is bool && valorB is bool) {
          int intValorA = valorA ? 1 : 0;
          int intValorB = valorB ? 1 : 0;
          finalResult = intValorA.compareTo(intValorB);
        } else {
          finalResult = valorA.compareTo(valorB);
          finalResult = (coluna.sort.type == TypeSort.Ascending
              ? finalResult
              : -finalResult);
        }
      }

      return finalResult;
    });
    return objects;
  }

  static dynamic getDataCellValue(CustomDataColumn coluna, dynamic valor) {
    dynamic valueConverted = valor;
    if (coluna.valueConverter != null) {
      valueConverted = coluna.valueConverter!(valor);
    }
    return valueConverted;
  }

  static dynamic getDataCellContentValue(
    CustomDataColumn coluna,
    dynamic valor,
  ) {
    dynamic valueConverted = getDataCellValue(coluna, valor);
    switch (coluna.type) {
      case CustomDataColumnType.Text:
        return valueConverted ?? '';

      case CustomDataColumnType.Date:
        DateTime? valorData;

        if (valueConverted != null) {
          valorData = DateTime.tryParse(valueConverted!);
        } else {
          valorData = DateTime.tryParse('');
        }
        return valorData;

      case CustomDataColumnType.DateTime:
        DateTime? valorData;

        if (valueConverted != null) {
          valorData = DateTime.tryParse(valueConverted!);
        } else {
          valorData = DateTime.tryParse('');
        }

        return valorData;
      case CustomDataColumnType.Number:
      case CustomDataColumnType.Integer:
      case CustomDataColumnType.Currency:
      case CustomDataColumnType.Phone:
        return valueConverted;
      case CustomDataColumnType.Checkbox:
        return valueConverted;
      default:
        throw Exception('Tipo de coluna não preparado');
    }
  }

  static Widget getDataCellContent(CustomDataColumn coluna, dynamic valor) {
    dynamic valueConverted = getDataCellValue(coluna, valor);
    switch (coluna.type) {
      case CustomDataColumnType.Text:
        return Text(
          valueConverted == null ? '' : valueConverted.toString(),
        );

      case CustomDataColumnType.Checkbox:
        return Align(
          alignment: Alignment.center,
          child: CustomCheckboxWidget(
            checked: valueConverted == null ? false : valueConverted,
            readonly: coluna.readonly,
          ),
        );

      case CustomDataColumnType.Date:
        DateTime? valorData;

        if (valueConverted != null) {
          valorData = DateTime.tryParse(valueConverted!);
        } else {
          valorData = DateTime.tryParse('');
        }

        return Align(
          alignment: Alignment.center,
          child: Text(
            valorData == null ? '' : DateFormat('dd/MM/yyyy').format(valorData),
          ),
        );

      case CustomDataColumnType.DateTime:
        DateTime? valorData;

        if (valueConverted != null) {
          valorData = DateTime.tryParse(valueConverted!);
        } else {
          valorData = DateTime.tryParse('');
        }

        return Align(
          alignment: Alignment.center,
          child: Text(
            valorData == null
                ? ''
                : DateFormat('dd/MM/yyyy hh:mm').format(valorData),
          ),
        );

      case CustomDataColumnType.Number:
        return Align(
          alignment: Alignment.centerRight,
          child: Text(
            valueConverted == null ? '' : valueConverted.toString(),
          ),
        );

      case CustomDataColumnType.Currency:
        final numberFormat =
            NumberFormat.currency(locale: 'pt_br', symbol: 'R\$');
        return Align(
          alignment: Alignment.centerRight,
          child: Text(
            valueConverted == null ? '' : numberFormat.format(valueConverted),
          ),
        );

      default:
        throw Exception('Tipo de coluna não preparado');
    }
  }

  static Widget getActionCell<T>(
    void Function(T objeto)? onEdit,
    void Function(T objeto)? onDelete,
    void Function(T objeto)? onOpen,
    void Function(T objeto)? onDownload,
    T objeto,
  ) {
    List<Widget> widgets = [];

    if (onEdit != null) {
      widgets.add(
        EditButtonWidget(
          onPressed: () => onEdit(objeto),
        ),
      );
    }
    if (onDelete != null) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(left: widgets.isNotEmpty ? 8.0 : 0),
          child: RemoveButtonWidget(
            onPressed: () => onDelete(objeto),
          ),
        ),
      );
    }

    if (onOpen != null) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(left: widgets.isNotEmpty ? 8.0 : 0),
          child: LinkButtonWidget(
            onPressed: () => onOpen(objeto),
          ),
        ),
      );
    }
    if (onDownload != null) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(left: widgets.isNotEmpty ? 8.0 : 0),
          child: DownloadButtonWidget(
            onPressed: () => onDownload(objeto),
          ),
        ),
      );
    }
    return Row(
      children: widgets,
    );
  }
}

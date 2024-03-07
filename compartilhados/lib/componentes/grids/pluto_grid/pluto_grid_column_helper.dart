import 'package:compartilhados/componentes/botoes/download_button_widget.dart';
import 'package:compartilhados/componentes/botoes/edit_button_widget.dart';
import 'package:compartilhados/componentes/botoes/link_button_widget.dart';
import 'package:compartilhados/componentes/botoes/remove_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_column_footer_helper.dart';
import 'package:compartilhados/componentes/rows/custom_data_rows.dart';
import 'package:compartilhados/enums/custom_data_column_footer_type.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/main.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class PlutoGridColumnHelper<T> {
  final Map<PlutoRow, T> rowsObject;
  final void Function(T objeto)? onEdit;
  final void Function(T objeto)? onDelete;
  final void Function(T objeto)? onOpen;
  final void Function(T objeto)? onDownload;

  Color get gridColumnColor => const Color(0xffE0E0E0);

  PlutoGridColumnHelper({
    required this.rowsObject,
    required this.onEdit,
    required this.onDelete,
    required this.onOpen,
    required this.onDownload,
  });

  PlutoColumn GetColumnByCustomDataColumnType(
    CustomDataColumn baseColumn, {
    required double fontSize,
    List<void Function()>? listeners,
  }) {
    if (baseColumn.actionColumn == true) return _getActionColumn(baseColumn);
    switch (baseColumn.type) {
      case CustomDataColumnType.Number:
        return _getNumberColumnType(baseColumn);
      case CustomDataColumnType.Integer:
        return _getIntegerColumnType(baseColumn);
      case CustomDataColumnType.Currency:
        return _getCurrencyColumnType(baseColumn);
      case CustomDataColumnType.Checkbox:
        return _getCheckboxColumn(
          baseColumn,
          fontSize: fontSize,
        );
      case CustomDataColumnType.Date:
        return _getDateColumn(baseColumn);
      case CustomDataColumnType.DateTime:
        return _getDateTimeColumn(baseColumn);
      default:
        return _getDefaultColumnType(baseColumn);
    }
  }

  PlutoAggregateColumnFooter getFooter(
    PlutoColumnFooterRendererContext rendererContext,
    CustomDataColumn baseColumn,
  ) {
    switch (baseColumn.footerType) {
      case CustomDataColumnFooterType.Currency:
        return PlutoGridColumnFooterHelper.CreateCurrencyFooter(
          rendererContext,
        );
      case CustomDataColumnFooterType.Number:
        return PlutoGridColumnFooterHelper.CreateNumberFooter(
          rendererContext,
        );
      default:
        throw CustomBaseException('Tipo de footer não configurado');
    }
  }

  PlutoColumn _getDefaultColumnType(CustomDataColumn baseColumn) {
    return PlutoColumn(
      title: baseColumn.text,
      backgroundColor: gridColumnColor,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      type: PlutoColumnType.text(defaultValue: ''),
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
      enableAutoEditing: baseColumn.enableAutoEditing,
      renderer: baseColumn.customRenderer,
      footerRenderer: baseColumn.footerType != null
          ? (PlutoColumnFooterRendererContext renderer) =>
              getFooter(renderer, baseColumn)
          : null,
    );
  }

  PlutoColumn _getNumberColumnType(CustomDataColumn baseColumn) {
    return PlutoColumn(
      title: baseColumn.text,
      backgroundColor: gridColumnColor,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      type: PlutoColumnType.number(
        negative: baseColumn.negative,
        format: '#.##',
        defaultValue: '',
        locale: 'pt-BR',
      ),
      enableAutoEditing: baseColumn.enableAutoEditing,
      renderer: baseColumn.customRenderer,
      textAlign: PlutoColumnTextAlign.right,
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
      footerRenderer: baseColumn.footerType != null
          ? (PlutoColumnFooterRendererContext renderer) =>
              getFooter(renderer, baseColumn)
          : null,
    );
  }

  PlutoColumn _getIntegerColumnType(CustomDataColumn baseColumn) {
    return PlutoColumn(
      title: baseColumn.text,
      backgroundColor: gridColumnColor,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      type: PlutoColumnType.number(
        negative: baseColumn.negative,
        format: '#',
        defaultValue: '',
        locale: 'pt-BR',
      ),
      enableAutoEditing: baseColumn.enableAutoEditing,
      renderer: baseColumn.customRenderer,
      textAlign: PlutoColumnTextAlign.right,
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
      footerRenderer: baseColumn.footerType != null
          ? (PlutoColumnFooterRendererContext renderer) =>
              getFooter(renderer, baseColumn)
          : null,
    );
  }

  PlutoColumn _getCurrencyColumnType(CustomDataColumn baseColumn) {
    return PlutoColumn(
      title: baseColumn.text,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      backgroundColor: gridColumnColor,
      type: PlutoColumnType.currency(
        format: '#.###',
        defaultValue: '',
        locale: 'pt-BR',
      ),
      enableAutoEditing: baseColumn.enableAutoEditing,
      textAlign: PlutoColumnTextAlign.right,
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
      footerRenderer: (PlutoColumnFooterRendererContext renderer) =>
          baseColumn.footerType != null
              ? getFooter(renderer, baseColumn)
              : const SizedBox(),
    );
  }

  PlutoColumn _getCheckboxColumn(
    CustomDataColumn baseColumn, {
    required double fontSize,
  }) {
    return PlutoColumn(
      backgroundColor: gridColumnColor,
      title: baseColumn.text,
      type: PlutoColumnType.text(),
      field: baseColumn.calculatedField ?? baseColumn.field,
      enableEditingMode: false,
      width: baseColumn.onHeaderCheck != null ? 120 : 80,
      suppressedAutoSize: true,
      readOnly: baseColumn.readonly,
      titleSpan: TextSpan(
        children: _getCheckboxHeaderWidget(baseColumn, fontSize: fontSize),
      ),
      renderer: (rendererContext) => _getCheckboxWidget(
        rendererContext,
        baseColumn,
      ),
    );
  }

  List<InlineSpan> _getCheckboxHeaderWidget(
    CustomDataColumn column, {
    required double fontSize,
  }) {
    if (column.onHeaderCheck == null) {
      return [WidgetSpan(child: Text(column.text))];
    }

    return [
      WidgetSpan(
        child: CustomCheckboxWidget(
          onClick: column.onHeaderCheck,
          text: column.text,
          fontSize: fontSize,
        ),
      ),
    ];
  }

  Widget _getCheckboxWidget(
    PlutoColumnRendererContext rendererContext,
    CustomDataColumn coluna,
  ) {
    T obj = rowsObject[rendererContext.row]!;
    dynamic valueConverted =
        CustomDataRows.getCellContentValue(coluna, (obj as dynamic).toJson());
    CustomCheckboxWidget chkBox = CustomCheckboxWidget(
      onClick: (value) => coluna.onClick!(obj, value),
      checked: valueConverted,
      readonly: coluna.readonly,
    );

    return Align(alignment: Alignment.center, child: chkBox);
  }

  PlutoColumn _getDateColumn(CustomDataColumn baseColumn) {
    return PlutoColumn(
      backgroundColor: gridColumnColor,
      title: baseColumn.text,
      enableAutoEditing: baseColumn.enableAutoEditing,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      textAlign: PlutoColumnTextAlign.center,
      type: PlutoColumnType.date(format: 'dd/MM/yyyy'),
      field: baseColumn.calculatedField ?? baseColumn.field,
      suppressedAutoSize: true,
      readOnly: baseColumn.readonly,
      titleTextAlign: PlutoColumnTextAlign.center,
    );
  }

  PlutoColumn _getDateTimeColumn(CustomDataColumn baseColumn) {
    return PlutoColumn(
      backgroundColor: gridColumnColor,
      title: baseColumn.text,
      suppressedAutoSize: true,
      width: baseColumn.width ?? PlutoGridSettings.columnWidth,
      textAlign: PlutoColumnTextAlign.center,
      enableAutoEditing: baseColumn.enableAutoEditing,
      type: PlutoColumnType.date(format: 'dd/MM/yyyy HH:mm'),
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
    );
  }

  PlutoColumn _getActionColumn(CustomDataColumn baseColumn) {
    return PlutoColumn(
      backgroundColor: gridColumnColor,
      title: baseColumn.text,
      suppressedAutoSize: true,
      enableEditingMode: false,
      width: getWidthActionColumn(),
      enableAutoEditing: baseColumn.enableAutoEditing,
      type: PlutoColumnType.text(),
      field: baseColumn.calculatedField ?? baseColumn.field,
      readOnly: baseColumn.readonly,
      renderer: (rendererContext) =>
          _getWidgetActionColumn(baseColumn, rendererContext),
    );
  }

  Widget _getWidgetActionColumn(
    CustomDataColumn baseColumn,
    PlutoColumnRendererContext rendererContext,
  ) {
    return Wrap(children: _getActionsRow(rendererContext));
  }

  double getWidthActionColumn() {
    int actions = 0;
    if (onEdit != null) actions++;
    if (onDelete != null) actions++;
    if (onOpen != null) actions++;
    if (onDownload != null) actions++;
    return 40.0 * actions;
  }

  List<Widget> _getActionsRow(
    PlutoColumnRendererContext rendererContext,
  ) {
    T obj = rowsObject[rendererContext.row]!;
    List<Widget> actions = [];
    if (onEdit != null) {
      actions.add(
        EditButtonWidget(
          onPressed: () => onEdit!(obj),
        ),
      );
    }
    if (onDelete != null) {
      actions.add(
        Padding(
          padding: EdgeInsets.only(left: actions.isNotEmpty ? 8.0 : 0),
          child: RemoveButtonWidget(
            onPressed: () => onDelete!(obj),
          ),
        ),
      );
    }

    if (onOpen != null) {
      actions.add(
        Padding(
          padding: EdgeInsets.only(left: actions.isNotEmpty ? 8.0 : 0),
          child: LinkButtonWidget(
            onPressed: () => onOpen!(obj),
          ),
        ),
      );
    }

    if (onDownload != null) {
      actions.add(
        Padding(
          padding: EdgeInsets.only(left: actions.isNotEmpty ? 8.0 : 0),
          child: DownloadButtonWidget(
            onPressed: () => onDownload!(obj),
          ),
        ),
      );
    }
    return actions;
  }
}

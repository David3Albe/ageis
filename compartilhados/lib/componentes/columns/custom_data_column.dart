// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:compartilhados/componentes/columns/sorted_column.dart';
import 'package:compartilhados/componentes/filters/filter_widget.dart';
import 'package:compartilhados/enums/custom_data_column_footer_type.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class CustomDataColumn {
  final String text;
  final String field;
  final bool negative;
  final double? width;
  final bool enableAutoEditing;
  final String? calculatedField;
  final bool actionColumn;
  final CustomDataColumnType type;
  final dynamic Function(dynamic value)? valueConverter;
  final void Function(String field)? onFilter;
  final SortedColumn sort = SortedColumn();
  final bool readonly;
  final CustomDataColumnFooterType? footerType;
  final Widget Function(PlutoColumnRendererContext context)? customRenderer;
  final void Function(dynamic value, bool checked)? onClick;
  final void Function(bool value)? onHeaderCheck;
  final bool incluirApostrofo;

  CustomDataColumn({
    required this.text,
    this.field = '',
    this.actionColumn = false,
    this.type = CustomDataColumnType.Text,
    this.valueConverter,
    this.onFilter,
    this.readonly = true,
    this.calculatedField,
    this.footerType,
    this.customRenderer,
    this.onClick,
    this.negative = true,
    this.enableAutoEditing = false,
    this.onHeaderCheck,
    this.width,
    this.incluirApostrofo = false,
  });

  void setSort() {
    switch (sort.type) {
      case TypeSort.Descending:
        sort.sorted = false;
        sort.type = TypeSort.None;
      case TypeSort.None:
        sort.sorted = true;
        sort.type = TypeSort.Ascending;
      case TypeSort.Ascending:
        sort.sorted = true;
        sort.type = TypeSort.Descending;
    }
  }

  Widget toColumnWidget(
    BuildContext? context,
    void Function() OnSort,
  ) {
    return InkWell(
      onTap: () {
        setSort();
        OnSort();
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: Fontes.getRoboto(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          sort.sorted
              ? IconButton(
                  icon: Icon(
                    sort.type == TypeSort.Ascending
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 20,
                  ),
                  onPressed: () {
                    setSort();
                    OnSort();
                  },
                )
              : Container(),
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              size: 20,
            ),
            onPressed: () {
              context != null
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return FilterWidget(
                          columnHeaderName: text,
                          columnName: field,
                          onApllyFilter: (column, filter) {},
                        );
                      },
                    )
                  : () => {};
            },
          ),
        ],
      ),
    );
  }

  DataColumn toDataColumn(
    BuildContext context,
    void Function() OnSort,
  ) {
    return DataColumn(
      label: Expanded(
        child: toColumnWidget(
          context,
          OnSort,
        ),
      ),
    );
  }
}

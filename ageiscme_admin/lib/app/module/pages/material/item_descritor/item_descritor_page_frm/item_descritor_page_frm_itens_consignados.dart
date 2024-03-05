import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

typedef CommitEditGridBuilder = void Function(
  BuildContext context,
  Future Function() commitEditGridMethod,
);

typedef SetGridStateBuilder = void Function(
  BuildContext context,
  void Function() setGridStateBuilder,
);

class ItemDescritorPageFrmItensConsignados extends StatefulWidget {
  final ItemDescritorModel itemDescritor;
  final CommitEditGridBuilder commitMethod;
  final SetGridStateBuilder setGridStateMethod;
  ItemDescritorPageFrmItensConsignados({
    required this.itemDescritor,
    required this.commitMethod,
    required this.setGridStateMethod,
  });

  @override
  State<ItemDescritorPageFrmItensConsignados> createState() =>
      _ItemDescritorPageFrmItensConsignadosState();
}

late Future Function() submitMethod;

class _ItemDescritorPageFrmItensConsignadosState
    extends State<ItemDescritorPageFrmItensConsignados> {
  final List<CustomDataColumn> colunas = [
    CustomDataColumn(
      text: 'Descrição',
      field: 'descricao',
      type: CustomDataColumnType.Text,
      enableAutoEditing: true,
      readonly: false,
    ),
    CustomDataColumn(
      text: 'Quantidade',
      field: 'quantidade',
      type: CustomDataColumnType.Integer,
      negative: false,
      enableAutoEditing: true,
      readonly: false,
    ),
  ];

  Future commitEditGrid() async {
    await submitMethod.call();
  }

  @override
  Widget build(BuildContext context) {
    widget.commitMethod.call(context, commitEditGrid);
    widget.setGridStateMethod.call(context, setStateMethod);
    return widget.itemDescritor.consignado == true
        ? SizedBox(
            height: 400,
            child: Row(
              children: [
                Expanded(
                  child: PlutoGridWidget<ItemDescritorConsignadoModel>(
                    onChanged: onChanged,
                    onDelete: onDelete,
                    onAddClick: adicionarLinhaProduto,
                    items:
                        widget.itemDescritor.itensDescritoresConsignados ?? [],
                    columns: colunas,
                    submitBuilder: (context, method) => submitMethod = method,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  void onChanged(
    PlutoGridOnChangedEvent event,
    Map<PlutoRow, ItemDescritorConsignadoModel> rowsObject,
  ) {
    if (event.column.field == 'descricao') {
      rowsObject[event.row]!.descricao = event.value;
    } else if (event.column.field == 'quantidade') {
      rowsObject[event.row]!.quantidade = event.value;
    }
  }

  Future onDelete(
    ItemDescritorConsignadoModel item,
  ) async {
    await submitMethod.call();
    ItemDescritorConsignadoModel? itemConsignado = widget
        .itemDescritor.itensDescritoresConsignados
        ?.where((element) => element.cod == item.cod)
        .firstOrNull;
    if (itemConsignado == null) return;
    setState(() {
      widget.itemDescritor.itensDescritoresConsignados!.remove(itemConsignado);
    });
  }

  Future adicionarLinhaProduto() async {
    await submitMethod.call();
    setState(() {
      if (widget.itemDescritor.itensDescritoresConsignados == null) {
        widget.itemDescritor.itensDescritoresConsignados = [];
      }
      widget.itemDescritor.itensDescritoresConsignados!
          .add(ItemDescritorConsignadoModel.empty());
    });
  }

  void setStateMethod() {
    setState(() {
      widget.itemDescritor;
    });
  }
}

import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CheckboxListWidget<T> extends StatefulWidget {
  final List<T> items;
  final List<bool> checkedList;
  final Function(List<bool>) onChecked;
  final bool twoItemsPerRow;

  CheckboxListWidget({
    required this.items,
    required this.checkedList,
    required this.onChecked,
    this.twoItemsPerRow = false,
  });

  @override
  _CheckboxListWidgetState createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
  late _FiltroWidget filtroWidget = _FiltroWidget(
    onChanged: filtrar,
  );

  String? filtro;
  void filtrar(String? str) {
    setState(() {
      filtro = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.items.where((item) => item != null).toList();
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      constraints: BoxConstraints(
        minHeight: size.height * .15,
        maxHeight: size.height * .4,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getItems(filteredItems),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          filtroWidget,
        ],
      ),
    );
  }

  bool itemFazParteFiltro(dynamic item) {
    if (filtro == null || filtro!.isEmpty) {
      return true;
    }
    if (item.toString().toUpperCase().contains(filtro!.toUpperCase())) {
      return true;
    }
    return false;
  }

  List<Widget> getItems(List<dynamic> filteredItems) {
    List<Widget> rows = [];
    for (int index = 0; index < filteredItems.length; index++) {
      Widget? widget1 = getItem(filteredItems, index);
      if (widget1 == null) continue;
      int widget2Index = index + 1;
      Widget? widget2 = getItem(filteredItems, widget2Index);
      if (widget2 == null && widget.twoItemsPerRow) {
        while (widget2Index < filteredItems.length) {
          widget2Index = widget2Index + 1;
          widget2 = getItem(filteredItems, widget2Index);
          if (widget2 != null) break;
        }
      }
      rows.add(Row(
        children: [
          widget1,
          if (widget.twoItemsPerRow == true && widget2 != null) widget2,
        ],
      ));
      if (widget.twoItemsPerRow != true) continue;
      index++;
    }
    return rows;
  }

  Widget? getItem(
    List<dynamic> filteredItems,
    int index,
  ) {
    dynamic item = filteredItems.elementAtOrNull(index);
    bool fazParte = itemFazParteFiltro(item);
    if (fazParte == false) return null;
    if (item == null) return null;
    return Expanded(
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Colors.blue,
        title: Text(
          item,
          style: TextStyle(
            fontSize: HelperFunctions.calculaFontSize(context, 14),
          ),
        ),
        value: widget.checkedList[index],
        onChanged: (value) {
          setState(() {
            widget.checkedList[index] = value ?? false;
            widget.onChecked(widget.checkedList);
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

class _FiltroWidget extends StatelessWidget {
  const _FiltroWidget({
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final void Function(String? str) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFieldStringWidget(
        placeholder: 'Pesquisar...',
        onChanged: onChanged,
      ),
    );
  }
}

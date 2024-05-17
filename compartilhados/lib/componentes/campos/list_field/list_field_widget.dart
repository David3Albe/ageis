import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class ListFieldWidget<T> extends StatefulWidget {
  final List<T> sourceList;
  final ValueChanged<T?> onItemSelected;
  final Function(T)? onDoubleTap;
  final String Function(T) itemText;
  final bool removeButton;
  final bool? disableUnselect;
  final bool? permitReselect;

  ListFieldWidget({
    required this.sourceList,
    required this.onItemSelected,
    required this.itemText,
    required this.removeButton,
    this.disableUnselect,
    this.permitReselect,
    this.onDoubleTap,
  });

  @override
  _ListFieldWidgetState<T> createState() => _ListFieldWidgetState<T>();
}

class _ListFieldWidgetState<T> extends State<ListFieldWidget<T>> {
  T? selectedItem;
  List<T>? filteredItems;
  String? filtro;

  late _FiltroWidget filtroWidget = _FiltroWidget(
    onChanged: filtrar,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<T> items = buscarFiltros();
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      height: size.height * .4,
      width: size.width * .4,
      constraints: const BoxConstraints(
        minHeight: 300,
        maxHeight: 500,
        minWidth: 300,
        maxWidth: 500,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  items.length,
                  (index) {
                    final item = items[index];
                    final isSelected = item == selectedItem;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onDoubleTap: widget.onDoubleTap == null
                            ? null
                            : () => widget.onDoubleTap!(item),
                        child: Container(
                          color:
                              isSelected ? Colors.blue.withOpacity(0.8) : null,
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  widget.itemText(item),
                                  style: TextStyle(
                                    fontSize: HelperFunctions.calculaFontSize(
                                      context,
                                      16,
                                    ),
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                if (widget.removeButton) ...{
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        widget.sourceList.remove(item);
                                        filteredItems?.remove(item);
                                        if (isSelected) {
                                          selectedItem = null;
                                          widget.onItemSelected(null);
                                        }
                                      });
                                    },
                                  ),
                                },
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          if (widget.disableUnselect == true && isSelected) {
                            return;
                          }
                          setState(() {
                            if (isSelected && widget.permitReselect != true) {
                              selectedItem = null;
                              widget.onItemSelected(null);
                            } else {
                              selectedItem = item;
                              widget.onItemSelected(item);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const Divider(),
          filtroWidget,
        ],
      ),
    );
  }

  void filtrar(String? str) {
    setState(() {
      filtro = str;
    });
  }

  List<T> buscarFiltros() {
    List<T> items = widget.sourceList;
    if (filtro == null || filtro!.isEmpty) {
      return items;
    }
    return filteredItems = items
        .where(
          (element) => widget.itemText(element).toUpperCase().contains(
                filtro!.toUpperCase(),
              ),
        )
        .toList();
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

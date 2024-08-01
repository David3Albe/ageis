import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

typedef SetSelectedItemBuilder<T> = void Function(
  BuildContext context,
  void Function(T? item) setSelectedItemMethod,
);

class ListFieldWidget<T> extends StatefulWidget {
  final List<T> sourceList;
  final ValueChanged<T?> onItemSelected;
  final Function(T)? onDoubleTap;
  final String Function(T) itemText;
  final bool removeButton;
  final bool removeListAfterPress;
  final bool? disableUnselect;
  final bool? permitReselect;
  final double fontSize;
  final SetSelectedItemBuilder<T>? setSelected;
  final void Function(T)? onRemove;
  final bool Function(T)? ignorarExibicaoItens;

  ListFieldWidget({
    required this.sourceList,
    required this.onItemSelected,
    required this.itemText,
    required this.removeButton,
    this.disableUnselect,
    this.permitReselect,
    this.onDoubleTap,
    this.fontSize = 14,
    this.setSelected,
    this.onRemove,
    this.ignorarExibicaoItens,
    this.removeListAfterPress = true,
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

  void setSelected(T? item) {
    setState(() {
      selectedItem = item;
    });
  }

  void onRemove(T item) {}

  @override
  Widget build(BuildContext context) {
    widget.setSelected?.call(
      context,
      setSelected,
    );
    List<T> items = buscarFiltrosComItensIgnorados();
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
        maxWidth: 600,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.itemText(item),
                                        style: TextStyle(
                                          fontSize:
                                              HelperFunctions.calculaFontSize(
                                            context,
                                            widget.fontSize,
                                          ),
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget.removeButton) ...{
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: IconButton(
                                      tooltip: 'Remover',
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.onRemove != null) {
                                            widget.onRemove!(item);
                                          }
                                          if (widget.removeListAfterPress ==
                                              true) {
                                            widget.sourceList.remove(item);
                                            filteredItems?.remove(item);
                                            if (isSelected) {
                                              selectedItem = null;
                                              widget.onItemSelected(null);
                                            }
                                          }
                                        });
                                      },
                                    ),
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

  List<T> buscarFiltrosComItensIgnorados() {
    List<T> items = buscarFiltros();
    List<T> itensFinais = [];
    for (T item in items) {
      if (ignorarItem(item)) continue;
      itensFinais.add(item);
    }
    return itensFinais;
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

  bool ignorarItem(T item) {
    if (widget.ignorarExibicaoItens == null) return false;
    return widget.ignorarExibicaoItens!(item);
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

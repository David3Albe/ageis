import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class ListFieldWidget<T> extends StatefulWidget {
  final List<T> sourceList;
  final ValueChanged<T?> onItemSelected;
  final String Function(T) itemText;
  final bool removeButton;

  ListFieldWidget({
    required this.sourceList,
    required this.onItemSelected,
    required this.itemText,
    required this.removeButton,
  });

  @override
  _ListFieldWidgetState<T> createState() => _ListFieldWidgetState<T>();
}

class _ListFieldWidgetState<T> extends State<ListFieldWidget<T>> {
  T? selectedItem;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      constraints: BoxConstraints(
        minHeight: size.height * .3,
        maxHeight: size.height * .3,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.sourceList.length,
            (index) {
              final item = widget.sourceList[index];
              final isSelected = item == selectedItem;

              return Container(
                color: isSelected ? Colors.blue.withOpacity(0.8) : null,
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        widget.itemText(item),
                        style: TextStyle(
                          fontSize:
                              HelperFunctions.calculaFontSize(context, 16),
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      if (widget.removeButton) ...{
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              widget.sourceList.remove(item);
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
                  onTap: () {
                    setState(() {
                      if (isSelected) {
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
    );
  }
}

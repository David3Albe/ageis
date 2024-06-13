import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class CheckboxListWidget<T> extends StatefulWidget {
  final List<T> items;
  final List<bool> checkedList;
  final Function(List<bool>) onChecked;

  CheckboxListWidget({
    required this.items,
    required this.checkedList,
    required this.onChecked,
  });

  @override
  _CheckboxListWidgetState createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            filteredItems.length,
            (index) {
              return CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.blue,
                title: Text(
                  filteredItems[index],
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
              );
            },
          ),
        ),
      ),
    );
  }
}

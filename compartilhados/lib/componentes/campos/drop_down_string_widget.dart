import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatefulWidget {
  DropDownWidget({
    required this.sourceList,
    this.initialValue,
    this.onChanged,
    this.placeholder,
    this.readOnly = false,
  });
  final List<T> sourceList;
  final T? initialValue;
  final String? placeholder;
  final bool readOnly;
  final void Function(T value)? onChanged;
  final List<String Function(T value)> validators = [];
  final GlobalKey<_DropDownStringWidgetState> key = GlobalKey();

  void addValidator(String Function(T value) validator) {
    validators.add(validator);
  }

  // void clear() {
  //   if (key.currentState == null) return;
  //   key.currentState!.clear();
  // }

  @override
  _DropDownStringWidgetState<T> createState() => _DropDownStringWidgetState(
        onChanged: onChanged,
        placeholder: placeholder,
      );
}

class _DropDownStringWidgetState<T> extends State<DropDownWidget> {
  T? selectedItem;
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  final String? placeholder;

  set selectedValue(T value) => selectedItem = value;

  final void Function(T value)? onChanged;

  _DropDownStringWidgetState({this.onChanged, this.placeholder});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<T>> dropdownItems = [];
    for (T sourceListItem in widget.sourceList) {
      String text = sourceListItem.toString();
      if (sourceListItem is DropDownText) {
        text = sourceListItem.GetDropDownText();
      }
      DropdownMenuItem<T> newItem = DropdownMenuItem(
        child: Text(
          text,
          style: Fontes.getRoboto(
            fontSize: HelperFunctions.calculaFontSize(context, 16),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        value: sourceListItem,
        enabled: !widget.readOnly,
      );
      dropdownItems.add(newItem);
    }

    if (widget.sourceList.isNotEmpty && selectedItem == null) {
      selectedItem = widget.initialValue;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SizedBox(
            child: DropdownButtonFormField<T>(
              iconSize: 20,
              value: selectedItem,
              items: dropdownItems,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(value!);
                }
                setState(() {
                  selectedItem = value!;
                });
              },
              style: Fontes.getRoboto(
                letterSpacing: 0,
                cor: Colors.black,
                fontSize: HelperFunctions.calculaFontSize(context, 16),
              ),
              decoration: InputDecoration(
                label: Text(
                  placeholder!,
                  style: Fontes.getRoboto(
                    letterSpacing: 0,
                    fontSize: HelperFunctions.calculaFontSize(context, 16),
                    cor: errorText.isEmpty
                        ? Cores.corPlaceholderTextField
                        : Colors.red,
                  ),
                ),
                enabled: !widget.readOnly,
              ),
            ),
          ),
        ),
        const Visibility(
          visible: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Error',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void validate() {
    String error = '';
    for (String Function(T value) validator in widget.validators) {
      error = validator(selectedItem!);
    }
    setState(() => errorText = error);
  }

  bool valid() {
    validate();
    return errorText.isEmpty;
  }

  // void clear() {
  //   setState(() {
  //     selectedItem == null;
  //   });
  // }
}

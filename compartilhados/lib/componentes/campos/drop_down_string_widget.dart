import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:flutter/material.dart';

typedef ValidateBuilder<T> = void Function(
  BuildContext context,
  bool Function() validateMethodBuilder,
);

class DropDownWidget<T> extends StatefulWidget {
  DropDownWidget({
    required this.sourceList,
    this.initialValue,
    this.onChanged,
    this.placeholder,
    this.readOnly = false,
    this.validator,
    this.validateBuilder,
  });
  final List<T> sourceList;
  final T? initialValue;
  final String? placeholder;
  final bool readOnly;
  final void Function(T value)? onChanged;
  final GlobalKey<_DropDownStringWidgetState> key = GlobalKey();
  final String? Function(T? obj)? validator;
  late final ValidateBuilder<T>? validateBuilder;

  @override
  _DropDownStringWidgetState<T> createState() => _DropDownStringWidgetState(
        onChanged: onChanged,
        placeholder: placeholder,
      );
}

class _DropDownStringWidgetState<T> extends State<DropDownWidget<T>> {
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

  _validate() {
    if (widget.validator == null) return;
    String? str = widget.validator!(selectedItem == null ? null : selectedItem);
    setState(() {
      errorText = str ?? '';
    });
  }

  bool valid() {
    _validate();
    return errorText.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    widget.validateBuilder?.call(
      context,
      valid,
    );
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
            fontSize: HelperFunctions.calculaFontSize(context, 14),
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

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
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
                    _validate();
                  });
                },
                style: Fontes.getRoboto(
                  letterSpacing: 0,
                  cor: Colors.black,
                  fontSize: HelperFunctions.calculaFontSize(context, 14),
                ),
                decoration: InputDecoration(
                  label: Text(
                    placeholder!,
                    style: Fontes.getRoboto(
                      letterSpacing: 0,
                      fontSize: HelperFunctions.calculaFontSize(context, 14),
                      cor: errorText.isEmpty
                          ? Cores.corPlaceholderTextField
                          : Colors.red,
                    ),
                  ),
                  disabledBorder: errorText.isNotEmpty
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(1)),
                        )
                      : null,
                  enabledBorder: errorText.isNotEmpty
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(1)),
                        )
                      : null,
                  focusedBorder: errorText.isNotEmpty
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(1),
                          ),
                        )
                      : widget.readOnly
                          ? const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(1),
                              ),
                            )
                          : null,
                  enabled: !widget.readOnly,
                ),
              ),
            ),
          ),
          Visibility(
            visible: errorText.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      errorText,
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
      ),
    );
  }
}

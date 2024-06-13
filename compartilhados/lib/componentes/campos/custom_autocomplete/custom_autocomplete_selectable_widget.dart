import 'dart:async';

import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/typeahed_export.dart';
import 'package:flutter/material.dart';

class CustomAutocompleteSelectableWidget<T> extends StatefulWidget {
  const CustomAutocompleteSelectableWidget({
    required this.title,
    required this.suggestionsCallback,
    required this.label,
    required this.onSelected,
    required this.selectedText,
    this.readonly = false,
    this.subtitle,
    this.initialValue,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String label;
  final Future<List<T>> Function(String) suggestionsCallback;
  final Widget Function(T) title;
  final Widget Function(T)? subtitle;
  final void Function(T? obj) onSelected;
  final String Function(T obj) selectedText;
  final T? initialValue;
  final String? Function(String?)? validator;
  final bool readonly;

  @override
  State<CustomAutocompleteSelectableWidget<T>> createState() =>
      _CustomAutocompleteSelectableWidgetState<T>();
}

class _CustomAutocompleteSelectableWidgetState<T>
    extends State<CustomAutocompleteSelectableWidget<T>> {
  T? selected;
  @override
  Widget build(BuildContext context) {
    final TextEditingController baseController = TextEditingController();
    baseController.text = widget.initialValue != null
        ? widget.selectedText(widget.initialValue!)
        : '';
    baseController.selection = TextSelection.fromPosition(
        TextPosition(offset: baseController.text.length));
    return TypeAheadField<T>(
      controller: baseController,
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      suggestionsCallback: widget.suggestionsCallback,
      builder: (context, controller, focusNode) {
        return TextFormField(
          readOnly: widget.readonly,
          enableSuggestions: false,
          enabled: !widget.readonly,
          onChanged: (str) => onChanged(context: context),
          focusNode: focusNode,
          onEditingComplete: () => onEditComplete(
            context: context,
            controller: controller,
          ),
          validator: widget.validator,
          style: Fontes.getRoboto(
            fontSize: HelperFunctions.calculaFontSize(context, 14),
          ),
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: widget.initialValue == null
                ? const SizedBox()
                : InkWell(
                    onTap: () =>
                        clear(context: context, controller: controller),
                    child: const Icon(
                      Icons.cancel_outlined,
                    ),
                  ),
            label: Text(
              widget.label,
              style: Fontes.getRoboto(
                fontSize: HelperFunctions.calculaFontSize(context, 14),
                letterSpacing: 0,
                cor: Cores.corPlaceholderTextField,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 3.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
        );
      },
      itemBuilder: (context, obj) {
        return ListTile(
          title: widget.title(obj),
          subtitle: widget.subtitle != null ? widget.subtitle!(obj) : null,
        );
      },
      onSelected: (T item) => selectItem(
        item: item,
        controller: baseController,
        context: context,
      ),
    );
  }

  void clear({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    widget.onSelected(null);
    selected = null;
  }

  void onChanged({
    required BuildContext context,
  }) {
    selected = null;
  }

  void onEditComplete({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    if (selected == null) {
      controller.text = '';
      widget.onSelected(selected);
    }
  }

  void selectItem({
    required T? item,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    widget.onSelected(item);
    selected = item;
    if (item != null) {
      controller.text = widget.selectedText(item);
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }
}

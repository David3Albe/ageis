import 'dart:async';

import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/typeahed_export.dart';
import 'package:flutter/material.dart';

class CustomAutocompleteWidget<T> extends StatelessWidget {
  const CustomAutocompleteWidget({
    required this.title,
    required this.suggestionsCallback,
    required this.label,
    required this.onChange,
    required this.onItemSelectedText,
    this.subtitle,
    this.initialValue,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String label;
  final Future<List<T>> Function(String) suggestionsCallback;
  final Widget Function(T) title;
  final Widget Function(T)? subtitle;
  final void Function(String? str) onChange;
  final String? Function(T item) onItemSelectedText;
  final String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    if (initialValue != null) controller.text = initialValue!;
    return TypeAheadField<T>(
      controller: controller,
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      suggestionsCallback: suggestionsCallback,
      builder: (context, controller, focusNode) {
        controller.addListener(
          () {
            onChange(controller.text.isEmpty ? null : controller.text);
          },
        );
        return TextFormField(
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          style: Fontes.getRoboto(
            fontSize: HelperFunctions.calculaFontSize(context, 14),
          ),
          decoration: InputDecoration(
            label: Text(
              label,
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
          title: title(obj),
          subtitle: subtitle != null ? subtitle!(obj) : null,
        );
      },
      onSelected: (T item) {
        String? str = onItemSelectedText(item);
        onChange(str);
        controller.text = str ?? '';
      },
    );
  }
}

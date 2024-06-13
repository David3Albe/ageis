import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/text_field_type.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldMaskWidget extends StatefulWidget {
  TextFieldMaskWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    required this.type,
  });

  final String placeholder;
  final bool password;
  final bool readOnly;
  final TextFieldType type;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldMaskWidgetState> key =
      GlobalKey<_TextFieldMaskWidgetState>();
  final void Function(String str)? onChanged;

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldMaskWidget> createState() => _TextFieldMaskWidgetState(
        key: key,
        onChanged: onChanged,
      );
}

class _TextFieldMaskWidgetState extends State<TextFieldMaskWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  TextEditingController controller = TextEditingController();
  final void Function(String str)? onChanged;

  _TextFieldMaskWidgetState({required Key key, this.onChanged});

  TextInputFormatter getTextInputFormatter() {
    switch (widget.type) {
      case TextFieldType.Cnpj:
        return CnpjInputFormatter();
      case TextFieldType.Phone:
        return PhoneInputFormatter();
      case TextFieldType.Cpf:
        return CpfInputFormatter();
      case TextFieldType.Rg:
        return RgInputFormatter();
      default:
        return FilteringTextInputFormatter.digitsOnly;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget._controller,
          onChanged: (String? str) {
            if (!widget.readOnly) {
              validate();
              if (onChanged != null) onChanged!(str == null ? '' : str);
            }
          },
          inputFormatters: [getTextInputFormatter()],
          obscureText: !visible && widget.password,
          obscuringCharacter: '*',
          autocorrect: false,
          style: Fontes.getRoboto(
            cor: errorText.isNotEmpty ? Colors.red : null,
            letterSpacing: !visible && widget.password ? 5 : 0,
            fontSize: HelperFunctions.calculaFontSize(context, 14),
          ),
          decoration: InputDecoration(
            suffixIcon: widget.password
                ? InkWell(
                    onTap: () => setState(
                      () => visible = !visible,
                    ),
                    child: visible
                        ? Icones.iconeSenhaVisivel
                        : Icones.iconeSenhaInvisivel,
                  )
                : null,
            label: Text(
              widget.placeholder,
              style: Fontes.getRoboto(
                letterSpacing: 0,
                fontSize: HelperFunctions.calculaFontSize(context, 14),
                cor: errorText.isEmpty
                    ? Cores.corPlaceholderTextField
                    : Colors.red,
              ),
            ),
            enabledBorder: errorText.isNotEmpty
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
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
                : null,
            enabled: !widget.readOnly,
          ),
          readOnly: widget.readOnly,
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
    );
  }

  void validate() {
    String error = '';
    for (String Function(String str) validador in widget.validators) {
      error = validador(widget._controller.text);
    }
    setState(() => errorText = error);
  }

  bool valid() {
    validate();
    return errorText.isEmpty;
  }
}

class CnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length <= 2) {
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else if (text.length <= 5) {
      return TextEditingValue(
        text: '${text.substring(0, 2)}.${text.substring(2)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 8) {
      return TextEditingValue(
        text:
            '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5)}',
        selection: TextSelection.collapsed(offset: text.length + 2),
      );
    } else if (text.length <= 12) {
      return TextEditingValue(
        text:
            '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}/${text.substring(8)}',
        selection: TextSelection.collapsed(offset: text.length + 3),
      );
    } else {
      return TextEditingValue(
        text:
            '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}/${text.substring(8, 12)}-${text.substring(12, 14)}',
        selection: TextSelection.collapsed(offset: text.length + 4),
      );
    }
  }
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length <= 3) {
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else if (text.length <= 6) {
      return TextEditingValue(
        text: '${text.substring(0, 3)}.${text.substring(3)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 9) {
      return TextEditingValue(
        text:
            '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6)}',
        selection: TextSelection.collapsed(offset: text.length + 2),
      );
    } else {
      return TextEditingValue(
        text:
            '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9, 11)}',
        selection: TextSelection.collapsed(offset: text.length + 3),
      );
    }
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length <= 10) {
      return TextEditingValue(
        text:
            '(${text.substring(0, 2)}) ${text.substring(2, 6)}-${text.substring(6)}',
        selection: TextSelection.collapsed(offset: text.length + 5),
      );
    } else {
      return TextEditingValue(
        text:
            '(${text.substring(0, 2)}) ${text.substring(2, 7)}-${text.substring(7, 11)}',
        selection: TextSelection.collapsed(offset: text.length + 6),
      );
    }
  }
}

class RgInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length <= 2) {
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else if (text.length <= 5) {
      return TextEditingValue(
        text: '${text.substring(0, 2)}.${text.substring(2)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 8) {
      return TextEditingValue(
        text:
            '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5)}',
        selection: TextSelection.collapsed(offset: text.length + 2),
      );
    } else {
      return TextEditingValue(
        text:
            '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}',
        selection: TextSelection.collapsed(offset: text.length + 3),
      );
    }
  }
}

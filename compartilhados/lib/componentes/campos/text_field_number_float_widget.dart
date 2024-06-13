import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldNumberFloatWidget extends StatefulWidget {
  TextFieldNumberFloatWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    this.negative = false,
  });

  final String placeholder;
  final bool negative;
  final bool password;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldNumberFloatWidgetState> key =
      GlobalKey<_TextFieldNumberFloatWidgetState>();
  final void Function(String str)? onChanged;
  final bool readOnly;

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldNumberFloatWidget> createState() =>
      _TextFieldNumberFloatWidgetState(
        key: key,
        onChanged: onChanged,
      );
}

class _TextFieldNumberFloatWidgetState
    extends State<TextFieldNumberFloatWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  TextEditingController controller = TextEditingController();
  final void Function(String str)? onChanged;

  _TextFieldNumberFloatWidgetState({required Key key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    String negative = widget.negative ? '-' : '';
    String expressao = '[0-9,.$negative]';
    RegExp regex = RegExp(expressao);
    return Column(
      children: [
        TextFormField(
          controller: widget._controller,
          onChanged: (String? str) {
            validate();
            if (onChanged != null) {
              onChanged!(
                str == null ? '' : str.replaceAll('.', '').replaceAll(',', '.'),
              );
            }
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(regex),
          ],
          keyboardType: TextInputType.number,
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
                fontSize: HelperFunctions.calculaFontSize(context, 14),
                letterSpacing: 0,
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
          ),
          readOnly: widget.readOnly,
          enabled: !widget.readOnly,
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

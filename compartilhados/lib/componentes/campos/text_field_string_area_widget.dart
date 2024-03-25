import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';

class TextFieldStringAreaWidget extends StatefulWidget {
  TextFieldStringAreaWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    this.onEditComplete,
    this.onTapOutside,
    this.focus,
  });

  final String placeholder;
  final bool password;
  final bool readOnly;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldStringAreaWidgetState> key =
      GlobalKey<_TextFieldStringAreaWidgetState>();
  final void Function(String str)? onChanged;
  final Function()? onEditComplete;
  final Function(PointerDownEvent)? onTapOutside;
  final FocusNode? focus;

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldStringAreaWidget> createState() =>
      _TextFieldStringAreaWidgetState(
        key: key,
        onChanged: onChanged,
      );
}

class _TextFieldStringAreaWidgetState extends State<TextFieldStringAreaWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  TextEditingController controller = TextEditingController();
  final void Function(String str)? onChanged;

  _TextFieldStringAreaWidgetState({required Key key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: widget.focus,
          onTapOutside: widget.onTapOutside,
          onEditingComplete: widget.onEditComplete,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
          controller: widget._controller,
          onChanged: (String? str) {
            validate();
            if (onChanged != null) onChanged!(str == null ? '' : str);
          },
          obscureText: !visible && widget.password,
          obscuringCharacter: '*',
          autocorrect: false,
          style: Fontes.getRoboto(
            fontSize: HelperFunctions.calculaFontSize(context, 16),
            cor: errorText.isNotEmpty ? Colors.red : null,
            letterSpacing: !visible && widget.password ? 5 : 0,
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
                fontSize: HelperFunctions.calculaFontSize(context, 16),
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

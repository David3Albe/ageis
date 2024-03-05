import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';

class TextFieldStringWithBorderWidget extends StatefulWidget {
  TextFieldStringWithBorderWidget({
    required this.placeholder,
    this.password = false,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    Key? key,
  });

  final GlobalKey<_TextFieldStringWithBorderWidgetState> key =
      GlobalKey<_TextFieldStringWithBorderWidgetState>();

  final String placeholder;
  final bool password;
  final String Function(String? str)? validator;
  final TextInputAction? textInputAction;
  final void Function(String? str)? onFieldSubmitted;

  String get text => key.currentState!.controller.text;

  bool valid() {
    if (validator != null) key.currentState!.validate();
    return key.currentState!.valid();
  }

  void validate() {
    if (validator != null) key.currentState!.validate();
  }

  @override
  State<TextFieldStringWithBorderWidget> createState() =>
      _TextFieldStringWithBorderWidgetState(
        key: key,
        textInputAction: textInputAction,
      );
}

class _TextFieldStringWithBorderWidgetState
    extends State<TextFieldStringWithBorderWidget> {
  _TextFieldStringWithBorderWidgetState({
    Key? key,
    this.textInputAction,
  });
  final FocusNode focusNode = FocusNode();
  final TextInputAction? textInputAction;

  final TextEditingController controller = TextEditingController();
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() => textChanged = controller.text);
    });
    focusNode.addListener(() {
      setState(() => focused = focusNode.hasFocus);
    });
    return Column(
      children: [
        Material(
          elevation: 5,
          shadowColor: Colors.grey,
          child: TextField(
            textInputAction: textInputAction,
            onChanged: (value) {
              String error = '';
              if (widget.validator != null) {
                String? validatedString = widget.validator!(value);
                error = validatedString;
              }
              setState(() {
                errorText = error;
              });
              return null;
            },
            obscureText: !visible && widget.password,
            obscuringCharacter: '*',
            autocorrect: false,
            controller: controller,
            focusNode: focusNode,
            onSubmitted: widget.onFieldSubmitted,
            style: Fontes.getRoboto(
              cor: Cores.corLetrasTextFieldLogin,
              fontSize: 19,
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
              fillColor: Cores.corFundoTextField,
              filled: true,
              label: Padding(
                padding: focused || textChanged.isNotEmpty
                    ? const EdgeInsets.only(bottom: 24.0)
                    : const EdgeInsets.all(0),
                child: Text(
                  widget.placeholder,
                  style: Fontes.getRoboto(
                    letterSpacing: 0,
                    cor: Cores.corPlaceholderTextField,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText.isNotEmpty ? Colors.red : Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText.isNotEmpty ? Colors.red : Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(1),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorText.isNotEmpty ? Colors.red : Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(1),
                ),
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
    );
  }

  bool valid() => errorText.isEmpty;

  void validate() {
    String error = '';
    if (widget.validator != null) {
      String? validatedString = widget.validator!(controller.text);
      error = validatedString;
    }
    setState(() {
      errorText = error;
    });
  }
}

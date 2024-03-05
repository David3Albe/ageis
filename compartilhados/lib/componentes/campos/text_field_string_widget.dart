import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';

typedef SetValueBuilder = void Function(
  BuildContext context,
  Function(String?) setValue,
);

class TextFieldStringWidget extends StatefulWidget {
  TextFieldStringWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.focus,
    this.setReadonlyBuilder,
    this.setValueBuilder,
  });

  final String placeholder;
  final String? initialValue;
  final bool password;
  final bool readOnly;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldStringWidgetState> key =
      GlobalKey<_TextFieldStringWidgetState>();
  final void Function(String str)? onChanged;
  final FocusNode? focus;
  final SetReadonlyBuilder? setReadonlyBuilder;
  final SetValueBuilder? setValueBuilder;

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldStringWidget> createState() => _TextFieldStringWidgetState(
        key: key,
        onChanged: onChanged,
        initialValue: initialValue,
        setReadonlyBuilder: setReadonlyBuilder,
      );
}

typedef SetReadonlyBuilder = void Function(
  BuildContext context,
  Function(bool) setReadonly,
);

class _TextFieldStringWidgetState extends State<TextFieldStringWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  final String? initialValue;
  TextEditingController controller = TextEditingController();
  final void Function(String str)? onChanged;
  bool readonly = false;
  final SetReadonlyBuilder? setReadonlyBuilder;

  _TextFieldStringWidgetState({
    required Key key,
    this.setReadonlyBuilder,
    this.onChanged,
    this.initialValue,
  });

  @override
  void initState() {
    if (initialValue != null) widget._controller.text = initialValue!;
    readonly = widget.readOnly;
    super.initState();
  }

  void setReadonly(bool readonly) {
    setState(() {
      this.readonly = readonly;
    });
  }

  void setValue(String? value) {
    widget._controller.text = value ?? '';
    validate();
    if (onChanged != null) onChanged!(value ?? '');
  }

  void change(String? str) {
    if (!widget.readOnly) {
      validate();
      if (onChanged != null) onChanged!(str == null ? '' : str);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.setValueBuilder?.call(
      context,
      setValue,
    );
    setReadonlyBuilder?.call(
      context,
      setReadonly,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          focusNode: widget.focus,
          controller: widget._controller,
          onChanged: change,
          obscureText: !visible && widget.password,
          obscuringCharacter: '*',
          autocorrect: false,
          style: Fontes.getRoboto(
            cor: errorText.isNotEmpty ? Colors.red : null,
            letterSpacing: !visible && widget.password ? 5 : 0,
            fontSize: HelperFunctions.calculaFontSize(context, 18),
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
            enabled: !readonly,
          ),
          readOnly: readonly,
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

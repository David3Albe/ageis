import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef SetReadonlyBuilder = void Function(
  BuildContext context,
  Function(bool) setReadonly,
);

class TextFieldNumberWidget extends StatefulWidget {
  TextFieldNumberWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    this.startValue,
    this.setReadonlyBuilder,
  });

  final String placeholder;
  final bool password;
  final bool readOnly;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldNumberWidgetState> key =
      GlobalKey<_TextFieldNumberWidgetState>();
  final void Function(String str)? onChanged;
  final int? startValue;
  final SetReadonlyBuilder? setReadonlyBuilder;

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldNumberWidget> createState() => _TextFieldNumberWidgetState(
        key: key,
        onChanged: onChanged,
        readonly: readOnly,
        setReadonlyBuilder: setReadonlyBuilder,
      );
}

class _TextFieldNumberWidgetState extends State<TextFieldNumberWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  final void Function(String str)? onChanged;
  DateTime? lastTypedTime;
  final SetReadonlyBuilder? setReadonlyBuilder;
  bool readonly;

  _TextFieldNumberWidgetState({
    required Key key,
    required this.readonly,
    this.onChanged,
    this.setReadonlyBuilder,
  });
  @override
  void initState() {
    if (widget.startValue != null) {
      widget._controller.text = widget.startValue.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  Future changed(String? str) async {
    validate();
    if (onChanged != null) onChanged!(str == null ? '' : str);
  }

  void setReadonly(bool readonly) {
    setState(() {
      this.readonly = readonly;
    });
  }

  @override
  Widget build(BuildContext context) {
    setReadonlyBuilder?.call(
      context,
      setReadonly,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: widget._controller,
          onChanged: changed,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
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

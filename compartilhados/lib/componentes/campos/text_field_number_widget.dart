import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:compartilhados/icones/icones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldNumberWidget extends StatefulWidget {
  TextFieldNumberWidget({
    required this.placeholder,
    this.password = false,
    this.onChanged,
    this.readOnly = false,
    this.startValue,
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

  set text(String value) => _controller.text = value;

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  String get text => _controller.text;
  bool get valid => key.currentState!.valid();

  @override
  State<TextFieldNumberWidget> createState() => _TextFieldNumberWidgetState(
        key: key,
        onChanged: onChanged,
      );
}

class _TextFieldNumberWidgetState extends State<TextFieldNumberWidget> {
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';
  late TextEditingController controller;
  final void Function(String str)? onChanged;
  DateTime? lastTypedTime;

  _TextFieldNumberWidgetState({required Key key, this.onChanged});
  @override
  void initState() {
    controller = TextEditingController();
    if (widget.startValue != null) {
      controller.text = widget.startValue.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<bool> validateDurationOnChanged() async {
    lastTypedTime = DateTime.now();
    DateTime lastTimeValidation = lastTypedTime!;
    Duration duration = const Duration(milliseconds: 1500);
    await Future.delayed(duration);
    return (lastTypedTime == lastTimeValidation);
  }

  Future changed(String? str) async {
    bool valid = await validateDurationOnChanged();
    if (!valid) return;
    validate();
    if (onChanged != null) onChanged!(str == null ? '' : str);
  }

  @override
  Widget build(BuildContext context) {
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

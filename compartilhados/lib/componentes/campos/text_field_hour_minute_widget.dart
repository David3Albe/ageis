import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef SetReadonlyBuilder<T> = void Function(
  BuildContext context,
  void Function(bool readonly) setReadonlyBuilder,
);

class TextFieldHourMinuteWidget extends StatefulWidget {
  final String placeholder;
  final String? initialValue;
  final void Function(String) onComplete;
  final bool readOnly;
  final SetReadonlyBuilder? setReadonlyBuilder;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TextFieldHourMinuteWidgetState> key =
      GlobalKey<_TextFieldHourMinuteWidgetState>();
  String get text => _controller.text;
  set text(String value) => _controller.text = value;

  TextFieldHourMinuteWidget({
    required this.placeholder,
    required this.onComplete,
    this.initialValue,
    this.readOnly = false,
    this.setReadonlyBuilder,
  });

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  bool get valid => key.currentState!.valid();

  @override
  _TextFieldHourMinuteWidgetState createState() =>
      _TextFieldHourMinuteWidgetState(
        key: key,
      );
}

class _TextFieldHourMinuteWidgetState extends State<TextFieldHourMinuteWidget> {
  FocusNode focusNode = FocusNode();
  late bool readOnly;
  String errorText = '';
  _TextFieldHourMinuteWidgetState({
    required Key key,
  });

  @override
  void initState() {
    super.initState();
    readOnly = widget.readOnly;

    if (widget.initialValue == null) {
      widget._controller.text = '';
    } else {
      widget._controller.text = widget.initialValue!;
    }
   focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        onComplete();
      }
    });
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

  void setReadonly(bool readonly) {
    setState(() {
      readOnly = readonly;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void onComplete() {
    if (widget.text.isEmpty) {
      widget.onComplete('');
      return;
    }
    String text = widget._controller.text.replaceAll(':', '');
    if (text.length <= 3) {
      widget._controller.text = '$text:00';
      widget.onComplete(widget._controller.text);
    } else {
      String startText = text.substring(0, text.length - 2);
      String endText = text.substring(text.length - 2, text.length);
      widget._controller.text = '$startText:$endText';
      widget.onComplete(widget._controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.setReadonlyBuilder?.call(
      context,
      setReadonly,
    );
    String expressao = r'^\d{0,5}:\d{0,5}$|^\d{1,6}$';
    RegExp regex = RegExp(expressao);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          focusNode: focusNode,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(regex),
          ],
          onEditingComplete: onComplete,
          controller: widget._controller,
          keyboardType: TextInputType.number,
          //inputFormatters: [maskFormatter],
          style: Fontes.getRoboto(
            fontSize: HelperFunctions.calculaFontSize(context, 14),
            cor: errorText.isNotEmpty
                ? Colors.red
                : widget.readOnly
                    ? Colors.grey
                    : null,
          ),
          decoration: InputDecoration(
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
            disabledBorder: errorText.isNotEmpty
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
                  )
                : null,
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
          ),
          readOnly: readOnly,
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
}

// ignore_for_file: unnecessary_import
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

typedef SetDateValueBuilder = void Function(
  BuildContext context,
  void Function(DateTime? date) setDateMethod,
);

typedef SetReadonlyBuilder<T> = void Function(
  BuildContext context,
  void Function(bool readonly, bool clear) setReadonlyBuilder,
);

typedef ValidateBuilder<DateTime> = void Function(
  BuildContext context,
  bool Function() validateMethodBuilder,
);

class TextFieldAnoMesWidget extends StatefulWidget {
  final String placeholder;
  final void Function(DateTime? selectedDate)? onDateSelected;
  late final DateTime? initialValue;
  final bool readOnly;
  final GlobalKey<_TextFieldAnoMesWidgetState> key = GlobalKey();
  final SetDateValueBuilder? setDateValueBuilder;
  final SetReadonlyBuilder? setReadonlyBuilder;
  final DateFormat? formato;
  final String? Function(DateTime? date)? validator;
  late final ValidateBuilder<DateTime>? validateBuilder;

  TextFieldAnoMesWidget({
    required this.placeholder,
    this.onDateSelected,
    this.initialValue,
    this.readOnly = false,
    this.setDateValueBuilder,
    this.setReadonlyBuilder,
    this.formato,
    this.validator,
    this.validateBuilder,
  });

  void clear() {
    if (key.currentState == null) return;
    key.currentState!.clear();
  }

  void setValue(DateTime? date) {
    if (key.currentState == null) return;
    key.currentState!.setValue(date);
  }

  @override
  _TextFieldAnoMesWidgetState createState() =>
      _TextFieldAnoMesWidgetState(key: key, readOnly: readOnly);
}

class _TextFieldAnoMesWidgetState extends State<TextFieldAnoMesWidget> {
  _TextFieldAnoMesWidgetState({required this.readOnly, required Key key});
  DateTime? selectedDate;
  late TextEditingController textController;
  late FocusNode focusNode;
  late DateFormat format;
  bool? readOnly;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    focusNode = FocusNode();
    format = DateFormat('yyyy/MM');
    if (widget.formato != null) {
      format = widget.formato!;
    }

    selectedDate = null;
    textController.text = '';

    if (widget.initialValue != null) {
      selectedDate = widget.initialValue!;
      textController.text = format.format(selectedDate!);
    }
    focusNode.addListener(onEditComplete);
  }

  void setDateValue(DateTime? date) {
    setState(() {
      selectedDate = date;
      _validate();
      if (date == null) {
        textController.text = '';
        return;
      }
      textController.text = format.format(date);
      if (widget.onDateSelected != null) widget.onDateSelected!(date);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void clear() {
    setState(() {
      selectedDate = null;
      _validate();
      textController.text = '';
    });
  }

  void setValue(DateTime? date) {
    setState(() {
      selectedDate = date;
      _validate();
      if (date == null) {
        textController.text = '';
        return;
      }
      textController.text = format.format(date);
    });
  }

  void setReadonly(bool readonly, bool clear) {
    setState(() {
      readOnly = readonly;
      if (clear) setValue(null);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked == null) return;
    selectedDate = picked;
    _validate();
    textController.text =
        selectedDate != null ? format.format(selectedDate!) : '';
    if (widget.onDateSelected != null) widget.onDateSelected!(picked);
  }

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '####/##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  void onEditComplete() {
    String maskedtext = maskFormatter.maskText(textController.text);
    if (maskedtext.length == 4) {
      maskedtext += '/' +
          DateTime.now().month.toString().padLeft(2, '0') +
          '/' +
          DateTime.now().year.toString();
      textController.text = maskedtext;
    }

    if (textController.text.isEmpty || textController.text.length != 7) {
      selectedDate = null;
      _validate();
      if (widget.onDateSelected != null) widget.onDateSelected!(selectedDate);
      return;
    }

    setState(() {
      DateTime? data;
      data = format.parse(maskedtext);
      textController.text = format.format(data);
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
      selectedDate = data;
      _validate();
      if (widget.onDateSelected != null) widget.onDateSelected!(selectedDate);
    });
  }

  _validate() {
    if (widget.validator == null) return;
    String? str = widget.validator!(selectedDate);
    setState(() {
      errorText = str ?? '';
    });
  }

  bool valid() {
    _validate();
    return errorText.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    widget.setDateValueBuilder?.call(
      context,
      setDateValue,
    );
    widget.setReadonlyBuilder?.call(
      context,
      setReadonly,
    );
    widget.validateBuilder?.call(
      context,
      valid,
    );
    return Column(
      children: [
        TextFormField(
          focusNode: focusNode,
          controller: textController,
          enableInteractiveSelection: true,
          keyboardType: TextInputType.datetime,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
                widget.formato?.pattern?.length ?? 7),
            _AnoMesInputFormatter(),
          ],
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
            suffixIcon: InkWell(
              onTap: () => _selectDate(context),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.calendar_today,
                  color: Cores.corPlaceholderTextField,
                  size: HelperFunctions.calculaFontSize(context, 14),
                ),
              ),
            ),
          ),
          readOnly: readOnly == true,
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

class _AnoMesInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i == 4) {
        buffer.write('/');
      }
      if (newText[i] != '/' && (newText[i].isNotEmpty)) {
        buffer.write(newText[i]);
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
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

class DatePickerWidget extends StatefulWidget {
  final String placeholder;
  final void Function(DateTime? selectedDate)? onDateSelected;
  late final DateTime? initialValue;
  final bool readOnly;
  final GlobalKey<_DatePickerWidgetState> key = GlobalKey();
  final SetDateValueBuilder? setDateValueBuilder;
  final SetReadonlyBuilder? setReadonlyBuilder;
  final DateFormat? formato;

  DatePickerWidget({
    required this.placeholder,
    this.onDateSelected,
    this.initialValue,
    this.readOnly = false,
    this.setDateValueBuilder,
    this.setReadonlyBuilder,
    this.formato,
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
  _DatePickerWidgetState createState() =>
      _DatePickerWidgetState(key: key, readOnly: readOnly);
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  _DatePickerWidgetState({required this.readOnly, required Key key});
  DateTime? selectedDate;
  late TextEditingController textController;
  late FocusNode focusNode;
  late DateFormat format;
  bool? readOnly;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    focusNode = FocusNode();
    format = DateFormat('dd/MM/yyyy');
    if (widget.formato != null) {
      format = widget.formato!;
    }

    if (widget.initialValue != null) {
      selectedDate = widget.initialValue!;
      textController.text = format.format(selectedDate!);
    } else {
      selectedDate = null;
      textController.text = '';
    }
    textController.addListener(_onTextChanged);
    focusNode.addListener(onEditComplete);
  }

  void setDateValue(DateTime? date) {
    setState(() {
      selectedDate = date;
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

  void _onTextChanged() {
    // String text = maskFormatter.maskText(textController.text);
    // DateFormat format = DateFormat('dd/MM/yyyy');
    // DateTime? data;
    // if (text.length == 10 && lastText.length != textController.text.length) {
    //   data = format.parse(text);
    //   textController.text = format.format(data);
    //   textController.selection = TextSelection.fromPosition(
    //     TextPosition(offset: textController.text.length),
    //   );
    //   return;
    // }
    // setState(() {
    //   selectedDate = data;
    //   if (widget.onDateSelected != null) widget.onDateSelected!(selectedDate);
    // });
  }

  void clear() {
    setState(() {
      selectedDate = null;
      textController.text = '';
    });
  }

  void setValue(DateTime? date) {
    setState(() {
      selectedDate = date;
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
    selectedDate = picked;
    textController.text =
        selectedDate != null ? format.format(selectedDate!) : '';
    if (widget.onDateSelected != null) widget.onDateSelected!(picked);
  }

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  void onEditComplete() {
    String maskedtext = maskFormatter.maskText(textController.text);
    if (maskedtext.length == 2) {
      maskedtext += '/' +
          DateTime.now().month.toString().padLeft(2, '0') +
          '/' +
          DateTime.now().year.toString();
      textController.text = maskedtext;
    } else if (maskedtext.length == 5) {
      maskedtext += '/' + DateTime.now().year.toString();
      textController.text = maskedtext;
    }

    if (textController.text.isEmpty || textController.text.length != 10) {
      selectedDate = null;
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
      if (widget.onDateSelected != null) widget.onDateSelected!(selectedDate);
    });
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
    return TextFormField(
      scrollPadding: EdgeInsets.zero,
      focusNode: focusNode,
      controller: textController,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.formato?.pattern?.length ?? 10),
        maskFormatter,
      ],
      style: TextStyle(
        fontSize: HelperFunctions.calculaFontSize(context, 16),
      ),
      decoration: InputDecoration(
        label: Text(
          widget.placeholder,
          style: Fontes.getRoboto(
            letterSpacing: 0,
            fontSize: HelperFunctions.calculaFontSize(context, 16),
            cor: Cores.corPlaceholderTextField,
          ),
        ),
        isDense: true,
        suffixIcon: InkWell(
          onTap: () => _selectDate(context),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.calendar_today,
              color: Cores.corPlaceholderTextField,
              size: HelperFunctions.calculaFontSize(context, 20),
            ),
          ),
        ),
      ),
      enabled: readOnly == false,
      readOnly: readOnly == true,
    );
  }
}

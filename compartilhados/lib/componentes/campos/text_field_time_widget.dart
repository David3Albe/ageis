import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

typedef SetReadonlyBuilder<T> = void Function(
  BuildContext context,
  void Function(bool readonly) setReadonlyBuilder,
);

class TimePickerWidget extends StatefulWidget {
  final String placeholder;
  final void Function(TimeOfDay? selectedTime)? onTimeSelected;
  final TimeOfDay? initialValue;
  final bool readOnly;
  final SetReadonlyBuilder? setReadonlyBuilder;
  final List<String Function(String str)> validators = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<_TimePickerWidgetState> key =
      GlobalKey<_TimePickerWidgetState>();
  String get text => _controller.text;
  set text(String value) => _controller.text = value;

  TimePickerWidget({
    required this.placeholder,
    this.onTimeSelected,
    this.initialValue,
    this.readOnly = false,
    this.setReadonlyBuilder,
  });

  void setValue(TimeOfDay? time) {
    if (key.currentState == null) return;
    key.currentState!.setValue(time);
  }

  void addValidator(String Function(String str) validator) =>
      validators.add(validator);

  bool get valid => key.currentState!.valid();

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState(
        key: key,
      );
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay? selectedTime;
  FocusNode focusNode = FocusNode();
  late bool readOnly;
  String errorText = '';
  _TimePickerWidgetState({
    required Key key,
  });

  @override
  void initState() {
    super.initState();
    readOnly = widget.readOnly;

    if (widget.initialValue == null) {
      selectedTime = null;
      widget._controller.text = '';
    } else {
      selectedTime = widget.initialValue!;
      widget._controller.text = formatTime(selectedTime!);
    }

    widget._controller.addListener(_onTextChanged);
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

  void setValue(TimeOfDay? time) {
    setState(() {
      selectedTime = time;
      if (time == null) {
        widget._controller.text = '';
        return;
      }
      widget._controller.text = formatTime(time);
    });
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onTextChanged);
    focusNode.dispose();
    super.dispose();
  }

  String lastText = '';

  void setaTextoController(String texto) {
    widget._controller.text = texto;
    widget._controller.selection = TextSelection.fromPosition(
      TextPosition(offset: widget._controller.text.length),
    );
    lastText = texto;
  }

  void _onTextChanged() {
    final text = widget._controller.text;
    print(text);
    if (text.length == 2 && lastText.length != 3) {
      setaTextoController(text + ':');
      return;
    } else if (lastText.length == 3 && text.length == 2) {
      setaTextoController(text.substring(0, 1));
      return;
    } else if (text.length > 5) {
      setaTextoController(text.substring(0, 5));
      return;
    }
    lastText = widget._controller.text;
    TimeOfDay? tempo;
    int? hora;
    int? minuto;
    if (text.length == 1 || text.length == 2 || text.length == 3) {
      hora = int.tryParse(text.replaceAll(':', ''));
      if (hora != null && hora > 23) widget._controller.text = '23';
    } else if (text.length == 4 || text.length == 5) {
      String textoController = '';
      hora = int.tryParse(text.substring(0, 2));
      if (hora != null && hora > 23) textoController = '23';
      minuto = int.tryParse(text.substring(3).replaceAll(':', ''));
      if (minuto != null && minuto > 59) textoController += ':59';
      if (textoController.isNotEmpty) setaTextoController(textoController);
    }
    if (hora != null && hora > 23) hora = 23;
    if (minuto != null && minuto > 59) minuto = 59;
    if (hora == null && minuto == null) {
      selectedTime = null;
      widget.onTimeSelected!(selectedTime);
      return;
    }
    tempo = TimeOfDay(hour: hora ?? 0, minute: minuto ?? 0);
    selectedTime = tempo;
    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(selectedTime);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? const TimeOfDay(hour: 0, minute: 0),
    );
    setState(() {
      selectedTime = picked;
      lastText = '';
      if (picked != null) {
        lastText =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      }
      widget._controller.text = formatTime(selectedTime);
      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(selectedTime);
      }
    });
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return '';
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    widget.setReadonlyBuilder?.call(
      context,
      setReadonly,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: widget._controller,
          keyboardType: TextInputType.datetime,
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
            suffixIcon: InkWell(
              onTap: () => _selectTime(context),
              child: const Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
            ),
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

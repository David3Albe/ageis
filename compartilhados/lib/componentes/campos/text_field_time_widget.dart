import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/helper_functions.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final String placeholder;
  final void Function(TimeOfDay? selectedTime)? onTimeSelected;
  final TimeOfDay? initialValue;
  final bool readOnly;

  TimePickerWidget({
    required this.placeholder,
    this.onTimeSelected,
    this.initialValue,
    this.readOnly = false,
  });

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimeOfDay? selectedTime;
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.initialValue == null) {
      selectedTime = null;
      textController.text = '';
    } else if (widget.initialValue != const TimeOfDay(hour: 0, minute: 0)) {
      selectedTime = widget.initialValue!;
      textController.text = formatTime(selectedTime!);
    } else {
      selectedTime = TimeOfDay.now();
      textController.text = '';
    }

    textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  String lastText = '';

  void setaTextoController(String texto) {
    textController.text = texto;
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
    lastText = texto;
  }

  void _onTextChanged() {
    final text = textController.text;
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
    lastText = textController.text;
    TimeOfDay? tempo;
    int? hora;
    int? minuto;
    if (text.length == 1 || text.length == 2 || text.length == 3) {
      hora = int.tryParse(text.replaceAll(':', ''));
      if (hora != null && hora > 23) textController.text = '23';
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
      textController.text = formatTime(selectedTime);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4.0),
        TextFormField(
          controller: textController,
          keyboardType: TextInputType.datetime,
          //inputFormatters: [maskFormatter],
          decoration: InputDecoration(
            label: Text(
              widget.placeholder,
              style: Fontes.getRoboto(
                letterSpacing: 0,
                fontSize: HelperFunctions.calculaFontSize(context, 16),
                cor: Cores.corPlaceholderTextField,
              ),
            ),
            suffixIcon: InkWell(
              onTap: () => _selectTime(context),
              child: const Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
            ),
          ),
          enabled: !widget.readOnly,
          readOnly: widget.readOnly,
        ),
      ],
    );
  }
}

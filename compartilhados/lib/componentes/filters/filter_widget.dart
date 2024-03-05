import 'package:compartilhados/main.dart';
import 'package:flutter/material.dart';

class FilterWidget<T> extends StatefulWidget {
  final String columnHeaderName;
  final String columnName;
  final void Function(String column, String filterValue) onApllyFilter;

  FilterWidget({
    required this.columnHeaderName,
    required this.columnName,
    required this.onApllyFilter,
  });

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late TextEditingController _filterController;

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filtrar por ${widget.columnHeaderName}'),
      content: TextField(
        controller: _filterController,
        decoration: const InputDecoration(labelText: 'Filtro'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancelar',
            selectionColor: Cores.corBotaoArquivo,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final filterValue = _filterController.text;
            widget.onApllyFilter(widget.columnName, filterValue);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Aplicar',
            selectionColor: Cores.corBotaoArquivo,
          ),
        ),
      ],
    );
  }
}

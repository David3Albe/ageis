import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_models/filters/afastamento/afastamento_filter.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:flutter/material.dart';

class AfastamentoFilterPage extends StatelessWidget {
  AfastamentoFilterPage({
    required this.filter,
    Key? key,
  });

  final AfastamentoFilter filter;

  @override
  Widget build(BuildContext context) {
    return FilterDialogWidget(
      child: Column(
        children: [
          TextFieldStringWidget(
            initialValue: filter.nomeUsuario,
            placeholder: 'Nome Colaborador',
            onChanged: (str) => {filter.nomeUsuario = str},
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: filter.numeroRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {
              filter.numeroRegistros = str.isEmpty ? null : int.parse(str),
            },
          ),
        ],
      ),
    );
  }
}

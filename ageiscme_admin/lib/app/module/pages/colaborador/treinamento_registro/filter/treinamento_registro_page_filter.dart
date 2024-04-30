import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/cubits/treinamento_registro_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TreinamentoRegistroPageFilter extends StatelessWidget {
  TreinamentoRegistroPageFilter({Key? key});

  @override
  Widget build(BuildContext context) {
    TreinamentoRegistroFilter dto = context.watch<TreinamentoRegistroCubitFilter>().state;
    return FilterDialogWidget(
      child: Column(
        children: [
          TextFieldStringWidget(
            initialValue: dto.nomeContem,
            placeholder: 'Nome',
            onChanged: (str) => {dto.nomeContem = str},
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: dto.numeroRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {
              dto.numeroRegistros = str.isEmpty ? null : int.parse(str),
            },
          ),
        ],
      ),
    );
  }
}

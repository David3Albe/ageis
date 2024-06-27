import 'package:ageiscme_admin/app/module/pages/material/item_descritor/cubits/item_descritor_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_models/filters/item_descritor/item_descritor_filter.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ItemDescritorPageFilter extends StatelessWidget {
  ItemDescritorPageFilter({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    ItemDescritorFilter dto = context.watch<ItemDescritorCubitFilter>().state;
    return FilterDialogWidget(
      child: Column(
        children: [
          TextFieldStringWidget(
            initialValue: dto.nomeContem,
            placeholder: 'Nome',
            onChanged: (str) => {
              dto.nomeContem = str,
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: dto.numeroMaximoRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {
              dto.numeroMaximoRegistros = str.isEmpty ? null : int.parse(str),
            },
          ),
        ],
      ),
    );
  }
}

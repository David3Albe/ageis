import 'package:ageiscme_admin/app/module/pages/material/kit/cubits/kit_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_string_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class KitPageFilter extends StatelessWidget {
  KitPageFilter({Key? key});
  @override
  Widget build(BuildContext context) {
    KitSearchDTO dto = context.watch<KitCubitFilter>().state;
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
          TextFieldStringWidget(
            initialValue: dto.codBarraContem,
            placeholder: 'Código',
            onChanged: (str) => {
              dto.codBarraContem = str,
            },
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

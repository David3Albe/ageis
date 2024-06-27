import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/widgets/filter_dialog/filter_dialog_widget.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/historico/search/historico_search_dto.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_api_widget.dart';
import 'package:compartilhados/componentes/campos/text_field_number_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FilterForm extends StatelessWidget {
  FilterForm({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    HistoricoSearchDTO dto = context.watch<FilterCubit>().state.dto;
    return FilterDialogWidget(
      child: Column(
        children: [
          DropDownSearchApiWidget<UsuarioModel>(
            textFunction: (usuario) => usuario.NomeText(),
            initialValue: dto.usuario,
            search: (str) => UsuarioService().Filter(
              UsuarioFilter(
                numeroRegistros: 30,
                termoPesquisa: str,
              ),
            ),
            onChanged: (value) {
              dto.usuario = value;
              dto.codUsuario = value?.cod;
            },
            placeholder: 'Usuário',
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          TextFieldNumberWidget(
            startValue: dto.numeroRegistros,
            placeholder: 'Número Registros',
            onChanged: (str) => {
              dto.numeroRegistros = str.isEmpty ? 0 : int.parse(str),
            },
          ),
        ],
      ),
    );
  }
}

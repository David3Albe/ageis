import 'dart:convert';

import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/detailed_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/detailed_state.dart';
import 'package:ageiscme_models/dto/chave_valor/chave_valor_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class DetailedGridWidget extends StatelessWidget {
  DetailedGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomDataColumn> colunas = getColunas(context);
    DetailedState state = context.watch<DetailedCubit>().state;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<ChaveValorDTO>(
          columns: colunas,
          items: getChaveValorItem(state),
        ),
      ),
    );
  }

  List<ChaveValorDTO> getChaveValorItem(DetailedState state) {
    HistoricoSearchItemResponseDTO? item = state.item;
    if (item == null) return [];
    Map jsonList = json.decode(item.dados);
    List<ChaveValorDTO> keyValueList = [];
    for (var key in jsonList.keys) {
      dynamic value = jsonList[key];
      try {
        DateTime data = DateTime.parse(value);
        DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
        value = formatter.format(data);
      } catch (e) {
        //
      }
      keyValueList.add(
        ChaveValorDTO(
          chave: key?.toString() ?? '',
          valor: value?.toString() ?? '',
        ),
      );
    }
    return keyValueList;
  }

  List<CustomDataColumn> getColunas(BuildContext context) {
    return [
      CustomDataColumn(
        text: 'Nome',
        field: 'chave',
      ),
      CustomDataColumn(
        text: ' Valor',
        field: 'valor',
      ),
    ];
  }
}

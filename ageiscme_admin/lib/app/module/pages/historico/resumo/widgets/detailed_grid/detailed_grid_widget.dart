import 'dart:convert';

import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/detailed_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/detailed_state.dart';
import 'package:ageiscme_models/dto/chave_valor/chave_valor_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class DetailedGridWidget extends StatefulWidget {
  DetailedGridWidget({Key? key}) : super(key: key);

  @override
  State<DetailedGridWidget> createState() => _DetailedGridWidgetState();
}

class _DetailedGridWidgetState extends State<DetailedGridWidget> {
  late ChaveValorDTO? Function(PlutoRow)? getObjectByRow;

  @override
  Widget build(BuildContext context) {
    List<CustomDataColumn> colunas = getColunas(context);
    DetailedState state = context.watch<DetailedCubit>().state;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<ChaveValorDTO>(
          getObjectByRowMethod: (context, getObjectByRowMethod) =>
              getObjectByRow = getObjectByRowMethod,
          columns: colunas,
          items: getChaveValorItem(state),
        ),
      ),
    );
  }

  List<ChaveValorDTO> getChaveValorItem(DetailedState state) {
    HistoricoSearchItemResponseDTO? item = state.item;
    HistoricoSearchItemResponseDTO? itemSuperior = state.itemSuperior;
    if (item == null) return [];
    Map jsonList = json.decode(item.dados);
    Map? jsonListSuperior;
    if (itemSuperior != null) {
      jsonListSuperior = json.decode(itemSuperior.dados);
    }
    List<ChaveValorDTO> keyValueList = [];
    for (var key in jsonList.keys) {
      dynamic value = jsonList[key];
      dynamic itemSuperiorValue;
      if (jsonListSuperior != null) {
        itemSuperiorValue = jsonListSuperior[key];
      }

      try {
        DateTime data = DateTime.parse(value);
        DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
        value = formatter.format(data);
      } catch (e) {
        //
      }
      try {
        DateTime data = DateTime.parse(itemSuperiorValue);
        DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
        itemSuperiorValue = formatter.format(data);
      } catch (e) {
        //
      }
      
      bool diferente = false;
      if (value != itemSuperiorValue &&
          jsonListSuperior != null &&
          !(value is List<dynamic>) &&
          !(itemSuperiorValue is List<dynamic>)) {
        diferente = true;
      }
      keyValueList.add(
        ChaveValorDTO(
          chave: key?.toString() ?? '',
          valor: value?.toString() ?? '',
          diferente: diferente,
        ),
      );
    }
    return keyValueList;
  }

  List<CustomDataColumn> getColunas(
    BuildContext context,
  ) {
    return [
      CustomDataColumn(
        text: 'Nome',
        field: 'chave',
        customRenderer: (renderContext) => getCustomRenderer(
          renderContext,
        ),
      ),
      CustomDataColumn(
        text: ' Valor',
        field: 'valor',
        customRenderer: (renderContext) => getCustomRenderer(
          renderContext,
        ),
      ),
    ];
  }

  Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    ChaveValorDTO? obj;
    if (getObjectByRow != null) {
      obj = getObjectByRow!(renderContext.row);
    }
    if (obj?.diferente == true) {
      cor = Cores.corTextoVermelho;
    }

    return Text(
      renderContext.cell.value.toString(),
      textAlign: textAlign,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: cor,
        fontSize: renderContext.stateManager.style.cellTextStyle.fontSize,
      ),
    );
  }
}

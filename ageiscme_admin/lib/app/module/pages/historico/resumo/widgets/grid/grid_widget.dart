import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/detailed_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/states/search_state.dart';
import 'package:ageiscme_models/response_dto/historico/search/historico_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomDataColumn> colunas = getColunas(context);
    SearchState state = context.watch<SearchCubit>().state;
    HistoricoSearchResponseDTO? dto = state.response;
    if (state.loading == true) return const Center(child: LoadingWidget());
    context.read<DetailedCubit>().detail(state.response?.itens.firstOrNull);
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<HistoricoSearchItemResponseDTO>(
          columns: colunas,
          items: dto?.itens ?? [],
          mode: PlutoGridMode.selectWithOneTap,
          onSelected: context.read<DetailedCubit>().detail,
        ),
      ),
    );
  }

  static Widget getCustomRenderer(
    PlutoColumnRendererContext renderContext, {
    TextAlign? textAlign = TextAlign.start,
  }) {
    Color cor = Cores.corTexto;
    if ((renderContext.row.cells['processo']?.value.toString() ?? '') ==
        'Sim') {
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

  List<CustomDataColumn> getColunas(BuildContext context) {
    HistoricoSearchResponseDTO? response =
        context.read<SearchCubit>().state.response;
    return [
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: 'Data',
        field: 'data',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: ' Usuário',
        field: 'codUsuario',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: 'Operação',
        field: 'operacao',
        valueConverter: (value) => value.toString(),
        width: 135,
      ),
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: 'Termo',
        field: 'termo',
      ),
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: 'Pk',
        width: 135,
        field: 'pk',
      ),
      CustomDataColumn(
        customRenderer: getCustomRenderer,
        text: 'Processo',
        width: 135,
        field: 'processo',
        valueConverter: (value) => value == true ? 'Sim' : 'Não',
      ),
    ];
  }
}

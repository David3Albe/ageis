import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/states/search_state.dart';
import 'package:ageiscme_models/response_dto/item/inserir_rapido/search/etiqueta/item_inserir_rapido_search_etiqueta_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(1);
    SearchState state = context.watch<SearchCubit>().state;
    List<ItemInserirRapidoSearchEtiquetaResponseDTO> itens =
        state.response?.etiquetas ?? [];
    if (state.loading == true) {
      return const Center(child: LoadingWidget());
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SelectableText(
            'Cadastrados ${state.response?.qtdeMax ?? 0} Itens',
            style: const TextStyle(color: Colors.red),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 4,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: PlutoGridWidget<ItemInserirRapidoSearchEtiquetaResponseDTO>(
                smallRows: true,
                columns: _getColunas(),
                items: itens,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<CustomDataColumn> _getColunas() => [
        CustomDataColumn(text: 'ID Etiqueta', field: 'idEtiqueta'),
      ];
}

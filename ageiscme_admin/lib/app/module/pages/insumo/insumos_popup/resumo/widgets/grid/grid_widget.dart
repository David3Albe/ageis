import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/insumos_popup/resumo/states/search_state.dart';
import 'package:ageiscme_models/response_dto/insumo/expirar/insumo_expirar_search_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/navigator/navigator_service.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  final Function() onClose;

  @override
  Widget build(BuildContext context) {
    List<CustomDataColumn> colunas = getColunas(context);
    SearchState state = context.watch<SearchCubit>().state;
    List<InsumoExpirarSearchResponseDTO>? itens = state.insumos;
    if (state.loading == true) return const Center(child: LoadingWidget());
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<InsumoExpirarSearchResponseDTO>(
          columns: colunas,
          smallRows: true,
          items: itens ?? [],
          onDetail: onDetail,
        ),
      ),
    );
  }

  Future onDetail(
    PlutoGridOnRowDoubleTapEvent event,
    InsumoExpirarSearchResponseDTO obj,
  ) async {
    onClose();
    NavigatorService.navigateToArguments(
      '/admin/insumo/consulta-insumo-saldo',
      obj.codInsumo,
    );
  }

  List<CustomDataColumn> getColunas(BuildContext context) {
    return [
      CustomDataColumn(
        text: 'Código',
        field: 'codInsumo',
        type: CustomDataColumnType.Number,
        width: 80,
      ),
      CustomDataColumn(
        text: 'Nome',
        field: 'nome',
      ),
      CustomDataColumn(
        text: 'Qtde',
        field: 'quantidade',
        type: CustomDataColumnType.Number,
        width: 77,
      ),
      CustomDataColumn(
        text: 'Lote',
        field: 'lote',
        width: 118,
      ),
      CustomDataColumn(
        text: 'Data Validade',
        field: 'dataValidade',
        type: CustomDataColumnType.Date,
        width: 120,
      ),
    ];
  }
}

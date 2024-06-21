import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/states/search_state.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
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
    List<RegistrosExpirarSearchResponseDTO>? itens = state.registros;
    if (state.loading == true) return const Center(child: LoadingWidget());
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<RegistrosExpirarSearchResponseDTO>(
          showFilters: true,
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
    RegistrosExpirarSearchResponseDTO obj,
  ) async {
    onClose();
    if (obj.codTipo == 5) {
      NavigatorService.navigateToArguments(
        '/admin/equipamento/equipamento-manutencao',
        obj.codTabela,
      );
    }
    if (obj.codTipo == 4) {
      NavigatorService.navigateToArguments(
        '/admin/equipamento/registro-servico',
        obj.codTabela,
      );
    }
    if (obj.codTipo == 3) {
      NavigatorService.navigateToArguments(
        '/admin/colaborador/epi-entrega',
        obj.codUsuario,
      );
    }
    if (obj.codTipo == 2) {
      NavigatorService.navigateToArguments(
        '/admin/colaborador/atestado-saude-ocupacional',
        obj.codTabela,
      );
    }
    if (obj.codTipo == 1) {
      NavigatorService.navigateToArguments(
        '/admin/biblioteca/documento',
        obj.codTabela,
      );
    }
  }

  List<CustomDataColumn> getColunas(BuildContext context) {
    return [
      CustomDataColumn(
        text: 'Sel.',
        readonly: false,
        onClick: (value, checked) => value.selecionado = checked,
        field: 'selecionado',
        type: CustomDataColumnType.Checkbox,
      ),
      CustomDataColumn(
        text: 'Tipo',
        field: 'nomeTipo',
      ),
      CustomDataColumn(
        text: 'Data Validade',
        field: 'dataValidade',
        type: CustomDataColumnType.Date,
        width: 120,
      ),
      CustomDataColumn(
        text: 'Descricao',
        field: 'descricao',
        width: 500,
      ),
    ];
  }
}

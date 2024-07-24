import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/home/registros_popup/resumo/states/search_state.dart';
import 'package:ageiscme_admin/app/module/services/admin_navigator_service.dart';
import 'package:ageiscme_models/response_dto/registros/expirar/registros_expirar_search_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
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
          onDetail: (event, obj) => onDetail(event, context, obj),
        ),
      ),
    );
  }

  Future onDetail(
    PlutoGridOnRowDoubleTapEvent event,
    BuildContext context,
    RegistrosExpirarSearchResponseDTO obj,
  ) async {
    onClose();
    if (obj.codTipo == 5) {
      AdminNavigatorService.navigateToArguments(
        '/admin/equipamento/equipamento-manutencao',
        context,
        obj.codTabela,
        'Manutenção de Equipamento',
      );
    }
    if (obj.codTipo == 4) {
      AdminNavigatorService.navigateToArguments(
        '/admin/equipamento/registro-servico',
        context,
        obj.codTabela,
        'Monitoramento',
      );
    }
    if (obj.codTipo == 3) {
      AdminNavigatorService.navigateToArguments(
        '/admin/colaborador/epi-entrega',
        context,
        obj.codUsuario,
        'Entrega de Epi',
      );
    }
    if (obj.codTipo == 2) {
      AdminNavigatorService.navigateToArguments(
        '/admin/colaborador/atestado-saude-ocupacional',
        context,
        obj.codTabela,
        'Registro de ASO',
      );
    }
    if (obj.codTipo == 1) {
      AdminNavigatorService.navigateToArguments(
        '/admin/biblioteca/documento',
        context,
        obj.codTabela,
        'Documentos',
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

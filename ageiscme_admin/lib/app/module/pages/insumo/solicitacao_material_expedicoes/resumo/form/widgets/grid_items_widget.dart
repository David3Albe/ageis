import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/find_one/solicitacao_material_find_one_response_dto.dart';
import 'package:compartilhados/componentes/botoes/default_button_widget.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GridItemsWidget extends StatefulWidget {
  GridItemsWidget({Key? key}) : super(key: key);

  @override
  State<GridItemsWidget> createState() => _GridItemsWidgetState();
}

class _GridItemsWidgetState extends State<GridItemsWidget> {
  late SolicitacaoMaterialItemModel? Function(PlutoRow) getObjectByRow;

  @override
  Widget build(BuildContext context) {
    SolicitacaoMaterialModel? solicitacao =
        context.watch<FormCubit>().state.response?.solicitacao;
    return Expanded(
      child: PlutoGridWidget<SolicitacaoMaterialItemModel>(
        getObjectByRowMethod: (context, getObjectByRowMethod) =>
            getObjectByRow = getObjectByRowMethod,
        columns: _getColunas(context),
        items: solicitacao?.solicitacoesMateriais ?? [],
      ),
    );
  }

  List<CustomDataColumn> _getColunas(BuildContext context) {
    SolicitacaoMaterialFindOneResponseDTO? response =
        context.read<FormCubit>().state.response;
    return [
      CustomDataColumn(
        text: 'Equipamento',
        field: 'codEquipamento',
        valueConverter: (value) => response?.equipamentos[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Insumo',
        field: 'codInsumo',
        valueConverter: (value) => response?.insumos[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Quantidade Solicitada',
        field: 'quantidadeSolicitada',
        width: 160,
      ),
      CustomDataColumn(
        width: 135,
        text: 'UnidadeMedida',
        field: 'codInsumo',
        calculatedField: 'codInsumoUnidadeMedida',
        valueConverter: (value) =>
            response?.insumos[value]?.unidadeMedida ?? '',
      ),
      CustomDataColumn(
        width: 160,
        text: 'Quantidade Entregue',
        field: 'quantidadeEntregue',
      ),
      CustomDataColumn(
        text: '',
        customRenderer: (contextPluto) => DefaultButtonWidget(
          readonly: response?.solicitacao?.codUsuarioAutorizacao == null ||
              response?.solicitacao?.codUsuarioRecebimento != null,
          text: 'Dispensar',
          onPressed: () {
            SolicitacaoMaterialItemModel? item =
                getObjectByRow(contextPluto.row);
            context.read<FormCubit>().dispensar(context, item);
          },
          cor: Colors.grey.shade400,
          corHovered: Colors.grey.shade600,
          icon: Symbols.move_item,
        ),
      ),
    ];
  }
}

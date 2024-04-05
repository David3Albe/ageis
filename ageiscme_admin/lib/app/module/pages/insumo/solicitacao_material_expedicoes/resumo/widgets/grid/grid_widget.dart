import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/item/solicitacao_material_search_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/solicitacao_material_search_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomDataColumn> colunas = getColunas(context);
    SolicitacaoMaterialSearchResponseDTO? dto =
        context.watch<SearchCubit>().state.response;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<SolicitacaoMaterialSearchItemResponseDTO>(
          columns: colunas,
          items: dto?.itens ?? [],
        ),
      ),
    );
  }

  List<CustomDataColumn> getColunas(BuildContext context) {
    SolicitacaoMaterialSearchResponseDTO? response =
        context.read<SearchCubit>().state.response;
    return [
      CustomDataColumn(
        text: 'Cód',
        field: 'cod',
        type: CustomDataColumnType.Number,
        width: 80,
      ),
      CustomDataColumn(
        text: 'Itens Solicitados',
        field: 'itensSolicitados',
        type: CustomDataColumnType.Number,
        width: 135,
      ),
      CustomDataColumn(
        text: 'Itens Entregues',
        field: 'itensEntregues',
        type: CustomDataColumnType.Number,
        width: 135,
      ),
      CustomDataColumn(
        text: 'Solicitante',
        field: 'codUsuarioSolicitacao',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Data Solicitação',
        field: 'dataSolicitacao',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Autorizador',
        field: 'codUsuarioAutorizacao',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Data Autorização',
        field: 'dataAutorizacao',
        type: CustomDataColumnType.DateTime,
        width: 135,
      ),
      CustomDataColumn(
        text: 'Entregador',
        field: 'codUsuarioEntrega',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
      CustomDataColumn(
        text: 'Data Entrega',
        field: 'dataEntrega',
        type: CustomDataColumnType.DateTime,
        width: 130,
      ),
      CustomDataColumn(
        text: 'Recebedor',
        field: 'codUsuarioRecebimento',
        valueConverter: (value) => response?.usuarios[value]?.nome ?? '',
      ),
    ];
  }
}

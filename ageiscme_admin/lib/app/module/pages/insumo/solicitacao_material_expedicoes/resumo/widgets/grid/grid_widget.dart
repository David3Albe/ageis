import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/form/form_widget.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/search_state.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/item/solicitacao_material_search_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/search/solicitacao_material_search_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late SolicitacaoMaterialSearchItemResponseDTO? Function(PlutoRow)
        getObjByRow;
    List<CustomDataColumn> colunas = getColunas(context);
    SearchState state = context.watch<SearchCubit>().state;
    SolicitacaoMaterialSearchResponseDTO? dto = state.response;
    if (state.loading == true) return const Center(child: LoadingWidget());
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: PlutoGridWidget<SolicitacaoMaterialSearchItemResponseDTO>(
          getObjectByRowMethod: (context, getObjectByRowMethod) =>
              getObjByRow = getObjectByRowMethod,
          rowColorCallback: (rowContext) {
            SolicitacaoMaterialSearchItemResponseDTO? solicitacao =
                getObjByRow(rowContext.row);
            if (solicitacao?.dataEntrega == null) {
              return Colors.red.shade200;
            }
            return const Color(0xffF4F4F4);
          },
          orderDescendingFieldColumn: 'dataSolicitacao',
          columns: colunas,
          items: dto?.itens ?? [],
          onEdit: (obj) => openModalForm(context, obj),
        ),
      ),
    );
  }

  Future openModalForm(
    BuildContext context,
    SolicitacaoMaterialSearchItemResponseDTO obj,
  ) async {
    late int chave;
    FormCubit formCubit = context.read<FormCubit>();
    chave = WindowsHelper.OpenDefaultWindows(
      identificador: obj.cod.toString(),
      title: 'Cadastro/Edição Solicitação Material Expedição',
      widget: BlocProvider<FormCubit>.value(
        value: formCubit,
        child: FormWidget(
          cod: obj.cod,
          onCancel: () => onCancel(chave),
          onSaved: (p0) => onSaved(p0, chave, context),
        ),
      ),
    );
  }

  Future onSaved(String message, int chave, BuildContext context) async {
    WindowsHelper.RemoverWidget(chave);
    SearchCubit searchCubit = context.read<SearchCubit>();
    FilterCubit filterCubit = context.read<FilterCubit>();
    SolicitacaoMaterialSearchDTO dto = filterCubit.state.dto;
    LoadingController loading = LoadingController(context: context);
    await searchCubit.search(dto);
    loading.closeDefault();
  }

  void onCancel(int chave) {
    WindowsHelper.RemoverWidget(chave);
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

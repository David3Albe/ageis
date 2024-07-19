import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/filter_form/filter_form.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/botoes/refresh_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RefreshButtonWidget(
          onPressed: () => refresh(context),
        ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        FilterButtonWidget(
          onPressed: () => {
            openModalFilter(context),
          },
        ),
      ],
    );
  }

  Future openModalFilter(BuildContext context) async {
    FilterCubit filterCubit = context.read<FilterCubit>();
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => BlocProvider<FilterCubit>.value(
        value: filterCubit,
        child: FilterForm(),
      ),
    );
    if (confirm != true) return;
    SearchCubit searchCubit = context.read<SearchCubit>();
    filterCubit = context.read<FilterCubit>();
    SolicitacaoMaterialSearchDTO dto = filterCubit.state.dto;
    LoadingController loading = LoadingController(context: context);
    await searchCubit.search(dto);
    loading.closeDefault();
  }

  Future refresh(BuildContext context) async {
    SearchCubit searchCubit = context.read<SearchCubit>();
    FilterCubit filterCubit = context.read<FilterCubit>();
    SolicitacaoMaterialSearchDTO dto = filterCubit.state.dto;
    LoadingController loading = LoadingController(context: context);
    await searchCubit.search(dto);
    loading.closeDefault();
  }
}

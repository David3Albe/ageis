import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/selected_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/widgets/filter/filter_form_widget.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/states/filter_state.dart';
import 'package:ageiscme_models/dto/processo_leitura_cancelamento_preparo/search/processo_leitura_cancelamento_preparo_search_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    FilterCubit filterCubit = context.read<FilterCubit>();
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<FilterCubit>.value(
          value: filterCubit,
          child: FilterFormWidget(),
        );
      },
    );
    if (result != true) return;
    filterCubit = context.read<FilterCubit>();
    FilterState state = filterCubit.state;
    if (state.kit == null && state.item == null) {
      ToastUtils.showCustomToastWarning(
        context,
        'É necessário selecionar um kit ou item para realizar a busca.',
      );
      return;
    }
    SearchCubit searchCubit = context.read<SearchCubit>();
    ProcessoLeituraCancelamentoPreparoSearchDTO dto =
        ProcessoLeituraCancelamentoPreparoSearchDTO(
      codItem: filterCubit.state.codItem,
      codKit: filterCubit.state.codKit,
    );
    LoadingController loading = LoadingController(context: context);
    await searchCubit.search(dto);
    searchCubit = context.read<SearchCubit>();
    ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO? leitura =
        searchCubit.state.response?.leituras.firstOrNull;
    if (leitura != null) {
      context.read<SelectedCubit>().select(leitura);
    }
    loading.closeDefault();
  }
}

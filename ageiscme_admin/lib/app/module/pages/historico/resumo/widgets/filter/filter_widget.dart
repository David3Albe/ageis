import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/filter_form/filter_form.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:compartilhados/componentes/loading/loading_controller.dart';
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
          child: FilterForm(),
        );
      },
    );
    if (result != true) return;
    SearchCubit searchCubit = context.read<SearchCubit>();
    filterCubit = context.read<FilterCubit>();
    LoadingController loading = LoadingController(context: context);
    await searchCubit.search(context);
    loading.closeDefault();
  }
}
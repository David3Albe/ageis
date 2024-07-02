import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/afastamento_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/afastamento/filter/afastamento_filter_page.dart';
import 'package:ageiscme_models/filters/afastamento/afastamento_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:flutter/material.dart';

class AfastamentoFilterButtonWidget extends StatelessWidget {
  const AfastamentoFilterButtonWidget({
    required this.filter,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final AfastamentoFilter filter;
  final AfastamentoPageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AfastamentoFilterPage(filter: filter),
    );
    if (confirm != true) return;
    await cubit.getScreenData(filter);
  }
}

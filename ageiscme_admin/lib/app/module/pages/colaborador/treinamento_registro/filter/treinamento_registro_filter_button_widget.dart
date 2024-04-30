import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/cubits/treinamento_registro_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/filter/treinamento_registro_page_filter.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/treinamento_registro/treinamento_registro_page_state.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TreinamentoRegistroFilterButtonWidget extends StatelessWidget {
  const TreinamentoRegistroFilterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    TreinamentoRegistroCubitFilter filterCubit = context.read<TreinamentoRegistroCubitFilter>();
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<TreinamentoRegistroCubitFilter>.value(
          value: filterCubit,
          child: TreinamentoRegistroPageFilter(),
        );
      },
    );
    if (result != true) return;
    TreinamentoRegistroPageCubit treinamentoCubit = context.read<TreinamentoRegistroPageCubit>();
    filterCubit = context.read<TreinamentoRegistroCubitFilter>();
    TreinamentoRegistroFilter dto = filterCubit.state;
    await treinamentoCubit.filter(dto);
  }
}

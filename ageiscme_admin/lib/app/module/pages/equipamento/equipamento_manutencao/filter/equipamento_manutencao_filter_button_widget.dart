import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/cubits/equipamento_manutencao_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/equipamento_manutencao_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/equipamento/equipamento_manutencao/filter/equipamento_manutencao_page_filter.dart';
import 'package:ageiscme_models/filters/equipamento_manutencao/equipamento_manutencao_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EquipamentoManutencaoFilterButtonWidget extends StatelessWidget {
  const EquipamentoManutencaoFilterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    EquipamentoManutencaoFilterCubit filterCubit = context.read<EquipamentoManutencaoFilterCubit>();
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<EquipamentoManutencaoFilterCubit>.value(
          value: filterCubit,
          child: EquipamentoManutencaoPageFilter(),
        );
      },
    );
    if (result != true) return;
    EquipamentoManutencaoPageCubit equipamentoManutencaoCubit = context.read<EquipamentoManutencaoPageCubit>();
    filterCubit = context.read<EquipamentoManutencaoFilterCubit>();
    EquipamentoManutencaoFilter dto = filterCubit.state;
    await equipamentoManutencaoCubit.getScreenData(dto);
  }
}

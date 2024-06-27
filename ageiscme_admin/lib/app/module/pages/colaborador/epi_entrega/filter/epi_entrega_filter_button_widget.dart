import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/cubits/epi_entrega_filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/epi_entrega_page_state.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/epi_entrega/filter/epi_entrega_filter_page.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EpiEntregaFilterButtonWidget extends StatelessWidget {
  const EpiEntregaFilterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    EpiEntregaFilterCubit filterCubit = context.read<EpiEntregaFilterCubit>();

    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => BlocProvider<EpiEntregaFilterCubit>.value(
        value: filterCubit,
        child: EpiEntregaFilterPage(),
      ),
    );
    if (confirm != true) return;
    EpiEntregaUsuarioPageCubit epiEntregaCubit =
        context.read<EpiEntregaUsuarioPageCubit>();
    filterCubit = context.read<EpiEntregaFilterCubit>();
    UsuarioFilter dto = filterCubit.state;
    await epiEntregaCubit.filter(dto);
  }
}

import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/cubits/usuario_cubit_filter.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/filter/usuario_page_filter.dart';
import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_state.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:compartilhados/componentes/botoes/filter_button_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class UsuarioButtonFilterWidget extends StatelessWidget {
  const UsuarioButtonFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterButtonWidget(
      onPressed: () => {
        openModalFilter(context),
      },
    );
  }

  Future openModalFilter(BuildContext context) async {
    UsuarioCubitFilter filterCubit = context.read<UsuarioCubitFilter>();
    bool? result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<UsuarioCubitFilter>.value(
          value: filterCubit,
          child: UsuarioPageFilter(),
        );
      },
    );
    if (result != true) return;
    UsuarioPageCubit userCubit = context.read<UsuarioPageCubit>();
    filterCubit = context.read<UsuarioCubitFilter>();
    UsuarioFilter dto = filterCubit.state;
    await userCubit.loadFilter(dto);
  }
}

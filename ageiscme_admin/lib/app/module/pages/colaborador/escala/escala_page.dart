import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/sigla/sigla_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/turno/turno_short_response_cubit.dart';
import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/usuario/usuario_drop_down_search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/cubits/escala_page_grid_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/escala/widget/escala_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EscalaPage extends StatelessWidget {
  const EscalaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TurnoShortResponseCubit(),
        ),
        BlocProvider(
          create: (context) => SiglaShortResponseCubit(),
        ),
        BlocProvider(
          create: (context) => UsuarioDropDownSearchCubit(),
        ),
        BlocProvider(
          create: (context) => EscalaPageCubit(),
        ),
        BlocProvider(
          create: (context) => EscalaPageGridCubit(),
        ),
      ],
      child: const EscalaPageWidget(),
    );
  }
}

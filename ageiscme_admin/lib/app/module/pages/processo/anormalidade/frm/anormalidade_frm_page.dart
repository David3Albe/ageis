import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/cubits/anormalidade_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/frm/page/anormalidade_frm_page.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeFrmPage extends StatelessWidget {
  const AnormalidadeFrmPage({required this.cod, super.key});
  final int? cod;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnormalidadeFrmCubit()
            ..load(
              cod: cod,
              context: context,
            ),
        ),
      ],
      child: const AnormalidadeFrmPageWidget(),
    );
  }
}

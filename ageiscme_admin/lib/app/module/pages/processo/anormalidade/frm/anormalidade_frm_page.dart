import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/cubits/anormalidade_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/frm/page/anormalidade_frm_page.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeFrmPage extends StatelessWidget {
  const AnormalidadeFrmPage({
    required this.cod,
    required this.onSaved,
    required this.onCancel,
    super.key,
  });
  final int? cod;
  final void Function() onSaved;
  final void Function() onCancel;

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
      child: AnormalidadeFrmPageWidget(
        onCancel: onCancel,
        onSaved: onSaved,
      ),
    );
  }
}

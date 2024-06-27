import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/cancel_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/selected_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/page/cancelamento_preparo_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CancelamentoPreparoPage extends StatelessWidget {
  const CancelamentoPreparoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => SelectedCubit(),
        ),
        BlocProvider(
          create: (context) => CancelCubit(),
        ),
      ],
      child: const CancelamentoPreparoPageWidget(),
    );
  }
}

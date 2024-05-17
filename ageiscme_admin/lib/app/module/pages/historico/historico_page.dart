import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/detailed_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/historico/resumo/historico_.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({
    required this.pk,
    required this.termo,
    Key? key,
  }) : super(key: key);

  final int pk;
  final String termo;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilterCubit>(
          create: (context) => FilterCubit(
            pk: pk,
            termo: termo,
          ),
        ),
        BlocProvider<DetailedCubit>(
          create: (context) => DetailedCubit(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit()..search(context),
        ),
      ],
      child: const HistoricoResumoPage(),
    );
  }
}

import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/processo_etapa/processo_etapa_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade/widget/anormalidade_page_widget.dart';
import 'package:ageiscme_models/filters/processo_etapa/processo_etapa_filter.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AnormalidadePage extends StatelessWidget {
  const AnormalidadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProcessoEtapaCubit()
            ..loadFilter(
              ProcessoEtapaFilter(
                carregarTiposProcesso: true,
              ),
            ),
        ),
      ],
      child: const AnormalidadePageWidget(),
    );
  }
}

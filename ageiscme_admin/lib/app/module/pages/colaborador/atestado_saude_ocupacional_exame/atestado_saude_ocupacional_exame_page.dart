import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/cubits/atestado_saude_ocupacional_exame_page_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/widget/atestado_saude_ocupacional_exame_page_widget.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalExamePage extends StatelessWidget {
  const AtestadoSaudeOcupacionalExamePage({
    required this.aso,
    super.key,
  });
  final AtestadoSaudeOcupacionalModel aso;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AtestadoSaudeOcupacionalExamePageCubit(
            aso: aso,
          )..load(),
        ),
      ],
      child: const AtestadoSaudeOcupacionalExamePageWidget(),
    );
  }
}

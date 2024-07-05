import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/cubits/atestado_saude_ocupacional_exame_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/atestado_saude_ocupacional_exame/frm/page/atestado_saude_ocupacional_exame_frm_page_widget.dart';
import 'package:ageiscme_models/models/atestado_saude_ocupacional/atestado_saude_ocupacional_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AtestadoSaudeOcupacionalExameFrmPage extends StatelessWidget {
  const AtestadoSaudeOcupacionalExameFrmPage({
    required this.aso,
    required this.codExame,
    required this.onSaved,
    required this.onCancel,
    super.key,
  });
  final AtestadoSaudeOcupacionalModel aso;
  final int codExame;
  final void Function() onSaved;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AtestadoSaudeOcupacionalExameFrmCubit(aso: aso),
        ),
      ],
      child: AtestadoSaudeOcupacionalExameFrmPageWidget(
        onCancel: onCancel,
        onSaved: onSaved,
        codExame: codExame,
      ),
    );
  }
}

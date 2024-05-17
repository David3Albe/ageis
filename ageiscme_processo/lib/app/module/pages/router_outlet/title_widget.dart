import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/widgets.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    (String?, double) instituicaoEscala = context.select(
      (ProcessoLeituraCubit value) => (
        value.state.processo.leituraAtual.instituicao?.nome,
        value.state.processo.getEscala()
      ),
    );
    if (instituicaoEscala.$1 == null) {
      return const SizedBox();
    }
    return Text(
      'Instituição: ' + instituicaoEscala.$1!,
      style: TextStyle(
        fontSize: 14 * instituicaoEscala.$2,
      ),
    );
  }
}

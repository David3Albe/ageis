import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:flutter/material.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ProcessoPageActionWidget extends StatelessWidget {
  const ProcessoPageActionWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    var scale = MediaQuery.of(context).size.width / 1920;
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Cores.CorCards,
        ),
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          buildWhen: (previous, current) =>
              current.rebuildType == ProcessoLeituraRebuildType.All,
          builder: (context, state) {
            double escala = state.processo.getEscala();
              double lineHeightRobot = state.processo.getLineHeightSegoe();
            return Padding(
              padding: EdgeInsets.only(
                top: 8 * scale / escala,
                bottom: 8 * scale / escala,
                right: 14 * scale / escala,
                left: 14 * scale / escala,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'AÇÃO',
                        style: Fontes.getSegoe(
                          fontSize: 14 * scale * escala,
                          cor: Cores.CorTitleCards,
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      state.processo.leituraAtual.acao == null
                          ? ' '
                          : state.processo.leituraAtual.acao!.toUpperCase(),
                      style: Fontes.getSegoe(
                        fontSize: 20 * scale * escala,
                        cor: Cores.CorTextCards,
                        lineHeight: lineHeightRobot,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

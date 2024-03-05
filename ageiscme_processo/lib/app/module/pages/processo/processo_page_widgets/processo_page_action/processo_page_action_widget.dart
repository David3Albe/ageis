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
        child: Padding(
          padding: EdgeInsets.only(
            top: 8 * scale,
            bottom: 8 * scale,
            right: 14 * scale,
            left: 14 * scale,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'AÇÃO',
                        style: Fontes.getSegoe(
                          fontSize: 14 * scale,
                          cor: Cores.CorTitleCards,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
                buildWhen: (previous, current) =>
                    current.rebuildType == ProcessoLeituraRebuildType.All,
                builder: (context, state) {
                  return FittedBox(
                    child: Text(
                      state.processo.leituraAtual.acao == null
                          ? ' '
                          : state.processo.leituraAtual.acao!.toUpperCase(),
                      style: Fontes.getSegoe(
                        fontSize: 20 * scale,
                        cor: Cores.CorTextCards,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

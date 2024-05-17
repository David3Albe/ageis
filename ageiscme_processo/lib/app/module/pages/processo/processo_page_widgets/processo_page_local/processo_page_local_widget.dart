import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageLocalWidget extends StatelessWidget {
  const ProcessoPageLocalWidget({Key? key});

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
            double escalaFonte = state.processo.getEscala();
            double lineHeightSegoe = state.processo.getLineHeightSegoe();
            return Padding(
              padding: EdgeInsets.only(
                top: (8 * scale) / escalaFonte,
                bottom: (8 * scale) / escalaFonte,
                right: (14 * scale) / escalaFonte,
                left: (14 * scale) / escalaFonte,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'LOCAL',
                          style: Fontes.getSegoe(
                            fontSize: 14 * scale * escalaFonte,
                            cor: Cores.CorTitleCards,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      textAlign: TextAlign.start,
                      state.processo.local?.nome ?? ' ',
                      style: Fontes.getSegoe(
                        fontSize: 20 * scale * escalaFonte,
                        cor: Cores.CorTextCards,
                        lineHeight: lineHeightSegoe,
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

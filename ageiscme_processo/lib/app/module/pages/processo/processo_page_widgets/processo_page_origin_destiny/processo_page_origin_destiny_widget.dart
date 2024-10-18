import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageOriginDestinyWidget extends StatelessWidget {
  const ProcessoPageOriginDestinyWidget({Key? key});

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
            LocalInstituicaoModel? local = state.processo.leituraAtual.local;
            double? escalaFonte = state.processo.getEscala();
            double lineHeightSegoe = state.processo.getLineHeightSegoe();
            return Padding(
              padding: EdgeInsets.only(
                top: 8 * scale / escalaFonte,
                bottom: 8 * scale / escalaFonte,
                right: 14 * scale / escalaFonte,
                left: 14 * scale / escalaFonte,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'ORIGEM/DESTINO',
                        style: Fontes.getSegoe(
                          fontSize: 14 * scale * escalaFonte,
                          cor: Cores.CorTitleCards,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    local == null ? ' ' : local.nome!,
                    style: Fontes.getSegoe(
                      fontSize: 20 * scale * escalaFonte,
                      cor: Cores.CorTextCards,
                      lineHeight: lineHeightSegoe,
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

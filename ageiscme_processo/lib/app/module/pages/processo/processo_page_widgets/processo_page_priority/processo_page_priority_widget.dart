import 'package:ageiscme_models/models/processo_leitura_prioridade/processo_leitura_prioridade_model.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class ProcessoPagePriorityWidget extends StatelessWidget {
  const ProcessoPagePriorityWidget({Key? key});
  @override
  Widget build(BuildContext context) {
    var scale = MediaQuery.of(context).size.width / 1920;
    return Material(
      elevation: 10,
      child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
        buildWhen: (previous, current) =>
            current.rebuildType == ProcessoLeituraRebuildType.All,
        builder: (context, state) {
          ProcessoLeituraPrioridadeModel? prioridade;
          if (state.processo.leituraAtual.prioridade != null) {
            prioridade = ProcessoLeituraPrioridadeModel.getPriorityFromCode(
              state.processo.leituraAtual.prioridade!,
            );
          }
          return Container(
            decoration: BoxDecoration(
              color: prioridade != null && prioridade.urgente
                  ? const Color(0xffE69A1C)
                  : Cores.CorCards,
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
                      FittedBox(
                        child: Text(
                          'PRIORIDADE',
                          style: Fontes.getSegoe(
                            fontSize: 14 * scale,
                            cor: Cores.CorPrioridadeUrgente,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: prioridade != null
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    prioridade.descricao.toUpperCase(),
                                    style: Fontes.getSegoe(
                                      fontSize: 64 * scale,
                                      cor: Cores.CorTextCards,
                                    ),
                                  ),
                                )
                              : const Text(''),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: prioridade != null && prioridade.urgente
                              ? Icon(
                                  Symbols.warning,
                                  size: 92 * scale,
                                )
                              : const Text(' '),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

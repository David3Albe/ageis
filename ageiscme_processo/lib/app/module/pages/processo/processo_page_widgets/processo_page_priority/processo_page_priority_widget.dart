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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'PRIORIDADE',
                                style: Fontes.getSegoe(
                                  fontSize: 14 * scale,
                                  cor: Cores.CorPrioridadeUrgente,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: Center(
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: prioridade != null
                                        ? FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.center,
                                            child: Text(
                                              prioridade.descricao
                                                  .toUpperCase(),
                                              style: Fontes.getSegoe(
                                                fontSize: 32 * scale,
                                                cor: Cores.CorTextCards,
                                              ),
                                            ),
                                          )
                                        : const Text(''),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.center,
                                      child: prioridade != null &&
                                              prioridade.urgente
                                          ? Icon(
                                              Symbols.warning,
                                              size: 38 * scale,
                                            )
                                          : const Text(' '),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

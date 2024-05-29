import 'package:ageiscme_models/models/processo_leitura_prioridade/processo_leitura_prioridade_model.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/enums/custom_audio.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/functions/custom_audio_player.dart';
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
      child: BlocConsumer<ProcessoLeituraCubit, ProcessoLeituraState>(
        listenWhen: (previous, current) =>
            current.rebuildType == ProcessoLeituraRebuildType.All &&
            getItemKitPriority(previous.processo) !=
                getItemKitPriority(current.processo),
        listener: (context, state) {
          ProcessoLeituraPrioridadeModel? prioridade =
              getPrioridade(state.processo);
          if (prioridade?.urgente != true) return;
          CustomAudio? audio = CustomAudio.getOneFromCode(5);
          if (audio == null) return;
          CustomAudioPlayer.playAudioFromAsset(audio.path);
        },
        buildWhen: (previous, current) =>
            current.rebuildType == ProcessoLeituraRebuildType.All,
        builder: (context, state) {
          ProcessoLeituraPrioridadeModel? prioridade;
          int? prioridadeItemKit = getItemKitPriority(
            state.processo,
          );
          if (prioridadeItemKit != null ||
              state.processo.leituraAtual.prioridade != null) {
            prioridade = ProcessoLeituraPrioridadeModel.getPriorityFromCode(
              prioridadeItemKit ?? state.processo.leituraAtual.prioridade!,
            );
          }
          double escalaFonte = state.processo.getEscala();
          double lineHeightSegoe = state.processo.getLineHeightSegoe();
          return Container(
            decoration: BoxDecoration(
              color: prioridade != null && prioridade.urgente
                  ? const Color(0xffE69A1C)
                  : Cores.CorCards,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 8 * scale / escalaFonte,
                bottom: 8 * scale / escalaFonte,
                right: 14 * scale / escalaFonte,
                left: 14 * scale / escalaFonte,
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
                            child: Text(
                              'PRIORIDADE',
                              style: Fontes.getSegoe(
                                fontSize: 14 * scale * escalaFonte,
                                cor: Cores.CorPrioridadeUrgente,
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
                                        ? Text(
                                            prioridade.descricao.toUpperCase(),
                                            style: Fontes.getSegoe(
                                              fontSize:
                                                  32 * scale * escalaFonte,
                                              cor: Cores.CorTextCards,
                                              lineHeight: lineHeightSegoe,
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
                                              size: 38 * scale * escalaFonte,
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

  int? getItemKitPriority(
    ProcessoLeituraMontagemModel processo,
  ) {
    ItemProcessoModel? item = processo.getItemSelecionado();
    if (item != null) {
      return item.prioridade;
    }
    KitProcessoModel? kit = processo.getKitLidoOuNull();
    if (kit != null) return kit.prioridade;
    return null;
  }

  ProcessoLeituraPrioridadeModel? getPrioridade(
    ProcessoLeituraMontagemModel processo,
  ) {
    ProcessoLeituraPrioridadeModel? prioridade;
    int? prioridadeItemKit = getItemKitPriority(
      processo,
    );
    if (prioridadeItemKit != null || processo.leituraAtual.prioridade != null) {
      prioridade = ProcessoLeituraPrioridadeModel.getPriorityFromCode(
        prioridadeItemKit ?? processo.leituraAtual.prioridade!,
      );
    }
    return prioridade;
  }
}

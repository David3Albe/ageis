import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/models/item_processo/item_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageObjectReaderWidget extends StatelessWidget {
  const ProcessoPageObjectReaderWidget({Key? key});

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
            ProprietarioModel? proprietario = getProprietario(state.processo);
            String itemDescription = getItemKitDescription(
              state.processo,
            );
            double escalaFonte = state.processo.getEscala();
            double lineHeightSegoe = state.processo.getLineHeightSegoe();
            return Padding(
              padding: EdgeInsets.only(
                top: 6 * scale / escalaFonte,
                bottom: 6 * scale / escalaFonte,
                right: 14 * scale / escalaFonte,
                left: 14 * scale / escalaFonte,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'ITEM',
                            style: Fontes.getSegoe(
                              fontSize: 14 * scale * escalaFonte,
                              cor: Cores.CorTitleCards,
                            ),
                          ),
                        ),
                        SelectableText(
                          itemDescription,
                          textAlign: TextAlign.left,
                          style: Fontes.getSegoe(
                            fontSize: 22 * scale * escalaFonte,
                            cor: Cores.CorTextCards,
                            lineHeight: lineHeightSegoe,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 6,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'PROPRIETÁRIO',
                            style: Fontes.getSegoe(
                              fontSize: 14 * scale * escalaFonte,
                              cor: Cores.CorTitleCards,
                            ),
                          ),
                        ),
                        SelectableText(
                          proprietario != null ? proprietario.nome! : ' ',
                          textAlign: TextAlign.left,
                          style: Fontes.getSegoe(
                            fontSize: 24 * scale * escalaFonte,
                            cor: Cores.CorTextCards,
                            lineHeight: lineHeightSegoe,
                          ),
                        ),
                      ],
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

  String getItemKitDescription(
    ProcessoLeituraMontagemModel processo,
  ) {
    ItemProcessoModel? item = processo.getItemSelecionado();
    if (item != null) {
      return '${item.idEtiqueta} ${item.descricao}';
    }
    KitProcessoModel? kit = processo.getKitLidoOuNull();
    if (kit != null) return '${kit.codBarra} ${kit.descritor?.nome ?? ' '}';
    return ' ';
  }

  ProprietarioModel? getProprietario(
    ProcessoLeituraMontagemModel processo,
  ) {
    ItemProcessoModel? item = processo.getItemSelecionado();
    if (item != null) return item.getProprietario(processo);
    KitProcessoModel? kit = processo.getKitLidoOuNull();
    if (kit?.itens == null) return null;
    Map<int, int> proprietariosVezes = {};
    int maximoProprietarioVezes = 0;
    for (ItemProcessoModel item in kit!.itens!) {
      ProprietarioModel? proprietario = item.getProprietario(processo);
      if (proprietario == null) continue;
      if (!proprietariosVezes.containsKey(proprietario.cod)) {
        proprietariosVezes.addAll({proprietario.cod!: 0});
      }
      proprietariosVezes[proprietario.cod!] =
          proprietariosVezes[proprietario.cod!]! + 1;
      if (proprietariosVezes[proprietario.cod]! > maximoProprietarioVezes) {
        maximoProprietarioVezes = proprietariosVezes[proprietario.cod]!;
      }
    }

    if (maximoProprietarioVezes == 0) return null;
    int? codProprietario = proprietariosVezes.entries
        .where((element) => element.value == maximoProprietarioVezes)
        .firstOrNull
        ?.key;
    if (codProprietario == null) return null;
    return processo.leituraAtual.proprietarios
        ?.where((element) => element.cod == codProprietario)
        .firstOrNull;
  }
}

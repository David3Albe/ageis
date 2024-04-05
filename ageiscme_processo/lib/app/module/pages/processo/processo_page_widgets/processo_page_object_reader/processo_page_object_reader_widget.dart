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
        child: Padding(
          padding: EdgeInsets.only(
            top: 6 * scale,
            bottom: 6 * scale,
            right: 14 * scale,
            left: 14 * scale,
          ),
          child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
            buildWhen: (previous, current) =>
                current.rebuildType == ProcessoLeituraRebuildType.All,
            builder: (context, state) {
              ProprietarioModel? proprietario = getProprietario(state.processo);
              String itemDescription = getItemKitDescription(
                state.processo,
              );
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'ITEM',
                            style: Fontes.getSegoe(
                              fontSize: 14 * scale,
                              cor: Cores.CorTitleCards,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SelectableText(
                            itemDescription,
                            textAlign: TextAlign.left,
                            style: Fontes.getSegoe(
                              fontSize: 24 * scale,
                              cor: Cores.CorTextCards,
                            ),
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'PROPRIETÁRIO',
                            style: Fontes.getSegoe(
                              fontSize: 14 * scale,
                              cor: Cores.CorTitleCards,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SelectableText(
                            proprietario != null ? proprietario.nome! : ' ',
                            textAlign: TextAlign.left,
                            style: Fontes.getSegoe(
                              fontSize: 24 * scale,
                              cor: Cores.CorTextCards,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
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
    return item?.getProprietario(processo);
  }
}

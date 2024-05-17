import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_items/processo_page_tree_view_items_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kits_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ProcessoPageReadingsTreeViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 1920;
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<ProcessoLeituraCubit, ProcessoLeituraState>(
          buildWhen: (previous, current) =>
              current.rebuildType == ProcessoLeituraRebuildType.All ||
              current.rebuildType == ProcessoLeituraRebuildType.Kit,
          builder: (context, state) {
            double escalaFonte = state.processo.getEscala();
            double? lineHeight = state.processo.getLineHeightPadraoBig();
            return Padding(
              padding: EdgeInsets.only(right: 4.0 * scale),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 8 * scale)),
                        Visibility(
                          visible: state.processo.leituraAtual.kits.isNotEmpty,
                          child: Text(
                            'Kits (${state.processo.leituraAtual.kits.length})',
                            style: TextStyle(
                              fontSize: 16 * scale * escalaFonte,
                              height: lineHeight,
                            ),
                          ),
                        ),
                        ProcessoPageTreeViewKitsWidget(
                          kits: state.processo.leituraAtual.kits,
                          processoLeitura: state.processo,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8 * scale)),
                        Visibility(
                          visible: state.processo.leituraAtual.itens.isNotEmpty,
                          child: Text(
                            'Itens (${state.processo.leituraAtual.itens.length})',
                            style: TextStyle(
                              fontSize: 16 * scale * escalaFonte,
                              height: lineHeight,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8 * scale)),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0 * scale),
                          child: ProcessoPageTreeViewItemsWidget(
                            itens: state.processo.leituraAtual.itens,
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
}

import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_readings_tree_view_widget.dart';
import 'package:ageiscme_processo/app/module/shared/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:flutter/material.dart';

class ProcessoPageReadingsWidget extends StatelessWidget {
  const ProcessoPageReadingsWidget({Key? key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Lista de Materiais/Kits',
                          style: Fontes.getSegoe(
                            fontSize: 26 * scale,
                            cor: Cores.CorTitleCards,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ProcessoPageReadingsTreeViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

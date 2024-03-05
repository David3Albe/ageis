import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kit_colors_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kit_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitsWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitsWidget({
    required this.kits,
    required this.processoLeitura,
  });
  final List<KitProcessoModel> kits;
  final ProcessoLeituraMontagemModel processoLeitura;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: getKits(context),
    );
  }

  List<Widget> getKits(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 1920;
    List<Widget> widgets = [];
    for (KitProcessoModel kit in kits) {
      widgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 4.0 * scale,
                  top: 4.0 * scale,
                  right: 6.0 * scale,
                ),
                child: ProcessoPageTreeViewKitWidget(
                  kit: kit,
                  processoLeitura: processoLeitura,
                ),
              ),
            ),
            ProcessoPageTreeViewKitColorsWidget(kit: kit),
          ],
        ),
      );
    }
    return widgets;
  }
}

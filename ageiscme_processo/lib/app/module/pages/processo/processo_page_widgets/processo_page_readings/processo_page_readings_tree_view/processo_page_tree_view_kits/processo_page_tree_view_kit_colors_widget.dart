import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_readings/processo_page_readings_tree_view/processo_page_tree_view_kits/processo_page_tree_view_kit_color_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitColorsWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitColorsWidget({required this.kit});
  final KitProcessoModel kit;

  @override
  Widget build(BuildContext context) {
    return kit.selecionado == true
        ? Column(
            children: getColors(context),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: getColors(context),
            ),
          );
  }

  List<Widget> getColors(BuildContext context) {
    List<Color> cores = [];
    cores.add(kit.getCor1());
    cores.add(kit.getCor2());
    cores.add(kit.getCor3());
    cores.add(kit.getCor4());
    if (kit.selecionado == true) return getExpandedColors(cores, context);
    return getSmallColors(cores, context);
  }

  List<Widget> getExpandedColors(List<Color> cores, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    for (Color cor in cores) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Container(
            height: size.height * 0.01,
            width: size.width * 0.03,
            child: ProcessoPageTreeViewKitColorWidget(
              cor: cor,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  List<Widget> getSmallColors(List<Color> cores, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    for (Color cor in cores) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 1.75),
          child: Container(
            height: size.width * 0.01,
            width: size.width * 0.01,
            child: ProcessoPageTreeViewKitColorWidget(
              cor: cor,
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}

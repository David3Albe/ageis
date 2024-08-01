import 'package:ageiscme_processo/app/module/models/kit_processo/kit_processo_model.dart';
import 'package:flutter/material.dart';

class ProcessoPageObjectPreviewColorsWidget extends StatelessWidget {
  const ProcessoPageObjectPreviewColorsWidget({required this.kit});
  final KitProcessoModel kit;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: getColorsWidget(context),
    );
  }

  List<Widget> getColorsWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> widgets = [];
    for (Color cor in kit.getAllCores()) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: cor,
              border: cor.red == 0 && cor.green == 0 && cor.blue == 0
                  ? null
                  : Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
            ),
            height: size.height * 0.03,
            width: size.width * 0.035,
          ),
        ),
      );
    }
    return widgets;
  }
}

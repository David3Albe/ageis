import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/widgets/etiqueta/etiqueta_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/widgets/grid/grid_widget.dart';
import 'package:ageiscme_admin/app/module/pages/material/item/inserir_rapido/widgets/quantidade/quantidade_widget.dart';
import 'package:flutter/material.dart';

class InserirRapidoWidget extends StatelessWidget {
  const InserirRapidoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EtiquetaWidget(),
        Padding(
          padding: EdgeInsets.only(
            top: 4,
          ),
        ),
        QuantidadeWidget(),
        Padding(
          padding: EdgeInsets.only(
            top: 12,
          ),
        ),
        GridWidget(),
      ],
    );
  }
}

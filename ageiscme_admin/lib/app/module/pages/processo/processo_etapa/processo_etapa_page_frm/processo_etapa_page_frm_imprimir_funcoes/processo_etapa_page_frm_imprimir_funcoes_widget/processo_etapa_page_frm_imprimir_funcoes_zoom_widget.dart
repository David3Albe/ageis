import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesZoomWidget extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesZoomWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ZOOM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            CustomCheckboxWidget(
              checked: controller.dto.zoom,
              onClick: (value) => controller.dto.zoom = value,
              text: 'Zoom In / Out',
              align: MainAxisAlignment.start,
            ),
          ],
        ),
      ],
    );
  }
}

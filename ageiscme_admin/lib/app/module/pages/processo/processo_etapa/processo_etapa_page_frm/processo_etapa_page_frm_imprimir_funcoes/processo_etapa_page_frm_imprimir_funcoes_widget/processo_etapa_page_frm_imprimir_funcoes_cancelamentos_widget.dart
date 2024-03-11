import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesCancelamentosWidget
    extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesCancelamentosWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CANCELAMENTOS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.cancel1Item,
                onClick: (value) => controller.dto.cancel1Item = value,
                text: 'Cancelar 1 Item',
                align: MainAxisAlignment.start,
              ),
            ),
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.cancelReadings,
                onClick: (value) => controller.dto.cancelReadings = value,
                text: 'Cancelar Leituras',
                align: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

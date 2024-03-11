import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesPrioridadeWidget
    extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesPrioridadeWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (!_etapaInicial()) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PRIORIDADES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.normalPriority,
                onClick: (value) => controller.dto.normalPriority = value,
                text: 'Normal',
                align: MainAxisAlignment.start,
              ),
            ),
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.urgentPriority,
                onClick: (value) => controller.dto.urgentPriority = value,
                text: 'Urgente',
                align: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _etapaInicial() {
    if (etapa.codEstoque != null) return false;
    return etapa.tipoProcesso?.codEtapaProcessoInicial == etapa.cod &&
        etapa.tipoProcesso?.etapaInicial?.codEquipamento ==
            etapa.codEquipamento;
  }
}

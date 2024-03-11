import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesSimNaoWidget extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesSimNaoWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESPOSTA SIM / NÃO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            CustomCheckboxWidget(
              checked: controller.dto.yesNo,
              onClick: (value) => controller.dto.yesNo = value,
              text: 'Sim / Não',
              align: MainAxisAlignment.start,
            ),
          ],
        ),
      ],
    );
  }
}

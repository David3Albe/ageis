import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesPadraoWidget extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesPadraoWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PADRÃO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.printTagLocal,
                onClick: (value) => controller.dto.printTagLocal = value,
                text: 'Etiqueta do Local',
                align: MainAxisAlignment.start,
              ),
            ),
            etapa.exigeLeituraEntrada == true
                ? Expanded(
                    child: CustomCheckboxWidget(
                      checked: controller.dto.entry,
                      onClick: (value) => controller.dto.entry = value,
                      text: 'Iniciar Entrada',
                      align: MainAxisAlignment.start,
                    ),
                  )
                : const SizedBox(),
            etapa.exigeLeituraSaida == true
                ? Expanded(
                    child: CustomCheckboxWidget(
                      checked: controller.dto.exit,
                      onClick: (value) => controller.dto.exit = value,
                      text: 'Iniciar Saída',
                      align: MainAxisAlignment.start,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: CustomCheckboxWidget(
                checked: controller.dto.finish,
                onClick: (value) => controller.dto.finish = value,
                text: 'Finalizar',
                align: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:ageiscme_admin/app/module/pages/processo/processo_etapa/processo_etapa_page_frm/processo_etapa_page_frm_imprimir_funcoes/processo_etapa_page_frm_imprimir_funcoes_controller.dart';
import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class ProcessoEtapaPageFrmImprimirFuncoesTransferirReceberWidget
    extends StatelessWidget {
  final ProcessoEtapaModel etapa;
  final ProcessoEtapaPageFrmImprimirFuncoesController controller;

  ProcessoEtapaPageFrmImprimirFuncoesTransferirReceberWidget({
    required this.etapa,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (!_transfereRecebe()) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TRANSFERIR / RECEBER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            etapa.transfere == true
                ? Expanded(
                    child: CustomCheckboxWidget(
                      checked: controller.dto.transfer,
                      onClick: (value) => controller.dto.transfer = value,
                      text: 'Transferir',
                      align: MainAxisAlignment.start,
                    ),
                  )
                : const SizedBox(),
            etapa.recebe == true
                ? Expanded(
                    child: CustomCheckboxWidget(
                      checked: controller.dto.receive,
                      onClick: (value) => controller.dto.receive = value,
                      text: 'Receber',
                      align: MainAxisAlignment.start,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  bool _transfereRecebe() => etapa.transfere == true || etapa.recebe == true;
}

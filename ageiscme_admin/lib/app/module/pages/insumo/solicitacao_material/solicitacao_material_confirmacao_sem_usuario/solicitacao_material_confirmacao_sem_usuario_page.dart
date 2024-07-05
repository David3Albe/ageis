import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_confirmacao_sem_usuario/solicitacao_material_confirmacao_sem_usuario_controller.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialConfirmacaoSemUsuarioPage extends StatelessWidget {
  const SolicitacaoMaterialConfirmacaoSemUsuarioPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final SolicitacaoMaterialConfirmacaoSemUsuarioController _controller =
        SolicitacaoMaterialConfirmacaoSemUsuarioController(context: context);
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title:
          const TitleWidget(text: 'Gerar solicitação sem usuário autorização'),
      content: KeyboardListener(
        onKeyEvent: _controller.coletorHelper.handleKey,
        autofocus: true,
        focusNode: _controller.textNode,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 600,
            maxHeight: 500,
            minHeight: 400,
          ),
          height: size.height * .4,
          width: size.width * .4,
          child: const Column(
            children: [
              const Text(
                'O Usuário não foi informado, deseja incluir a solicitação e autorizar depois?',
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            BarcodeWidget(
              data: 'Cancelar',
              barcode: Barcode.dataMatrix(),
              height: 30,
              width: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            CancelButtonUnfilledWidget(
              onPressed: () => _controller.cancelarSalvamento(context),
            ),
            const Spacer(),
            BarcodeWidget(
              data: 'Confirmar',
              barcode: Barcode.dataMatrix(),
              height: 30,
              width: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
            ),
            ConfirmButtonWidget(
              onPressed: () => _controller.continuarSalvamento(context),
            ),
          ],
        ),
      ],
    );
  }
}

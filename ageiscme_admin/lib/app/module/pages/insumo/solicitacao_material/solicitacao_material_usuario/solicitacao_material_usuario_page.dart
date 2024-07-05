import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material/solicitacao_material_usuario/solicitacao_material_usuario_controller.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialUsuarioPage extends StatefulWidget {
  const SolicitacaoMaterialUsuarioPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SolicitacaoMaterialUsuarioPage> createState() =>
      _SolicitacaoMaterialUsuarioPageState();
}

class _SolicitacaoMaterialUsuarioPageState
    extends State<SolicitacaoMaterialUsuarioPage> {
  late final SolicitacaoMaterialUsuarioController _controller;
  @override
  void initState() {
    _controller = SolicitacaoMaterialUsuarioController(
      context: context,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title: const TitleWidget(text: 'Identificar Usuário'),
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
                'Identifique-se para autorizar a Solicitação de Material',
              ),
              const Expanded(
                child: Center(
                  child: LoadingWidget(),
                ),
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
              onPressed: () => _controller.cancelarLeitura(context),
            ),
          ],
        ),
      ],
    );
  }
}

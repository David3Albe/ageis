import 'package:ageiscme_admin/app/module/pages/cadastro/usuario/usuario_page_frm/usuario_page_frm_user_printer/usuario_page_frm_user_printer_controller.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/print_button_widget.dart';
import 'package:compartilhados/componentes/checkbox/custom_checkbox_widget.dart';

import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class UsuarioPageFrmUserPrinterPage extends StatefulWidget {
  const UsuarioPageFrmUserPrinterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UsuarioPageFrmUserPrinterPage> createState() =>
      _UsuarioPageFrmUserPrinterPageState();
}

class _UsuarioPageFrmUserPrinterPageState
    extends State<UsuarioPageFrmUserPrinterPage> {
  late final UsuarioPageFrmUserPrinterController _controller;
  @override
  void initState() {
    _controller = UsuarioPageFrmUserPrinterController();

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
      title: const TitleWidget(text: 'Impressão de usuários'),
      content: Container(
        height: size.height * .4,
        width: size.width * .4,
        child: Column(
          children: [
            CustomCheckboxWidget(
              checked: _controller.dto.actives,
              onClick: (value) => _controller.dto.actives = value,
              text: 'Ativos',
              align: MainAxisAlignment.start,
            ),
            CustomCheckboxWidget(
              checked: _controller.dto.inactives,
              onClick: (value) => _controller.dto.inactives = value,
              text: 'Inativos',
              align: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
      actions: [
        PrintButtonWidget(
          onPressed: () => _controller.imprimir(context),
        ),
        CancelButtonUnfilledWidget(
          onPressed: () => _controller.cancelarImpressao(context),
        ),
      ],
    );
  }
}

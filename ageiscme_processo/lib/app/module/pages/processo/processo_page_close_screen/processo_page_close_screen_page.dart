import 'package:ageiscme_processo/app/module/pages/processo/processo_page_close_screen/widgets/header/header_widget.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_close_screen/widgets/text/text_widget.dart';
import 'package:compartilhados/componentes/botoes/close_button_widget.dart';
import 'package:compartilhados/custom_text/title_widget.dart';
import 'package:flutter/material.dart';

class ProcessoPageCloseScreenPage extends StatelessWidget {
  const ProcessoPageCloseScreenPage({required this.tempoFecharTela, super.key});
  final int tempoFecharTela;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      title:   Row(
        children: [
          const Expanded(
            child: TitleWidget(
              text: 'Inatividade',
            ),
          ),
          const Spacer(),
          CloseButtonWidget(
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
      content: Container(
        height: size.height * 0.2,
        width: size.height * 0.4,
        constraints: const BoxConstraints(
          minHeight: 200,
          minWidth: 500,
        ),
        child: Column(
          children: [
            HeaderWidget(
              tempoFecharTela: tempoFecharTela,
            ),
            const TextWidget(),
          ],
        ),
      ),
    );
  }
}

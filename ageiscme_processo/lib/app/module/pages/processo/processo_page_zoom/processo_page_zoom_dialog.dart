import 'package:ageiscme_processo/app/module/blocs/processo_leitura_cubit.dart';
import 'package:ageiscme_processo/app/module/pages/processo/processo_page_widgets/processo_page_object_preview/processo_page_object_preview_widget.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:flutter/material.dart';

class ProcessoPageZoomDialog extends StatelessWidget {
  final ProcessoLeituraCubit leituraCubit;
  final FocusNode focusNode = FocusNode();
  ProcessoPageZoomDialog({required this.leituraCubit});
  @override
  Widget build(BuildContext context) {
    final ColetoresHelper coletorHelper = ColetoresHelper(
      onEnter: (str) => handleKey(context),
    );
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      content: KeyboardListener(
        onKeyEvent: coletorHelper.handleKey,
        autofocus: true,
        focusNode: focusNode,
        child: Container(
          height: size.height,
          width: size.width,
          child: ProcessoPageObjectPreviewWidget(
            leituraCubit: leituraCubit,
          ),
        ),
      ),
    );
  }

  void handleKey(BuildContext context) => Navigator.of(context).pop();
}

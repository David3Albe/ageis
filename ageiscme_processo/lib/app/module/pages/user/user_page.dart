import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_processo/app/module/pages/user/widgets/cracha_widget.dart';
import 'package:ageiscme_processo/app/module/pages/user/widgets/start_operation_widget.dart';
import 'package:ageiscme_processo/app/module/services/processo_navigator_service.dart';
import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode _textNode = FocusNode();
    void _enterProcessoScreen(String barCode) {
      if (barCode.startsWith('101')) {
        ProcessoNavigatorService.ToProcessoScreenWithUser(barCode);
      }
    }

    late ColetoresHelper coletorHelper = ColetoresHelper(
      onEnter: (str) => _enterProcessoScreen(str),
      onShortcut: () {
        ProcessoNavigatorService.ToProcessoScreenWithUser('');
      },
      keysIdToPress: [
        LogicalKeyboardKey.controlLeft.keyId,
        LogicalKeyboardKey.shiftLeft.keyId,
        LogicalKeyboardKey.keyP.keyId,
      ],
    );

    return Scaffold(
      backgroundColor: Cores.corFundoAgeis,
      body: KeyboardListener(
        onKeyEvent: coletorHelper.handleKey,
        autofocus: true,
        focusNode: _textNode,
        child: FutureBuilder(
          future: ImagemService().getUrlImage(identificador: 'inicio_processo'),
          builder: (context, snapshot) {
            BoxDecoration box = const BoxDecoration();
            if (snapshot.connectionState != ConnectionState.waiting) {
              box = BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    snapshot.data!,
                  ),
                ),
              );
            }
            return Container(
              decoration: box,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 800,
                    minWidth: 100,
                    maxHeight: 800,
                    minHeight: 100,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Cores.corFundoBranco,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Column(
                      children: [
                        Expanded(child: CrachaWidget()),
                        Expanded(child: StartOperationWidget()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

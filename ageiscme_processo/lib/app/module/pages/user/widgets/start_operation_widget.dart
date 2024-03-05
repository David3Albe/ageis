import 'package:compartilhados/main.dart';
import 'package:flutter/material.dart';

class StartOperationWidget extends StatelessWidget {
  const StartOperationWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 400,
        maxWidth: 800,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Iniciar operação',
              style:
                  Fontes.getRoboto(fontSize: 48, cor: const Color(0xff192E58)),
            ),
            Text(
              'Leia seu crachá para dar início a operação',
              style:
                  Fontes.getRoboto(fontSize: 29, cor: const Color(0xff434242)),
            ),
          ],
        ),
      ),
    );
  }
}

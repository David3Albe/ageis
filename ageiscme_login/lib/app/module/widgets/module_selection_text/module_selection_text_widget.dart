import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:flutter/material.dart';

class ModuleSelectionTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Selecione o módulo:',
      style: Fontes.getRoboto(
        fontSize: 18,
        cor: Cores.corSelecionarModulo,
      ),
    );
  }
}

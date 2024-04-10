import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:flutter/material.dart';

class LerUsuarioController {
  final BuildContext context;
  late final String codBarraUsuario;

  FocusNode textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: (str) => onRead(str, context),
  );

  LerUsuarioController({
    required this.context,
  });

  void cancelarLeitura(BuildContext context) {
    Navigator.of(context).pop(null);
  }

  Future onRead(String barCode, BuildContext context) async {
    if (barCode == 'Cancelar') {
      cancelarLeitura(context);
      return;
    }
    Navigator.of(context).pop(barCode);
  }
}

import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialConfirmacaoSemUsuarioController {
  final BuildContext context;
  late final String codBarraUsuario;

  FocusNode textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper(
    onEnter: (str) => onRead(str, context),
  );

  SolicitacaoMaterialConfirmacaoSemUsuarioController({
    required this.context,
  });

  void cancelarSalvamento(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  void continuarSalvamento(BuildContext context) {
    Navigator.of(context).pop(true);
  }

  Future onRead(String barCode, BuildContext context) async {
    if (barCode == 'Cancelar') {
      cancelarSalvamento(context);
      return;
    } else if (barCode == 'Confirmar') {
      continuarSalvamento(context);
      return;
    }
  }
}

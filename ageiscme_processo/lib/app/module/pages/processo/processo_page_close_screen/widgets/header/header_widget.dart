import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({required this.tempoFecharTela, super.key});
  final int tempoFecharTela;
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      'O CME Processo será encerrado em $tempoFecharTela minutos.',
      style: const TextStyle(color: Colors.red, fontSize: 20),
    );
  }
}

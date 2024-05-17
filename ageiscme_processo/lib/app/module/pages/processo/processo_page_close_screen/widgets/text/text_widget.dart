import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      'Para cancelar, feche o aviso e realize uma leitura',
    );
  }
}

import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitColorWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitColorWidget({
    required this.cor,
  });
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: cor),
    );
  }
}

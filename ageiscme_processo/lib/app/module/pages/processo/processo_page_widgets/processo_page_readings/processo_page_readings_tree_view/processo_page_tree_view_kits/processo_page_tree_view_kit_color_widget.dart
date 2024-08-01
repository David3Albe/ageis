import 'package:flutter/material.dart';

class ProcessoPageTreeViewKitColorWidget extends StatelessWidget {
  const ProcessoPageTreeViewKitColorWidget({
    required this.cor,
  });
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cor,
        border: cor.red == 0 && cor.green == 0 && cor.blue == 0
            ? null
            : Border.all(
                color: Colors.grey,
                width: 1,
              ),
      ),
    );
  }
}

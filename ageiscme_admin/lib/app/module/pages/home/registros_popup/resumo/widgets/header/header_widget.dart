import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(color: Colors.red);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Existem registros com data de validade a expirar em 7 dias ou menos',
          style: style,
        ),
        Text(
          'Para detalhar, basta dar um duplo click sobre o registro',
          style: style,
        ),
        const Padding(padding: EdgeInsets.only(top: 6)),
        const Text(
          'Documentos',
        ),
      ],
    );
  }
}

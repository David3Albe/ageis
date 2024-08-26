import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class CrachaWidget extends StatelessWidget {
  const CrachaWidget({Key? ket});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffD4D7E9),
      ),
      constraints: const BoxConstraints(
        maxHeight: 400,
        maxWidth: 800,
      ),
      child: Center(
        child: Icon(Symbols.badge, size: size.height / 5),
      ),
    );
  }
}
